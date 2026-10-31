// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  String get id => throw _privateConstructorUsedError;
  String get sourceDeviceId => throw _privateConstructorUsedError;
  String get appName => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  bool get hasAttachment => throw _privateConstructorUsedError;
  String? get attachmentPath => throw _privateConstructorUsedError;
  String? get attachmentMimeType => throw _privateConstructorUsedError;
  String? get packageName => throw _privateConstructorUsedError;
  int? get notificationId => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  Map<String, dynamic> get extras =>
      throw _privateConstructorUsedError; // Quick reply support
  bool get supportsQuickReply => throw _privateConstructorUsedError;
  String? get quickReplyPlaceholder => throw _privateConstructorUsedError;
  List<String>? get quickReplyChoices =>
      throw _privateConstructorUsedError; // Action support
  List<NotificationAction> get actions => throw _privateConstructorUsedError;

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call(
      {String id,
      String sourceDeviceId,
      String appName,
      String title,
      String content,
      DateTime timestamp,
      bool isRead,
      bool hasAttachment,
      String? attachmentPath,
      String? attachmentMimeType,
      String? packageName,
      int? notificationId,
      List<String> tags,
      Map<String, dynamic> extras,
      bool supportsQuickReply,
      String? quickReplyPlaceholder,
      List<String>? quickReplyChoices,
      List<NotificationAction> actions});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sourceDeviceId = null,
    Object? appName = null,
    Object? title = null,
    Object? content = null,
    Object? timestamp = null,
    Object? isRead = null,
    Object? hasAttachment = null,
    Object? attachmentPath = freezed,
    Object? attachmentMimeType = freezed,
    Object? packageName = freezed,
    Object? notificationId = freezed,
    Object? tags = null,
    Object? extras = null,
    Object? supportsQuickReply = null,
    Object? quickReplyPlaceholder = freezed,
    Object? quickReplyChoices = freezed,
    Object? actions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sourceDeviceId: null == sourceDeviceId
          ? _value.sourceDeviceId
          : sourceDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      hasAttachment: null == hasAttachment
          ? _value.hasAttachment
          : hasAttachment // ignore: cast_nullable_to_non_nullable
              as bool,
      attachmentPath: freezed == attachmentPath
          ? _value.attachmentPath
          : attachmentPath // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentMimeType: freezed == attachmentMimeType
          ? _value.attachmentMimeType
          : attachmentMimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationId: freezed == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      extras: null == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      supportsQuickReply: null == supportsQuickReply
          ? _value.supportsQuickReply
          : supportsQuickReply // ignore: cast_nullable_to_non_nullable
              as bool,
      quickReplyPlaceholder: freezed == quickReplyPlaceholder
          ? _value.quickReplyPlaceholder
          : quickReplyPlaceholder // ignore: cast_nullable_to_non_nullable
              as String?,
      quickReplyChoices: freezed == quickReplyChoices
          ? _value.quickReplyChoices
          : quickReplyChoices // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      actions: null == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<NotificationAction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationModelImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$NotificationModelImplCopyWith(_$NotificationModelImpl value,
          $Res Function(_$NotificationModelImpl) then) =
      __$$NotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sourceDeviceId,
      String appName,
      String title,
      String content,
      DateTime timestamp,
      bool isRead,
      bool hasAttachment,
      String? attachmentPath,
      String? attachmentMimeType,
      String? packageName,
      int? notificationId,
      List<String> tags,
      Map<String, dynamic> extras,
      bool supportsQuickReply,
      String? quickReplyPlaceholder,
      List<String>? quickReplyChoices,
      List<NotificationAction> actions});
}

