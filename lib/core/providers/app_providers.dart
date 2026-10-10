// Main application providers using Riverpod

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/database/app_database.dart';
import '../core/models/notification.dart';
import '../core/network/network_service.dart';
import '../platform/linux_notification_listener.dart';

part 'app_providers.g.dart';

/// Database provider
@riverpod
AppDatabase appDatabase(AppDatabaseRef ref) {
  return AppDatabase();
}

/// Current device ID provider
@riverpod
String deviceId(DeviceIdRef ref) {
  // In a real app, this would be loaded from secure storage
  // For now, generate a consistent ID based on platform
  return 'device_${DateTime.now().millisecondsSinceEpoch}';
}

/// Current device model provider
@riverpod
DeviceModel currentDevice(CurrentDeviceRef ref) {
  final deviceId = ref.watch(deviceIdProvider);
  return DeviceModel.create(
    id: deviceId,
    name: 'My Device',
    platform: DevicePlatform.linux, // Will be overridden per platform
    localIp: '127.0.0.1',
    port: 8765,
    permissions: DevicePermissions.full,
  );
}

/// Filter settings provider
@riverpod
class FilterSettingsNotifier extends _$FilterSettingsNotifier {
  @override
  Future<FilterSettings> build() async {
    final db = ref.watch(appDatabaseProvider);
    final entity = await db.getFilterSettings();
    return FilterSettings(
      whitelistApps: _decodeJsonList(entity.whitelistApps),
      blacklistApps: _decodeJsonList(entity.blacklistApps),
      keywordWhitelist: _decodeJsonList(entity.keywordWhitelist),
      keywordBlacklist: _decodeJsonList(entity.keywordBlacklist),
      enableDeduplication: entity.enableDeduplication,
      dedupWindow: DeduplicationWindow.values.byName(entity.dedupWindow),
      showSystemNotifications: entity.showSystemNotifications,
      minPriority: NotificationPriority.values.byName(entity.minPriority),
    );
  }

  Future<void> updateSettings(FilterSettings settings) async {
    final db = ref.read(appDatabaseProvider);
    await db.updateFilterSettings(FilterSettingsTableCompanion(
      whitelistApps: Value(_encodeJsonList(settings.whitelistApps)),
      blacklistApps: Value(_encodeJsonList(settings.blacklistApps)),
      keywordWhitelist: Value(_encodeJsonList(settings.keywordWhitelist)),
      keywordBlacklist: Value(_encodeJsonList(settings.keywordBlacklist)),
      enableDeduplication: Value(settings.enableDeduplication),
      dedupWindow: Value(settings.dedupWindow.name),
      showSystemNotifications: Value(settings.showSystemNotifications),
      minPriority: Value(settings.minPriority.name),
      updatedAt: Value(DateTime.now()),
    ));
    state = AsyncData(settings);
  }

  List<String> _decodeJsonList(String json) {
    try {
      final list = List<String>.from(jsonDecode(json));
      return list;
    } catch (_) {
      return [];
    }
  }

  String _encodeJsonList(List<String> list) => jsonEncode(list);
}

/// Network service provider
@riverpod
class NetworkServiceNotifier extends _$NetworkServiceNotifier {
  NetworkService? _service;

  @override
  Future<NetworkService?> build() async {
    final deviceId = ref.read(deviceIdProvider);
    final device = ref.read(currentDeviceProvider);
    _service = NetworkService(deviceId, device);
    await _service!.start();
    ref.onDispose(() => _service?.stop());
    return _service;
  }

  Future<void> sendNotification(NotificationModel notification) async {
    await _service?.sendNotification(notification);
  }

  Future<void> sendAction(String deviceId, String notificationId, String actionId, [String? payload]) async {
    await _service?.sendAction(deviceId, notificationId, actionId, payload);
  }
}

/// Notification repository provider
@riverpod
class NotificationRepository extends _$NotificationRepository {
  @override
  Future<void> build() async {
    // Initialize notification listeners
    _startListeners();
  }

