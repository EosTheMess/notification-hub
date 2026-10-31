// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: json['id'] as String? ?? '',
      sourceDeviceId: json['sourceDeviceId'] as String,
      appName: json['appName'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool? ?? false,
      hasAttachment: json['hasAttachment'] as bool? ?? false,
      attachmentPath: json['attachmentPath'] as String?,
      attachmentMimeType: json['attachmentMimeType'] as String?,
      packageName: json['packageName'] as String?,
      notificationId: (json['notificationId'] as num?)?.toInt(),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      extras: json['extras'] as Map<String, dynamic>? ?? const {},
      supportsQuickReply: json['supportsQuickReply'] as bool? ?? false,
      quickReplyPlaceholder: json['quickReplyPlaceholder'] as String?,
      quickReplyChoices: (json['quickReplyChoices'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      actions: (json['actions'] as List<dynamic>?)
              ?.map(
                  (e) => NotificationAction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sourceDeviceId': instance.sourceDeviceId,
      'appName': instance.appName,
      'title': instance.title,
      'content': instance.content,
      'timestamp': instance.timestamp.toIso8601String(),
      'isRead': instance.isRead,
      'hasAttachment': instance.hasAttachment,
      'attachmentPath': instance.attachmentPath,
      'attachmentMimeType': instance.attachmentMimeType,
      'packageName': instance.packageName,
      'notificationId': instance.notificationId,
      'tags': instance.tags,
      'extras': instance.extras,
      'supportsQuickReply': instance.supportsQuickReply,
      'quickReplyPlaceholder': instance.quickReplyPlaceholder,
      'quickReplyChoices': instance.quickReplyChoices,
      'actions': instance.actions,
    };

_$NotificationActionImpl _$$NotificationActionImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationActionImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      type: $enumDecode(_$ActionTypeEnumMap, json['type']),
      payload: json['payload'] as String?,
      enabled: json['enabled'] as bool? ?? true,
    );

Map<String, dynamic> _$$NotificationActionImplToJson(
        _$NotificationActionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'type': _$ActionTypeEnumMap[instance.type]!,
      'payload': instance.payload,
      'enabled': instance.enabled,
    };

const _$ActionTypeEnumMap = {
  ActionType.dismiss: 'dismiss',
  ActionType.reply: 'reply',
  ActionType.open: 'open',
  ActionType.custom: 'custom',
};

_$NotificationGroupImpl _$$NotificationGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationGroupImpl(
      signature: json['signature'] as String,
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt() ?? 1,
      firstSeen: DateTime.parse(json['firstSeen'] as String),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      isExpanded: json['isExpanded'] as bool? ?? false,
    );

Map<String, dynamic> _$$NotificationGroupImplToJson(
        _$NotificationGroupImpl instance) =>
    <String, dynamic>{
      'signature': instance.signature,
      'notifications': instance.notifications,
      'count': instance.count,
      'firstSeen': instance.firstSeen.toIso8601String(),
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'isExpanded': instance.isExpanded,
    };

_$DeviceModelImpl _$$DeviceModelImplFromJson(Map<String, dynamic> json) =>
    _$DeviceModelImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String,
      platform: $enumDecode(_$DevicePlatformEnumMap, json['platform']),
      localIp: json['localIp'] as String,
      port: (json['port'] as num?)?.toInt(),
      connectionState: $enumDecodeNullable(
              _$DeviceConnectionStateEnumMap, json['connectionState']) ??
          DeviceConnectionState.disconnected,
      lastSeen: DateTime.parse(json['lastSeen'] as String),
      permissions: $enumDecodeNullable(
              _$DevicePermissionsEnumMap, json['permissions']) ??
          DevicePermissions.readOnly,
      publicKey: json['publicKey'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      allowedApps: (json['allowedApps'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      blockedApps: (json['blockedApps'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      keywordFilters: (json['keywordFilters'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DeviceModelImplToJson(_$DeviceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'platform': _$DevicePlatformEnumMap[instance.platform]!,
      'localIp': instance.localIp,
      'port': instance.port,
      'connectionState':
          _$DeviceConnectionStateEnumMap[instance.connectionState]!,
      'lastSeen': instance.lastSeen.toIso8601String(),
      'permissions': _$DevicePermissionsEnumMap[instance.permissions]!,
      'publicKey': instance.publicKey,
      'metadata': instance.metadata,
      'allowedApps': instance.allowedApps,
      'blockedApps': instance.blockedApps,
      'keywordFilters': instance.keywordFilters,
    };

const _$DevicePlatformEnumMap = {
  DevicePlatform.android: 'android',
  DevicePlatform.ios: 'ios',
  DevicePlatform.linux: 'linux',
  DevicePlatform.macos: 'macos',
  DevicePlatform.windows: 'windows',
  DevicePlatform.unknown: 'unknown',
};

const _$DeviceConnectionStateEnumMap = {
  DeviceConnectionState.connected: 'connected',
  DeviceConnectionState.connecting: 'connecting',
  DeviceConnectionState.disconnected: 'disconnected',
  DeviceConnectionState.error: 'error',
  DeviceConnectionState.pairing: 'pairing',
};

const _$DevicePermissionsEnumMap = {
  DevicePermissions.readOnly: 'read_only',
  DevicePermissions.actionable: 'actionable',
  DevicePermissions.full: 'full',
};

_$PairingDataImpl _$$PairingDataImplFromJson(Map<String, dynamic> json) =>
    _$PairingDataImpl(
      deviceId: json['deviceId'] as String,
      deviceName: json['deviceName'] as String,
      platform: $enumDecode(_$DevicePlatformEnumMap, json['platform']),
      localIp: json['localIp'] as String,
      port: (json['port'] as num).toInt(),
      publicKey: json['publicKey'] as String,
      version: (json['version'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$PairingDataImplToJson(_$PairingDataImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'deviceName': instance.deviceName,
      'platform': _$DevicePlatformEnumMap[instance.platform]!,
      'localIp': instance.localIp,
      'port': instance.port,
      'publicKey': instance.publicKey,
      'version': instance.version,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_$FilterSettingsImpl _$$FilterSettingsImplFromJson(Map<String, dynamic> json) =>
    _$FilterSettingsImpl(
      whitelistApps: (json['whitelistApps'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      blacklistApps: (json['blacklistApps'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      keywordWhitelist: (json['keywordWhitelist'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      keywordBlacklist: (json['keywordBlacklist'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      enableDeduplication: json['enableDeduplication'] as bool? ?? true,
      dedupWindow: $enumDecodeNullable(
              _$DeduplicationWindowEnumMap, json['dedupWindow']) ??
          DeduplicationWindow.minutes5,
      showSystemNotifications: json['showSystemNotifications'] as bool? ?? true,
      minPriority: $enumDecodeNullable(
              _$NotificationPriorityEnumMap, json['minPriority']) ??
          NotificationPriority.low,
    );

Map<String, dynamic> _$$FilterSettingsImplToJson(
        _$FilterSettingsImpl instance) =>
    <String, dynamic>{
      'whitelistApps': instance.whitelistApps,
      'blacklistApps': instance.blacklistApps,
      'keywordWhitelist': instance.keywordWhitelist,
      'keywordBlacklist': instance.keywordBlacklist,
      'enableDeduplication': instance.enableDeduplication,
      'dedupWindow': _$DeduplicationWindowEnumMap[instance.dedupWindow]!,
      'showSystemNotifications': instance.showSystemNotifications,
      'minPriority': _$NotificationPriorityEnumMap[instance.minPriority]!,
    };

const _$DeduplicationWindowEnumMap = {
  DeduplicationWindow.none: 'none',
  DeduplicationWindow.seconds30: 'seconds30',
  DeduplicationWindow.minutes1: 'minutes1',
  DeduplicationWindow.minutes5: 'minutes5',
  DeduplicationWindow.minutes15: 'minutes15',
  DeduplicationWindow.hour1: 'hour1',
};

const _$NotificationPriorityEnumMap = {
  NotificationPriority.low: 'low',
  NotificationPriority.normal: 'normal',
  NotificationPriority.high: 'high',
  NotificationPriority.critical: 'critical',
};

_$ArchiveQueryImpl _$$ArchiveQueryImplFromJson(Map<String, dynamic> json) =>
    _$ArchiveQueryImpl(
      searchText: json['searchText'] as String?,
      deviceIds: (json['deviceIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      appNames: (json['appNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hasAttachment: json['hasAttachment'] as bool?,
      isRead: json['isRead'] as bool?,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 50,
      sortOrder: $enumDecodeNullable(_$SortOrderEnumMap, json['sortOrder']) ??
          SortOrder.desc,
    );

Map<String, dynamic> _$$ArchiveQueryImplToJson(_$ArchiveQueryImpl instance) =>
    <String, dynamic>{
      'searchText': instance.searchText,
      'deviceIds': instance.deviceIds,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'appNames': instance.appNames,
      'hasAttachment': instance.hasAttachment,
      'isRead': instance.isRead,
      'offset': instance.offset,
      'limit': instance.limit,
      'sortOrder': _$SortOrderEnumMap[instance.sortOrder]!,
    };

const _$SortOrderEnumMap = {
  SortOrder.asc: 'asc',
  SortOrder.desc: 'desc',
};