/// @nodoc
class __$$NotificationModelImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$NotificationModelImpl>
    implements _$$NotificationModelImplCopyWith<$Res> {
  __$$NotificationModelImplCopyWithImpl(_$NotificationModelImpl _value,
      $Res Function(_$NotificationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sourceDeviceId = null,
    Object? appName = null,
    Object? title = null,
    Object? content = null,
    Object? timestamp = null,
    Object? isRead = null,
    Object? hasAttachment = null,
    Object? attachmentPath = freezed,
    Object? attachmentMimeType = freezed,
    Object? packageName = freezed,
    Object? notificationId = freezed,
    Object? tags = null,
    Object? extras = null,
    Object? supportsQuickReply = null,
    Object? quickReplyPlaceholder = freezed,
    Object? quickReplyChoices = freezed,
    Object? actions = null,
  }) {
    return _then(_$NotificationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sourceDeviceId: null == sourceDeviceId
          ? _value.sourceDeviceId
          : sourceDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      hasAttachment: null == hasAttachment
          ? _value.hasAttachment
          : hasAttachment // ignore: cast_nullable_to_non_nullable
              as bool,
      attachmentPath: freezed == attachmentPath
          ? _value.attachmentPath
          : attachmentPath // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentMimeType: freezed == attachmentMimeType
          ? _value.attachmentMimeType
          : attachmentMimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationId: freezed == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      extras: null == extras
          ? _value._extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      supportsQuickReply: null == supportsQuickReply
          ? _value.supportsQuickReply
          : supportsQuickReply // ignore: cast_nullable_to_non_nullable
              as bool,
      quickReplyPlaceholder: freezed == quickReplyPlaceholder
          ? _value.quickReplyPlaceholder
          : quickReplyPlaceholder // ignore: cast_nullable_to_non_nullable
              as String?,
      quickReplyChoices: freezed == quickReplyChoices
          ? _value._quickReplyChoices
          : quickReplyChoices // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      actions: null == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<NotificationAction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationModelImpl implements _NotificationModel {
  const _$NotificationModelImpl(
      {this.id = '',
      required this.sourceDeviceId,
      required this.appName,
      required this.title,
      required this.content,
      required this.timestamp,
      this.isRead = false,
      this.hasAttachment = false,
      this.attachmentPath,
      this.attachmentMimeType,
      this.packageName,
      this.notificationId,
      final List<String> tags = const [],
      final Map<String, dynamic> extras = const {},
      this.supportsQuickReply = false,
      this.quickReplyPlaceholder,
      final List<String>? quickReplyChoices,
      final List<NotificationAction> actions = const []})
      : _tags = tags,
        _extras = extras,
        _quickReplyChoices = quickReplyChoices,
        _actions = actions;

  factory _$NotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String sourceDeviceId;
  @override
  final String appName;
  @override
  final String title;
  @override
  final String content;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final bool isRead;
  @override
  @JsonKey()
  final bool hasAttachment;
  @override
  final String? attachmentPath;
  @override
  final String? attachmentMimeType;
  @override
  final String? packageName;
  @override
  final int? notificationId;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final Map<String, dynamic> _extras;
  @override
  @JsonKey()
  Map<String, dynamic> get extras {
    if (_extras is EqualUnmodifiableMapView) return _extras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_extras);
  }

// Quick reply support
  @override
  @JsonKey()
  final bool supportsQuickReply;
  @override
  final String? quickReplyPlaceholder;
  final List<String>? _quickReplyChoices;
  @override
  List<String>? get quickReplyChoices {
    final value = _quickReplyChoices;
    if (value == null) return null;
    if (_quickReplyChoices is EqualUnmodifiableListView)
      return _quickReplyChoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Action support
  final List<NotificationAction> _actions;
// Action support
  @override
  @JsonKey()
  List<NotificationAction> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  String toString() {
    return 'NotificationModel(id: $id, sourceDeviceId: $sourceDeviceId, appName: $appName, title: $title, content: $content, timestamp: $timestamp, isRead: $isRead, hasAttachment: $hasAttachment, attachmentPath: $attachmentPath, attachmentMimeType: $attachmentMimeType, packageName: $packageName, notificationId: $notificationId, tags: $tags, extras: $extras, supportsQuickReply: $supportsQuickReply, quickReplyPlaceholder: $quickReplyPlaceholder, quickReplyChoices: $quickReplyChoices, actions: $actions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sourceDeviceId, sourceDeviceId) ||
                other.sourceDeviceId == sourceDeviceId) &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.hasAttachment, hasAttachment) ||
                other.hasAttachment == hasAttachment) &&
            (identical(other.attachmentPath, attachmentPath) ||
                other.attachmentPath == attachmentPath) &&
            (identical(other.attachmentMimeType, attachmentMimeType) ||
                other.attachmentMimeType == attachmentMimeType) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._extras, _extras) &&
            (identical(other.supportsQuickReply, supportsQuickReply) ||
                other.supportsQuickReply == supportsQuickReply) &&
            (identical(other.quickReplyPlaceholder, quickReplyPlaceholder) ||
                other.quickReplyPlaceholder == quickReplyPlaceholder) &&
            const DeepCollectionEquality()
                .equals(other._quickReplyChoices, _quickReplyChoices) &&
            const DeepCollectionEquality().equals(other._actions, _actions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sourceDeviceId,
      appName,
      title,
      content,
      timestamp,
      isRead,
      hasAttachment,
      attachmentPath,
      attachmentMimeType,
      packageName,
      notificationId,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_extras),
      supportsQuickReply,
      quickReplyPlaceholder,
      const DeepCollectionEquality().hash(_quickReplyChoices),
      const DeepCollectionEquality().hash(_actions));

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      __$$NotificationModelImplCopyWithImpl<_$NotificationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationModel implements NotificationModel {
  const factory _NotificationModel(
      {final String id,
      required final String sourceDeviceId,
      required final String appName,
      required final String title,
      required final String content,
      required final DateTime timestamp,
      final bool isRead,
      final bool hasAttachment,
      final String? attachmentPath,
      final String? attachmentMimeType,
      final String? packageName,
      final int? notificationId,
      final List<String> tags,
      final Map<String, dynamic> extras,
      final bool supportsQuickReply,
      final String? quickReplyPlaceholder,
      final List<String>? quickReplyChoices,
      final List<NotificationAction> actions}) = _$NotificationModelImpl;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$NotificationModelImpl.fromJson;

  @override
  String get id;
  @override
  String get sourceDeviceId;
  @override
  String get appName;
  @override
  String get title;
  @override
  String get content;
  @override
  DateTime get timestamp;
  @override
  bool get isRead;
  @override
  bool get hasAttachment;
  @override
  String? get attachmentPath;
  @override
  String? get attachmentMimeType;
  @override
  String? get packageName;
  @override
  int? get notificationId;
  @override
  List<String> get tags;
  @override
  Map<String, dynamic> get extras; // Quick reply support
  @override
  bool get supportsQuickReply;
  @override
  String? get quickReplyPlaceholder;
  @override
  List<String>? get quickReplyChoices; // Action support
  @override
  List<NotificationAction> get actions;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationAction _$NotificationActionFromJson(Map<String, dynamic> json) {
  return _NotificationAction.fromJson(json);
}

/// @nodoc
mixin _$NotificationAction {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  ActionType get type => throw _privateConstructorUsedError;
  String? get payload => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;

  /// Serializes this NotificationAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationActionCopyWith<NotificationAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationActionCopyWith<$Res> {
  factory $NotificationActionCopyWith(
          NotificationAction value, $Res Function(NotificationAction) then) =
      _$NotificationActionCopyWithImpl<$Res, NotificationAction>;
  @useResult
  $Res call(
      {String id,
      String label,
      ActionType type,
      String? payload,
      bool enabled});
}

/// @nodoc
class _$NotificationActionCopyWithImpl<$Res, $Val extends NotificationAction>
    implements $NotificationActionCopyWith<$Res> {
  _$NotificationActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? type = null,
    Object? payload = freezed,
    Object? enabled = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActionType,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationActionImplCopyWith<$Res>
    implements $NotificationActionCopyWith<$Res> {
  factory _$$NotificationActionImplCopyWith(_$NotificationActionImpl value,
          $Res Function(_$NotificationActionImpl) then) =
      __$$NotificationActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      ActionType type,
      String? payload,
      bool enabled});
}