  void _startListeners() {
    // Platform-specific listeners would be started here
    // Android: NotificationListenerService
    // iOS: NotificationServiceExtension
    // Linux: DBus listener
  }

  Future<void> addNotification(NotificationModel notification) async {
    final db = ref.read(appDatabaseProvider);
    final companion = NotificationsCompanion.insert(
      id: Value(notification.id),
      sourceDeviceId: Value(notification.sourceDeviceId),
      appName: Value(notification.appName),
      title: Value(notification.title),
      content: Value(notification.content),
      timestamp: Value(notification.timestamp),
      isRead: Value(notification.isRead),
      hasAttachment: Value(notification.hasAttachment),
      attachmentPath: Value(notification.attachmentPath),
      attachmentMimeType: Value(notification.attachmentMimeType),
      packageName: Value(notification.packageName),
      notificationId: Value(notification.notificationId),
      tags: Value(jsonEncode(notification.tags)),
      extras: Value(jsonEncode(notification.extras)),
      supportsQuickReply: Value(notification.supportsQuickReply),
      quickReplyPlaceholder: Value(notification.quickReplyPlaceholder),
      quickReplyChoices: Value(jsonEncode(notification.quickReplyChoices ?? [])),
      actions: Value(jsonEncode(notification.actions.map((a) => a.toJson()).toList())),
    );
    await db.insertNotification(companion);
    
    // Also send to network if from local device
    if (notification.sourceDeviceId == ref.read(deviceIdProvider)) {
      await ref.read(networkServiceNotifierProvider.future)?.sendNotification(notification);
    }
  }

  Future<void> markAsRead(String id) async {
    final db = ref.read(appDatabaseProvider);
    await db.markAsRead(id);
  }

  Future<void> dismissNotification(String id, String sourceDeviceId) async {
    final db = ref.read(appDatabaseProvider);
    await db.deleteNotification(id);
    
    // Send dismiss action to source device if actionable
    final device = await db.getDevice(sourceDeviceId);
    if (device?.permissions == DevicePermissions.actionable || device?.permissions == DevicePermissions.full) {
      await ref.read(networkServiceNotifierProvider.future)?.sendAction(
        sourceDeviceId,
        id,
        'dismiss',
      );
    }
  }

  Future<void> quickReply(String id, String sourceDeviceId, String replyText) async {
    await ref.read(networkServiceNotifierProvider.future)?.sendAction(
      sourceDeviceId,
      id,
      'reply',
      replyText,
    );
  }
}

/// Live notification feed provider with deduplication
@riverpod
class LiveNotificationFeed extends _$LiveNotificationFeed {
  @override
  Stream<List<NotificationGroup>> build() {
    final db = ref.watch(appDatabaseProvider);
    final filterSettings = ref.watch(filterSettingsNotifierProvider);
    
    return filterSettings.when(
      data: (settings) {
        return db.watchNotifications().map((notifications) {
          return _groupNotifications(notifications, settings);
        });
      },
      loading: () => Stream.value([]),
      error: (_, __) => Stream.value([]),
    );
  }

  List<NotificationGroup> _groupNotifications(List<NotificationEntity> notifications, FilterSettings settings) {
    if (!settings.enableDeduplication) {
      return notifications.map((n) => NotificationGroup(
        signature: n.id,
        notifications: [_entityToModel(n)],
        count: 1,
        firstSeen: n.timestamp,
        lastUpdated: n.timestamp,
      )).toList();
    }

    final groups = <String, NotificationGroup>{};
    final windowMs = _dedupWindowToMs(settings.dedupWindow);

    for (final entity in notifications) {
      final model = _entityToModel(entity);
      final signature = _generateSignature(model);
      
      if (groups.containsKey(signature)) {
        final group = groups[signature]!;
        final lastNotification = group.notifications.first;
        final timeDiff = model.timestamp.difference(lastNotification.timestamp).inMilliseconds;
        
        if (timeDiff <= windowMs) {
          // Merge into existing group
          final updatedNotifications = [model, ...group.notifications];
          groups[signature] = group.copyWith(
            notifications: updatedNotifications,
            count: group.count + 1,
            lastUpdated: model.timestamp,
          );
        } else {
          // Create new group
          groups[signature] = NotificationGroup(
            signature: signature,
            notifications: [model],
            count: 1,
            firstSeen: model.timestamp,
            lastUpdated: model.timestamp,
          );
        }
      } else {
        groups[signature] = NotificationGroup(
          signature: signature,
          notifications: [model],
          count: 1,
          firstSeen: model.timestamp,
          lastUpdated: model.timestamp,
        );
      }
    }

    return groups.values.toList()
      ..sort((a, b) => b.lastUpdated.compareTo(a.lastUpdated));
  }

