// Core data models for the Unified Notification Hub
// Generated with Freezed for immutability and JSON serialization

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

const _uuid = Uuid();

@freezed
sealed class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @Default('') String id,
    required String sourceDeviceId,
    required String appName,
    required String title,
    required String content,
    required DateTime timestamp,
    @Default(false) bool isRead,
    @Default(false) bool hasAttachment,
    String? attachmentPath,
    String? attachmentMimeType,
    String? packageName,
    int? notificationId,
    @Default([]) List<String> tags,
    @Default({}) Map<String, dynamic> extras,
    // Quick reply support
    @Default(false) bool supportsQuickReply,
    String? quickReplyPlaceholder,
    List<String>? quickReplyChoices,
    // Action support
    @Default([]) List<NotificationAction> actions,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  // Factory for creating new notifications with generated IDs
  factory NotificationModel.create({
    required String sourceDeviceId,
    required String appName,
    required String title,
    required String content,
    DateTime? timestamp,
    bool hasAttachment = false,
    String? attachmentPath,
    String? attachmentMimeType,
    String? packageName,
    int? notificationId,
    List<String>? tags,
    Map<String, dynamic>? extras,
    bool supportsQuickReply = false,
    String? quickReplyPlaceholder,
    List<String>? quickReplyChoices,
    List<NotificationAction>? actions,
  }) = _NotificationModel;
}

@freezed
sealed class NotificationAction with _$NotificationAction {
  const factory NotificationAction({
    required String id,
    required String label,
    required ActionType type,
    String? payload,
    @Default(true) bool enabled,
  }) = _NotificationAction;

  factory NotificationAction.fromJson(Map<String, dynamic> json) =>
      _$NotificationActionFromJson(json);
}

enum ActionType {
  @JsonValue('dismiss')
  dismiss,
  @JsonValue('reply')
  reply,
  @JsonValue('open')
  open,
  @JsonValue('custom')
  custom,
}

// Grouped notification for UI deduplication
@freezed
sealed class NotificationGroup with _$NotificationGroup {
  const factory NotificationGroup({
    required String signature, // Hash for deduplication
    required List<NotificationModel> notifications,
    @Default(1) int count,
    required DateTime firstSeen,
    required DateTime lastUpdated,
    @Default(false) bool isExpanded,
  }) = _NotificationGroup;

  factory NotificationGroup.fromJson(Map<String, dynamic> json) =>
      _$NotificationGroupFromJson(json);
}

@freezed
sealed class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    @Default('') String id,
    required String name,
    required DevicePlatform platform,
    required String localIp,
    int? port,
    @Default(DeviceConnectionState.disconnected) DeviceConnectionState connectionState,
    required DateTime lastSeen,
    @Default(DevicePermissions.readOnly) DevicePermissions permissions,
    String? publicKey, // For encryption
    @Default({}) Map<String, dynamic> metadata,
    @Default([]) List<String> allowedApps,
    @Default([]) List<String> blockedApps,
    @Default([]) List<String> keywordFilters,
  }) = _DeviceModel;

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  factory DeviceModel.create({
    required String name,
    required DevicePlatform platform,
    required String localIp,
    int? port,
    @Default(DevicePermissions.readOnly) DevicePermissions permissions,
    String? publicKey,
  }) = _DeviceModel;
}

enum DevicePlatform {
  @JsonValue('android')
  android,
  @JsonValue('ios')
  ios,
  @JsonValue('linux')
  linux,
  @JsonValue('macos')
  macos,
  @JsonValue('windows')
  windows,
  @JsonValue('unknown')
  unknown,
}

enum DeviceConnectionState {
  @JsonValue('connected')
  connected,
  @JsonValue('connecting')
  connecting,
  @JsonValue('disconnected')
  disconnected,
  @JsonValue('error')
  error,
  @JsonValue('pairing')
  pairing,
}

enum DevicePermissions {
  @JsonValue('read_only')
  readOnly,
  @JsonValue('actionable')
  actionable,
  @JsonValue('full')
  full,
}

// Pairing data for QR code exchange
@freezed
sealed class PairingData with _$PairingData {
  const factory PairingData({
    required String deviceId,
    required String deviceName,
    required DevicePlatform platform,
    required String localIp,
    required int port,
    required String publicKey,
    required int version,
    required DateTime timestamp,
  }) = _PairingData;

  factory PairingData.fromJson(Map<String, dynamic> json) =>
      _$PairingDataFromJson(json);
}

// Filter settings
@freezed
sealed class FilterSettings with _$FilterSettings {
  const factory FilterSettings({
    @Default([]) List<String> whitelistApps,
    @Default([]) List<String> blacklistApps,
    @Default([]) List<String> keywordWhitelist,
    @Default([]) List<String> keywordBlacklist,
    @Default(true) bool enableDeduplication,
    @Default(DeduplicationWindow.minutes5) DeduplicationWindow dedupWindow,
    @Default(true) bool showSystemNotifications,
    @Default(NotificationPriority.low) NotificationPriority minPriority,
  }) = _FilterSettings;

  factory FilterSettings.fromJson(Map<String, dynamic> json) =>
      _$FilterSettingsFromJson(json);
}

enum DeduplicationWindow {
  @JsonValue('none')
  none,
  @JsonValue('seconds30')
  seconds30,
  @JsonValue('minutes1')
  minutes1,
  @JsonValue('minutes5')
  minutes5,
  @JsonValue('minutes15')
  minutes15,
  @JsonValue('hour1')
  hour1,
}

enum NotificationPriority {
  @JsonValue('low')
  low,
  @JsonValue('normal')
  normal,
  @JsonValue('high')
  high,
  @JsonValue('critical')
  critical,
}

// Archive query parameters
@freezed
sealed class ArchiveQuery with _$ArchiveQuery {
  const factory ArchiveQuery({
    String? searchText,
    List<String>? deviceIds,
    DateTime? startDate,
    DateTime? endDate,
    List<String>? appNames,
    bool? hasAttachment,
    bool? isRead,
    @Default(0) int offset,
    @Default(50) int limit,
    @Default(SortOrder.desc) SortOrder sortOrder,
  }) = _ArchiveQuery;

  factory ArchiveQuery.fromJson(Map<String, dynamic> json) =>
      _$ArchiveQueryFromJson(json);
}

enum SortOrder {
  @JsonValue('asc')
  asc,
  @JsonValue('desc')
  desc,
}