/// @nodoc
class __$$NotificationActionImplCopyWithImpl<$Res>
    extends _$NotificationActionCopyWithImpl<$Res, _$NotificationActionImpl>
    implements _$$NotificationActionImplCopyWith<$Res> {
  __$$NotificationActionImplCopyWithImpl(_$NotificationActionImpl _value,
      $Res Function(_$NotificationActionImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? type = null,
    Object? payload = freezed,
    Object? enabled = null,
  }) {
    return _then(_$NotificationActionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActionType,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationActionImpl implements _NotificationAction {
  const _$NotificationActionImpl(
      {required this.id,
      required this.label,
      required this.type,
      this.payload,
      this.enabled = true});

  factory _$NotificationActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationActionImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final ActionType type;
  @override
  final String? payload;
  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString() {
    return 'NotificationAction(id: $id, label: $label, type: $type, payload: $payload, enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationActionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, label, type, payload, enabled);

  /// Create a copy of NotificationAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationActionImplCopyWith<_$NotificationActionImpl> get copyWith =>
      __$$NotificationActionImplCopyWithImpl<_$NotificationActionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationActionImplToJson(
      this,
    );
  }
}

abstract class _NotificationAction implements NotificationAction {
  const factory _NotificationAction(
      {required final String id,
      required final String label,
      required final ActionType type,
      final String? payload,
      final bool enabled}) = _$NotificationActionImpl;

  factory _NotificationAction.fromJson(Map<String, dynamic> json) =
      _$NotificationActionImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  ActionType get type;
  @override
  String? get payload;
  @override
  bool get enabled;

  /// Create a copy of NotificationAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationActionImplCopyWith<_$NotificationActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationGroup _$NotificationGroupFromJson(Map<String, dynamic> json) {
  return _NotificationGroup.fromJson(json);
}

/// @nodoc
mixin _$NotificationGroup {
  String get signature =>
      throw _privateConstructorUsedError; // Hash for deduplication
  List<NotificationModel> get notifications =>
      throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  DateTime get firstSeen => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;

  /// Serializes this NotificationGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationGroupCopyWith<NotificationGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationGroupCopyWith<$Res> {
  factory $NotificationGroupCopyWith(
          NotificationGroup value, $Res Function(NotificationGroup) then) =
      _$NotificationGroupCopyWithImpl<$Res, NotificationGroup>;
  @useResult
  $Res call(
      {String signature,
      List<NotificationModel> notifications,
      int count,
      DateTime firstSeen,
      DateTime lastUpdated,
      bool isExpanded});
}

/// @nodoc
class _$NotificationGroupCopyWithImpl<$Res, $Val extends NotificationGroup>
    implements $NotificationGroupCopyWith<$Res> {
  _$NotificationGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signature = null,
    Object? notifications = null,
    Object? count = null,
    Object? firstSeen = null,
    Object? lastUpdated = null,
    Object? isExpanded = null,
  }) {
    return _then(_value.copyWith(
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      firstSeen: null == firstSeen
          ? _value.firstSeen
          : firstSeen // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationGroupImplCopyWith<$Res>
    implements $NotificationGroupCopyWith<$Res> {
  factory _$$NotificationGroupImplCopyWith(_$NotificationGroupImpl value,
          $Res Function(_$NotificationGroupImpl) then) =
      __$$NotificationGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String signature,
      List<NotificationModel> notifications,
      int count,
      DateTime firstSeen,
      DateTime lastUpdated,
      bool isExpanded});
}

/// @nodoc
class __$$NotificationGroupImplCopyWithImpl<$Res>
    extends _$NotificationGroupCopyWithImpl<$Res, _$NotificationGroupImpl>
    implements _$$NotificationGroupImplCopyWith<$Res> {
  __$$NotificationGroupImplCopyWithImpl(_$NotificationGroupImpl _value,
      $Res Function(_$NotificationGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signature = null,
    Object? notifications = null,
    Object? count = null,
    Object? firstSeen = null,
    Object? lastUpdated = null,
    Object? isExpanded = null,
  }) {
    return _then(_$NotificationGroupImpl(
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      firstSeen: null == firstSeen
          ? _value.firstSeen
          : firstSeen // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationGroupImpl implements _NotificationGroup {
  const _$NotificationGroupImpl(
      {required this.signature,
      required final List<NotificationModel> notifications,
      this.count = 1,
      required this.firstSeen,
      required this.lastUpdated,
      this.isExpanded = false})
      : _notifications = notifications;

  factory _$NotificationGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationGroupImplFromJson(json);

  @override
  final String signature;
// Hash for deduplication
  final List<NotificationModel> _notifications;
// Hash for deduplication
  @override
  List<NotificationModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  @JsonKey()
  final int count;
  @override
  final DateTime firstSeen;
  @override
  final DateTime lastUpdated;
  @override
  @JsonKey()
  final bool isExpanded;

  @override
  String toString() {
    return 'NotificationGroup(signature: $signature, notifications: $notifications, count: $count, firstSeen: $firstSeen, lastUpdated: $lastUpdated, isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationGroupImpl &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.firstSeen, firstSeen) ||
                other.firstSeen == firstSeen) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      signature,
      const DeepCollectionEquality().hash(_notifications),
      count,
      firstSeen,
      lastUpdated,
      isExpanded);

  /// Create a copy of NotificationGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationGroupImplCopyWith<_$NotificationGroupImpl> get copyWith =>
      __$$NotificationGroupImplCopyWithImpl<_$NotificationGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationGroupImplToJson(
      this,
    );
  }
}

abstract class _NotificationGroup implements NotificationGroup {
  const factory _NotificationGroup(
      {required final String signature,
      required final List<NotificationModel> notifications,
      final int count,
      required final DateTime firstSeen,
      required final DateTime lastUpdated,
      final bool isExpanded}) = _$NotificationGroupImpl;

  factory _NotificationGroup.fromJson(Map<String, dynamic> json) =
      _$NotificationGroupImpl.fromJson;

  @override
  String get signature; // Hash for deduplication
  @override
  List<NotificationModel> get notifications;
  @override
  int get count;
  @override
  DateTime get firstSeen;
  @override
  DateTime get lastUpdated;
  @override
  bool get isExpanded;

  /// Create a copy of NotificationGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationGroupImplCopyWith<_$NotificationGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) {
  return _DeviceModel.fromJson(json);
}

/// @nodoc
mixin _$DeviceModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DevicePlatform get platform => throw _privateConstructorUsedError;
  String get localIp => throw _privateConstructorUsedError;
  int? get port => throw _privateConstructorUsedError;
  DeviceConnectionState get connectionState =>
      throw _privateConstructorUsedError;
  DateTime get lastSeen => throw _privateConstructorUsedError;
  DevicePermissions get permissions => throw _privateConstructorUsedError;
  String? get publicKey => throw _privateConstructorUsedError; // For encryption
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  List<String> get allowedApps => throw _privateConstructorUsedError;
  List<String> get blockedApps => throw _privateConstructorUsedError;
  List<String> get keywordFilters => throw _privateConstructorUsedError;

  /// Serializes this DeviceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceModelCopyWith<DeviceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceModelCopyWith<$Res> {
  factory $DeviceModelCopyWith(
          DeviceModel value, $Res Function(DeviceModel) then) =
      _$DeviceModelCopyWithImpl<$Res, DeviceModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      DevicePlatform platform,
      String localIp,
      int? port,
      DeviceConnectionState connectionState,
      DateTime lastSeen,
      DevicePermissions permissions,
      String? publicKey,
      Map<String, dynamic> metadata,
      List<String> allowedApps,
      List<String> blockedApps,
      List<String> keywordFilters});
}

/// @nodoc
class _$DeviceModelCopyWithImpl<$Res, $Val extends DeviceModel>
    implements $DeviceModelCopyWith<$Res> {
  _$DeviceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? platform = null,
    Object? localIp = null,
    Object? port = freezed,
    Object? connectionState = null,
    Object? lastSeen = null,
    Object? permissions = null,
    Object? publicKey = freezed,
    Object? metadata = null,
    Object? allowedApps = null,
    Object? blockedApps = null,
    Object? keywordFilters = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as DevicePlatform,
      localIp: null == localIp
          ? _value.localIp
          : localIp // ignore: cast_nullable_to_non_nullable
              as String,
      port: freezed == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
      connectionState: null == connectionState
          ? _value.connectionState
          : connectionState // ignore: cast_nullable_to_non_nullable
              as DeviceConnectionState,
      lastSeen: null == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as DevicePermissions,
      publicKey: freezed == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      allowedApps: null == allowedApps
          ? _value.allowedApps
          : allowedApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedApps: null == blockedApps
          ? _value.blockedApps
          : blockedApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      keywordFilters: null == keywordFilters
          ? _value.keywordFilters
          : keywordFilters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceModelImplCopyWith<$Res>
    implements $DeviceModelCopyWith<$Res> {
  factory _$$DeviceModelImplCopyWith(
          _$DeviceModelImpl value, $Res Function(_$DeviceModelImpl) then) =
      __$$DeviceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DevicePlatform platform,
      String localIp,
      int? port,
      DeviceConnectionState connectionState,
      DateTime lastSeen,
      DevicePermissions permissions,
      String? publicKey,
      Map<String, dynamic> metadata,
      List<String> allowedApps,
      List<String> blockedApps,
      List<String> keywordFilters});
}