  NotificationModel _entityToModel(NotificationEntity entity) {
    return NotificationModel(
      id: entity.id,
      sourceDeviceId: entity.sourceDeviceId,
      appName: entity.appName,
      title: entity.title,
      content: entity.content,
      timestamp: entity.timestamp,
      isRead: entity.isRead,
      hasAttachment: entity.hasAttachment,
      attachmentPath: entity.attachmentPath,
      attachmentMimeType: entity.attachmentMimeType,
      packageName: entity.packageName,
      notificationId: entity.notificationId,
      tags: _decodeJsonList(entity.tags),
      extras: _decodeJsonMap(entity.extras),
      supportsQuickReply: entity.supportsQuickReply,
      quickReplyPlaceholder: entity.quickReplyPlaceholder,
      quickReplyChoices: _decodeJsonList(entity.quickReplyChoices ?? '[]'),
      actions: _decodeJsonList(entity.actions).map((a) => NotificationAction.fromJson(a as Map<String, dynamic>)).toList(),
    );
  }

  String _generateSignature(NotificationModel notification) {
    // Generate deduplication signature based on app + title + content
    return '${notification.appName}|${notification.title}|${notification.content}'.hashCode.toString();
  }

  int _dedupWindowToMs(DeduplicationWindow window) {
    switch (window) {
      case DeduplicationWindow.none: return 0;
      case DeduplicationWindow.seconds30: return 30 * 1000;
      case DeduplicationWindow.minutes1: return 60 * 1000;
      case DeduplicationWindow.minutes5: return 5 * 60 * 1000;
      case DeduplicationWindow.minutes15: return 15 * 60 * 1000;
      case DeduplicationWindow.hour1: return 60 * 60 * 1000;
    }
  }

  List<String> _decodeJsonList(String json) {
    try {
      return List<String>.from(jsonDecode(json));
    } catch (_) {
      return [];
    }
  }

  Map<String, dynamic> _decodeJsonMap(String json) {
    try {
      return Map<String, dynamic>.from(jsonDecode(json));
    } catch (_) {
      return {};
    }
  }
}

/// Device manager provider
@riverpod
class DeviceManager extends _$DeviceManager {
  @override
  Stream<List<DeviceModel>> build() {
    final db = ref.watch(appDatabaseProvider);
    return db.watchDevices().map((entities) => entities.map(_entityToModel).toList());
  }

  Future<void> addDevice(DeviceModel device) async {
    final db = ref.read(appDatabaseProvider);
    await db.insertDevice(DevicesCompanion.insert(
      id: Value(device.id),
      name: Value(device.name),
      platform: Value(device.platform.name),
      localIp: Value(device.localIp),
      port: Value(device.port),
      connectionState: Value(device.connectionState.name),
      lastSeen: Value(device.lastSeen),
      permissions: Value(device.permissions.name),
      publicKey: Value(device.publicKey),
      metadata: Value(jsonEncode(device.metadata)),
      allowedApps: Value(jsonEncode(device.allowedApps)),
      blockedApps: Value(jsonEncode(device.blockedApps)),
      keywordFilters: Value(jsonEncode(device.keywordFilters)),
    ));
  }