/// @nodoc
class __$$DeviceModelImplCopyWithImpl<$Res>
    extends _$DeviceModelCopyWithImpl<$Res, _$DeviceModelImpl>
    implements _$$DeviceModelImplCopyWith<$Res> {
  __$$DeviceModelImplCopyWithImpl(
      _$DeviceModelImpl _value, $Res Function(_$DeviceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? platform = null,
    Object? localIp = null,
    Object? port = freezed,
    Object? connectionState = null,
    Object? lastSeen = null,
    Object? permissions = null,
    Object? publicKey = freezed,
    Object? metadata = null,
    Object? allowedApps = null,
    Object? blockedApps = null,
    Object? keywordFilters = null,
  }) {
    return _then(_$DeviceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as DevicePlatform,
      localIp: null == localIp
          ? _value.localIp
          : localIp // ignore: cast_nullable_to_non_nullable
              as String,
      port: freezed == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
      connectionState: null == connectionState
          ? _value.connectionState
          : connectionState // ignore: cast_nullable_to_non_nullable
              as DeviceConnectionState,
      lastSeen: null == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as DevicePermissions,
      publicKey: freezed == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      allowedApps: null == allowedApps
          ? _value._allowedApps
          : allowedApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedApps: null == blockedApps
          ? _value._blockedApps
          : blockedApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      keywordFilters: null == keywordFilters
          ? _value._keywordFilters
          : keywordFilters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceModelImpl implements _DeviceModel {
  const _$DeviceModelImpl(
      {this.id = '',
      required this.name,
      required this.platform,
      required this.localIp,
      this.port,
      this.connectionState = DeviceConnectionState.disconnected,
      required this.lastSeen,
      this.permissions = DevicePermissions.readOnly,
      this.publicKey,
      final Map<String, dynamic> metadata = const {},
      final List<String> allowedApps = const [],
      final List<String> blockedApps = const [],
      final List<String> keywordFilters = const []})
      : _metadata = metadata,
        _allowedApps = allowedApps,
        _blockedApps = blockedApps,
        _keywordFilters = keywordFilters;

  factory _$DeviceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String name;
  @override
  final DevicePlatform platform;
  @override
  final String localIp;
  @override
  final int? port;
  @override
  @JsonKey()
  final DeviceConnectionState connectionState;
  @override
  final DateTime lastSeen;
  @override
  @JsonKey()
  final DevicePermissions permissions;
  @override
  final String? publicKey;
// For encryption
  final Map<String, dynamic> _metadata;
// For encryption
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  final List<String> _allowedApps;
  @override
  @JsonKey()
  List<String> get allowedApps {
    if (_allowedApps is EqualUnmodifiableListView) return _allowedApps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedApps);
  }

  final List<String> _blockedApps;
  @override
  @JsonKey()
  List<String> get blockedApps {
    if (_blockedApps is EqualUnmodifiableListView) return _blockedApps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockedApps);
  }

  final List<String> _keywordFilters;
  @override
  @JsonKey()
  List<String> get keywordFilters {
    if (_keywordFilters is EqualUnmodifiableListView) return _keywordFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywordFilters);
  }

  @override
  String toString() {
    return 'DeviceModel(id: $id, name: $name, platform: $platform, localIp: $localIp, port: $port, connectionState: $connectionState, lastSeen: $lastSeen, permissions: $permissions, publicKey: $publicKey, metadata: $metadata, allowedApps: $allowedApps, blockedApps: $blockedApps, keywordFilters: $keywordFilters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.localIp, localIp) || other.localIp == localIp) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.connectionState, connectionState) ||
                other.connectionState == connectionState) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions) &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality()
                .equals(other._allowedApps, _allowedApps) &&
            const DeepCollectionEquality()
                .equals(other._blockedApps, _blockedApps) &&
            const DeepCollectionEquality()
                .equals(other._keywordFilters, _keywordFilters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      platform,
      localIp,
      port,
      connectionState,
      lastSeen,
      permissions,
      publicKey,
      const DeepCollectionEquality().hash(_metadata),
      const DeepCollectionEquality().hash(_allowedApps),
      const DeepCollectionEquality().hash(_blockedApps),
      const DeepCollectionEquality().hash(_keywordFilters));

  /// Create a copy of DeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceModelImplCopyWith<_$DeviceModelImpl> get copyWith =>
      __$$DeviceModelImplCopyWithImpl<_$DeviceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceModelImplToJson(
      this,
    );
  }
}

abstract class _DeviceModel implements DeviceModel {
  const factory _DeviceModel(
      {final String id,
      required final String name,
      required final DevicePlatform platform,
      required final String localIp,
      final int? port,
      final DeviceConnectionState connectionState,
      required final DateTime lastSeen,
      final DevicePermissions permissions,
      final String? publicKey,
      final Map<String, dynamic> metadata,
      final List<String> allowedApps,
      final List<String> blockedApps,
      final List<String> keywordFilters}) = _$DeviceModelImpl;

  factory _DeviceModel.fromJson(Map<String, dynamic> json) =
      _$DeviceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DevicePlatform get platform;
  @override
  String get localIp;
  @override
  int? get port;
  @override
  DeviceConnectionState get connectionState;
  @override
  DateTime get lastSeen;
  @override
  DevicePermissions get permissions;
  @override
  String? get publicKey; // For encryption
  @override
  Map<String, dynamic> get metadata;
  @override
  List<String> get allowedApps;
  @override
  List<String> get blockedApps;
  @override
  List<String> get keywordFilters;

  /// Create a copy of DeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceModelImplCopyWith<_$DeviceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PairingData _$PairingDataFromJson(Map<String, dynamic> json) {
  return _PairingData.fromJson(json);
}

/// @nodoc
mixin _$PairingData {
  String get deviceId => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;
  DevicePlatform get platform => throw _privateConstructorUsedError;
  String get localIp => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  String get publicKey => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this PairingData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PairingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PairingDataCopyWith<PairingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PairingDataCopyWith<$Res> {
  factory $PairingDataCopyWith(
          PairingData value, $Res Function(PairingData) then) =
      _$PairingDataCopyWithImpl<$Res, PairingData>;
  @useResult
  $Res call(
      {String deviceId,
      String deviceName,
      DevicePlatform platform,
      String localIp,
      int port,
      String publicKey,
      int version,
      DateTime timestamp});
}

/// @nodoc
class _$PairingDataCopyWithImpl<$Res, $Val extends PairingData>
    implements $PairingDataCopyWith<$Res> {
  _$PairingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PairingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? deviceName = null,
    Object? platform = null,
    Object? localIp = null,
    Object? port = null,
    Object? publicKey = null,
    Object? version = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as DevicePlatform,
      localIp: null == localIp
          ? _value.localIp
          : localIp // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PairingDataImplCopyWith<$Res>
    implements $PairingDataCopyWith<$Res> {
  factory _$$PairingDataImplCopyWith(
          _$PairingDataImpl value, $Res Function(_$PairingDataImpl) then) =
      __$$PairingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deviceId,
      String deviceName,
      DevicePlatform platform,
      String localIp,
      int port,
      String publicKey,
      int version,
      DateTime timestamp});
}

/// @nodoc
class __$$PairingDataImplCopyWithImpl<$Res>
    extends _$PairingDataCopyWithImpl<$Res, _$PairingDataImpl>
    implements _$$PairingDataImplCopyWith<$Res> {
  __$$PairingDataImplCopyWithImpl(
      _$PairingDataImpl _value, $Res Function(_$PairingDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PairingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? deviceName = null,
    Object? platform = null,
    Object? localIp = null,
    Object? port = null,
    Object? publicKey = null,
    Object? version = null,
    Object? timestamp = null,
  }) {
    return _then(_$PairingDataImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as DevicePlatform,
      localIp: null == localIp
          ? _value.localIp
          : localIp // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PairingDataImpl implements _PairingData {
  const _$PairingDataImpl(
      {required this.deviceId,
      required this.deviceName,
      required this.platform,
      required this.localIp,
      required this.port,
      required this.publicKey,
      required this.version,
      required this.timestamp});

  factory _$PairingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PairingDataImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String deviceName;
  @override
  final DevicePlatform platform;
  @override
  final String localIp;
  @override
  final int port;
  @override
  final String publicKey;
  @override
  final int version;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'PairingData(deviceId: $deviceId, deviceName: $deviceName, platform: $platform, localIp: $localIp, port: $port, publicKey: $publicKey, version: $version, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PairingDataImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.localIp, localIp) || other.localIp == localIp) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, deviceName, platform,
      localIp, port, publicKey, version, timestamp);

  /// Create a copy of PairingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PairingDataImplCopyWith<_$PairingDataImpl> get copyWith =>
      __$$PairingDataImplCopyWithImpl<_$PairingDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PairingDataImplToJson(
      this,
    );
  }
}