  Future<void> updateDevice(DeviceModel device) async {
    final db = ref.read(appDatabaseProvider);
    await db.updateDevice(DevicesCompanion(
      id: Value(device.id),
      name: Value(device.name),
      platform: Value(device.platform.name),
      localIp: Value(device.localIp),
      port: Value(device.port),
      connectionState: Value(device.connectionState.name),
      lastSeen: Value(device.lastSeen),
      permissions: Value(device.permissions.name),
      publicKey: Value(device.publicKey),
      metadata: Value(jsonEncode(device.metadata)),
      allowedApps: Value(jsonEncode(device.allowedApps)),
      blockedApps: Value(jsonEncode(device.blockedApps)),
      keywordFilters: Value(jsonEncode(device.keywordFilters)),
      updatedAt: Value(DateTime.now()),
    ));
  }

  Future<void> removeDevice(String id) async {
    final db = ref.read(appDatabaseProvider);
    await db.deleteDevice(id);
  }

  Future<void> updateConnectionState(String id, DeviceConnectionState state) async {
    final db = ref.read(appDatabaseProvider);
    await db.updateDeviceConnectionState(id, state);
  }

  DeviceModel _entityToModel(DeviceEntity entity) {
    return DeviceModel(
      id: entity.id,
      name: entity.name,
      platform: DevicePlatform.values.byName(entity.platform),
      localIp: entity.localIp,
      port: entity.port,
      connectionState: DeviceConnectionState.values.byName(entity.connectionState),
      lastSeen: entity.lastSeen,
      permissions: DevicePermissions.values.byName(entity.permissions),
      publicKey: entity.publicKey,
      metadata: _decodeJsonMap(entity.metadata),
      allowedApps: _decodeJsonList(entity.allowedApps),
      blockedApps: _decodeJsonList(entity.blockedApps),
      keywordFilters: _decodeJsonList(entity.keywordFilters),
    );
  }

  List<String> _decodeJsonList(String json) {
    try {
      return List<String>.from(jsonDecode(json));
    } catch (_) {
      return [];
    }
  }

  Map<String, dynamic> _decodeJsonMap(String json) {
    try {
      return Map<String, dynamic>.from(jsonDecode(json));
    } catch (_) {
      return {};
    }
  }
}

/// Archive query provider
@riverpod
class ArchiveProvider extends _$ArchiveProvider {
  @override
  Future<List<NotificationModel>> build(ArchiveQuery query) async {
    final db = ref.read(appDatabaseProvider);
    final entities = await db.getNotificationsByDateRange(
      query.startDate ?? DateTime.now().subtract(const Duration(days: 30)),
      query.endDate ?? DateTime.now(),
      deviceId: query.deviceIds?.firstOrNull,
      appNames: query.appNames,
      hasAttachment: query.hasAttachment,
      isRead: query.isRead,
      limit: query.limit,
      offset: query.offset,
    );
    return entities.map(_entityToModel).toList();
  }

  NotificationModel _entityToModel(NotificationEntity entity) {
    return NotificationModel(
      id: entity.id,
      sourceDeviceId: entity.sourceDeviceId,
      appName: entity.appName,
      title: entity.title,
      content: entity.content,
      timestamp: entity.timestamp,
      isRead: entity.isRead,
      hasAttachment: entity.hasAttachment,
      attachmentPath: entity.attachmentPath,
      attachmentMimeType: entity.attachmentMimeType,
      packageName: entity.packageName,
      notificationId: entity.notificationId,
      tags: _decodeJsonList(entity.tags),
      extras: _decodeJsonMap(entity.extras),
      supportsQuickReply: entity.supportsQuickReply,
      quickReplyPlaceholder: entity.quickReplyPlaceholder,
      quickReplyChoices: _decodeJsonList(entity.quickReplyChoices ?? '[]'),
      actions: _decodeJsonList(entity.actions).map((a) => NotificationAction.fromJson(a as Map<String, dynamic>)).toList(),
    );
  }

  List<String> _decodeJsonList(String json) {
    try {
      return List<String>.from(jsonDecode(json));
    } catch (_) {
      return [];
    }
  }

  Map<String, dynamic> _decodeJsonMap(String json) {
    try {
      return Map<String, dynamic>.from(jsonDecode(json));
    } catch (_) {
      return {};
    }
  }
}