abstract class _PairingData implements PairingData {
  const factory _PairingData(
      {required final String deviceId,
      required final String deviceName,
      required final DevicePlatform platform,
      required final String localIp,
      required final int port,
      required final String publicKey,
      required final int version,
      required final DateTime timestamp}) = _$PairingDataImpl;

  factory _PairingData.fromJson(Map<String, dynamic> json) =
      _$PairingDataImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get deviceName;
  @override
  DevicePlatform get platform;
  @override
  String get localIp;
  @override
  int get port;
  @override
  String get publicKey;
  @override
  int get version;
  @override
  DateTime get timestamp;

  /// Create a copy of PairingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PairingDataImplCopyWith<_$PairingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FilterSettings _$FilterSettingsFromJson(Map<String, dynamic> json) {
  return _FilterSettings.fromJson(json);
}

/// @nodoc
mixin _$FilterSettings {
  List<String> get whitelistApps => throw _privateConstructorUsedError;
  List<String> get blacklistApps => throw _privateConstructorUsedError;
  List<String> get keywordWhitelist => throw _privateConstructorUsedError;
  List<String> get keywordBlacklist => throw _privateConstructorUsedError;
  bool get enableDeduplication => throw _privateConstructorUsedError;
  DeduplicationWindow get dedupWindow => throw _privateConstructorUsedError;
  bool get showSystemNotifications => throw _privateConstructorUsedError;
  NotificationPriority get minPriority => throw _privateConstructorUsedError;

  /// Serializes this FilterSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterSettingsCopyWith<FilterSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterSettingsCopyWith<$Res> {
  factory $FilterSettingsCopyWith(
          FilterSettings value, $Res Function(FilterSettings) then) =
      _$FilterSettingsCopyWithImpl<$Res, FilterSettings>;
  @useResult
  $Res call(
      {List<String> whitelistApps,
      List<String> blacklistApps,
      List<String> keywordWhitelist,
      List<String> keywordBlacklist,
      bool enableDeduplication,
      DeduplicationWindow dedupWindow,
      bool showSystemNotifications,
      NotificationPriority minPriority});
}

/// @nodoc
class _$FilterSettingsCopyWithImpl<$Res, $Val extends FilterSettings>
    implements $FilterSettingsCopyWith<$Res> {
  _$FilterSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? whitelistApps = null,
    Object? blacklistApps = null,
    Object? keywordWhitelist = null,
    Object? keywordBlacklist = null,
    Object? enableDeduplication = null,
    Object? dedupWindow = null,
    Object? showSystemNotifications = null,
    Object? minPriority = null,
  }) {
    return _then(_value.copyWith(
      whitelistApps: null == whitelistApps
          ? _value.whitelistApps
          : whitelistApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blacklistApps: null == blacklistApps
          ? _value.blacklistApps
          : blacklistApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      keywordWhitelist: null == keywordWhitelist
          ? _value.keywordWhitelist
          : keywordWhitelist // ignore: cast_nullable_to_non_nullable
              as List<String>,
      keywordBlacklist: null == keywordBlacklist
          ? _value.keywordBlacklist
          : keywordBlacklist // ignore: cast_nullable_to_non_nullable
              as List<String>,
      enableDeduplication: null == enableDeduplication
          ? _value.enableDeduplication
          : enableDeduplication // ignore: cast_nullable_to_non_nullable
              as bool,
      dedupWindow: null == dedupWindow
          ? _value.dedupWindow
          : dedupWindow // ignore: cast_nullable_to_non_nullable
              as DeduplicationWindow,
      showSystemNotifications: null == showSystemNotifications
          ? _value.showSystemNotifications
          : showSystemNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      minPriority: null == minPriority
          ? _value.minPriority
          : minPriority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterSettingsImplCopyWith<$Res>
    implements $FilterSettingsCopyWith<$Res> {
  factory _$$FilterSettingsImplCopyWith(_$FilterSettingsImpl value,
          $Res Function(_$FilterSettingsImpl) then) =
      __$$FilterSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> whitelistApps,
      List<String> blacklistApps,
      List<String> keywordWhitelist,
      List<String> keywordBlacklist,
      bool enableDeduplication,
      DeduplicationWindow dedupWindow,
      bool showSystemNotifications,
      NotificationPriority minPriority});
}

/// @nodoc
class __$$FilterSettingsImplCopyWithImpl<$Res>
    extends _$FilterSettingsCopyWithImpl<$Res, _$FilterSettingsImpl>
    implements _$$FilterSettingsImplCopyWith<$Res> {
  __$$FilterSettingsImplCopyWithImpl(
      _$FilterSettingsImpl _value, $Res Function(_$FilterSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilterSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? whitelistApps = null,
    Object? blacklistApps = null,
    Object? keywordWhitelist = null,
    Object? keywordBlacklist = null,
    Object? enableDeduplication = null,
    Object? dedupWindow = null,
    Object? showSystemNotifications = null,
    Object? minPriority = null,
  }) {
    return _then(_$FilterSettingsImpl(
      whitelistApps: null == whitelistApps
          ? _value._whitelistApps
          : whitelistApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blacklistApps: null == blacklistApps
          ? _value._blacklistApps
          : blacklistApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      keywordWhitelist: null == keywordWhitelist
          ? _value._keywordWhitelist
          : keywordWhitelist // ignore: cast_nullable_to_non_nullable
              as List<String>,
      keywordBlacklist: null == keywordBlacklist
          ? _value._keywordBlacklist
          : keywordBlacklist // ignore: cast_nullable_to_non_nullable
              as List<String>,
      enableDeduplication: null == enableDeduplication
          ? _value.enableDeduplication
          : enableDeduplication // ignore: cast_nullable_to_non_nullable
              as bool,
      dedupWindow: null == dedupWindow
          ? _value.dedupWindow
          : dedupWindow // ignore: cast_nullable_to_non_nullable
              as DeduplicationWindow,
      showSystemNotifications: null == showSystemNotifications
          ? _value.showSystemNotifications
          : showSystemNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      minPriority: null == minPriority
          ? _value.minPriority
          : minPriority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterSettingsImpl implements _FilterSettings {
  const _$FilterSettingsImpl(
      {final List<String> whitelistApps = const [],
      final List<String> blacklistApps = const [],
      final List<String> keywordWhitelist = const [],
      final List<String> keywordBlacklist = const [],
      this.enableDeduplication = true,
      this.dedupWindow = DeduplicationWindow.minutes5,
      this.showSystemNotifications = true,
      this.minPriority = NotificationPriority.low})
      : _whitelistApps = whitelistApps,
        _blacklistApps = blacklistApps,
        _keywordWhitelist = keywordWhitelist,
        _keywordBlacklist = keywordBlacklist;

  factory _$FilterSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterSettingsImplFromJson(json);

  final List<String> _whitelistApps;
  @override
  @JsonKey()
  List<String> get whitelistApps {
    if (_whitelistApps is EqualUnmodifiableListView) return _whitelistApps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_whitelistApps);
  }

  final List<String> _blacklistApps;
  @override
  @JsonKey()
  List<String> get blacklistApps {
    if (_blacklistApps is EqualUnmodifiableListView) return _blacklistApps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blacklistApps);
  }

  final List<String> _keywordWhitelist;
  @override
  @JsonKey()
  List<String> get keywordWhitelist {
    if (_keywordWhitelist is EqualUnmodifiableListView)
      return _keywordWhitelist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywordWhitelist);
  }

  final List<String> _keywordBlacklist;
  @override
  @JsonKey()
  List<String> get keywordBlacklist {
    if (_keywordBlacklist is EqualUnmodifiableListView)
      return _keywordBlacklist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywordBlacklist);
  }

  @override
  @JsonKey()
  final bool enableDeduplication;
  @override
  @JsonKey()
  final DeduplicationWindow dedupWindow;
  @override
  @JsonKey()
  final bool showSystemNotifications;
  @override
  @JsonKey()
  final NotificationPriority minPriority;

  @override
  String toString() {
    return 'FilterSettings(whitelistApps: $whitelistApps, blacklistApps: $blacklistApps, keywordWhitelist: $keywordWhitelist, keywordBlacklist: $keywordBlacklist, enableDeduplication: $enableDeduplication, dedupWindow: $dedupWindow, showSystemNotifications: $showSystemNotifications, minPriority: $minPriority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterSettingsImpl &&
            const DeepCollectionEquality()
                .equals(other._whitelistApps, _whitelistApps) &&
            const DeepCollectionEquality()
                .equals(other._blacklistApps, _blacklistApps) &&
            const DeepCollectionEquality()
                .equals(other._keywordWhitelist, _keywordWhitelist) &&
            const DeepCollectionEquality()
                .equals(other._keywordBlacklist, _keywordBlacklist) &&
            (identical(other.enableDeduplication, enableDeduplication) ||
                other.enableDeduplication == enableDeduplication) &&
            (identical(other.dedupWindow, dedupWindow) ||
                other.dedupWindow == dedupWindow) &&
            (identical(
                    other.showSystemNotifications, showSystemNotifications) ||
                other.showSystemNotifications == showSystemNotifications) &&
            (identical(other.minPriority, minPriority) ||
                other.minPriority == minPriority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_whitelistApps),
      const DeepCollectionEquality().hash(_blacklistApps),
      const DeepCollectionEquality().hash(_keywordWhitelist),
      const DeepCollectionEquality().hash(_keywordBlacklist),
      enableDeduplication,
      dedupWindow,
      showSystemNotifications,
      minPriority);

  /// Create a copy of FilterSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterSettingsImplCopyWith<_$FilterSettingsImpl> get copyWith =>
      __$$FilterSettingsImplCopyWithImpl<_$FilterSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterSettingsImplToJson(
      this,
    );
  }
}

abstract class _FilterSettings implements FilterSettings {
  const factory _FilterSettings(
      {final List<String> whitelistApps,
      final List<String> blacklistApps,
      final List<String> keywordWhitelist,
      final List<String> keywordBlacklist,
      final bool enableDeduplication,
      final DeduplicationWindow dedupWindow,
      final bool showSystemNotifications,
      final NotificationPriority minPriority}) = _$FilterSettingsImpl;

  factory _FilterSettings.fromJson(Map<String, dynamic> json) =
      _$FilterSettingsImpl.fromJson;

  @override
  List<String> get whitelistApps;
  @override
  List<String> get blacklistApps;
  @override
  List<String> get keywordWhitelist;
  @override
  List<String> get keywordBlacklist;
  @override
  bool get enableDeduplication;
  @override
  DeduplicationWindow get dedupWindow;
  @override
  bool get showSystemNotifications;
  @override
  NotificationPriority get minPriority;

  /// Create a copy of FilterSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterSettingsImplCopyWith<_$FilterSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArchiveQuery _$ArchiveQueryFromJson(Map<String, dynamic> json) {
  return _ArchiveQuery.fromJson(json);
}

/// @nodoc
mixin _$ArchiveQuery {
  String? get searchText => throw _privateConstructorUsedError;
  List<String>? get deviceIds => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  List<String>? get appNames => throw _privateConstructorUsedError;
  bool? get hasAttachment => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  SortOrder get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this ArchiveQuery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArchiveQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArchiveQueryCopyWith<ArchiveQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArchiveQueryCopyWith<$Res> {
  factory $ArchiveQueryCopyWith(
          ArchiveQuery value, $Res Function(ArchiveQuery) then) =
      _$ArchiveQueryCopyWithImpl<$Res, ArchiveQuery>;
  @useResult
  $Res call(
      {String? searchText,
      List<String>? deviceIds,
      DateTime? startDate,
      DateTime? endDate,
      List<String>? appNames,
      bool? hasAttachment,
      bool? isRead,
      int offset,
      int limit,
      SortOrder sortOrder});
}

/// @nodoc
class _$ArchiveQueryCopyWithImpl<$Res, $Val extends ArchiveQuery>
    implements $ArchiveQueryCopyWith<$Res> {
  _$ArchiveQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArchiveQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = freezed,
    Object? deviceIds = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? appNames = freezed,
    Object? hasAttachment = freezed,
    Object? isRead = freezed,
    Object? offset = null,
    Object? limit = null,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceIds: freezed == deviceIds
          ? _value.deviceIds
          : deviceIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      appNames: freezed == appNames
          ? _value.appNames
          : appNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      hasAttachment: freezed == hasAttachment
          ? _value.hasAttachment
          : hasAttachment // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArchiveQueryImplCopyWith<$Res>
    implements $ArchiveQueryCopyWith<$Res> {
  factory _$$ArchiveQueryImplCopyWith(
          _$ArchiveQueryImpl value, $Res Function(_$ArchiveQueryImpl) then) =
      __$$ArchiveQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? searchText,
      List<String>? deviceIds,
      DateTime? startDate,
      DateTime? endDate,
      List<String>? appNames,
      bool? hasAttachment,
      bool? isRead,
      int offset,
      int limit,
      SortOrder sortOrder});
}

/// @nodoc
class __$$ArchiveQueryImplCopyWithImpl<$Res>
    extends _$ArchiveQueryCopyWithImpl<$Res, _$ArchiveQueryImpl>
    implements _$$ArchiveQueryImplCopyWith<$Res> {
  __$$ArchiveQueryImplCopyWithImpl(
      _$ArchiveQueryImpl _value, $Res Function(_$ArchiveQueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArchiveQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = freezed,
    Object? deviceIds = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? appNames = freezed,
    Object? hasAttachment = freezed,
    Object? isRead = freezed,
    Object? offset = null,
    Object? limit = null,
    Object? sortOrder = null,
  }) {
    return _then(_$ArchiveQueryImpl(
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceIds: freezed == deviceIds
          ? _value._deviceIds
          : deviceIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      appNames: freezed == appNames
          ? _value._appNames
          : appNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      hasAttachment: freezed == hasAttachment
          ? _value.hasAttachment
          : hasAttachment // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArchiveQueryImpl implements _ArchiveQuery {
  const _$ArchiveQueryImpl(
      {this.searchText,
      final List<String>? deviceIds,
      this.startDate,
      this.endDate,
      final List<String>? appNames,
      this.hasAttachment,
      this.isRead,
      this.offset = 0,
      this.limit = 50,
      this.sortOrder = SortOrder.desc})
      : _deviceIds = deviceIds,
        _appNames = appNames;

  factory _$ArchiveQueryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArchiveQueryImplFromJson(json);

  @override
  final String? searchText;
  final List<String>? _deviceIds;
  @override
  List<String>? get deviceIds {
    final value = _deviceIds;
    if (value == null) return null;
    if (_deviceIds is EqualUnmodifiableListView) return _deviceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  final List<String>? _appNames;
  @override
  List<String>? get appNames {
    final value = _appNames;
    if (value == null) return null;
    if (_appNames is EqualUnmodifiableListView) return _appNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? hasAttachment;
  @override
  final bool? isRead;
  @override
  @JsonKey()
  final int offset;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final SortOrder sortOrder;

  @override
  String toString() {
    return 'ArchiveQuery(searchText: $searchText, deviceIds: $deviceIds, startDate: $startDate, endDate: $endDate, appNames: $appNames, hasAttachment: $hasAttachment, isRead: $isRead, offset: $offset, limit: $limit, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArchiveQueryImpl &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            const DeepCollectionEquality()
                .equals(other._deviceIds, _deviceIds) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._appNames, _appNames) &&
            (identical(other.hasAttachment, hasAttachment) ||
                other.hasAttachment == hasAttachment) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchText,
      const DeepCollectionEquality().hash(_deviceIds),
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_appNames),
      hasAttachment,
      isRead,
      offset,
      limit,
      sortOrder);

  /// Create a copy of ArchiveQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArchiveQueryImplCopyWith<_$ArchiveQueryImpl> get copyWith =>
      __$$ArchiveQueryImplCopyWithImpl<_$ArchiveQueryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArchiveQueryImplToJson(
      this,
    );
  }
}

abstract class _ArchiveQuery implements ArchiveQuery {
  const factory _ArchiveQuery(
      {final String? searchText,
      final List<String>? deviceIds,
      final DateTime? startDate,
      final DateTime? endDate,
      final List<String>? appNames,
      final bool? hasAttachment,
      final bool? isRead,
      final int offset,
      final int limit,
      final SortOrder sortOrder}) = _$ArchiveQueryImpl;

  factory _ArchiveQuery.fromJson(Map<String, dynamic> json) =
      _$ArchiveQueryImpl.fromJson;

  @override
  String? get searchText;
  @override
  List<String>? get deviceIds;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  List<String>? get appNames;
  @override
  bool? get hasAttachment;
  @override
  bool? get isRead;
  @override
  int get offset;
  @override
  int get limit;
  @override
  SortOrder get sortOrder;

  /// Create a copy of ArchiveQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArchiveQueryImplCopyWith<_$ArchiveQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
