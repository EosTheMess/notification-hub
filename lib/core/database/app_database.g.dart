// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $NotificationsTable extends Notifications
    with TableInfo<$NotificationsTable, NotificationEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _sourceDeviceIdMeta =
      const VerificationMeta('sourceDeviceId');
  @override
  late final GeneratedColumn<String> sourceDeviceId = GeneratedColumn<String>(
      'source_device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _appNameMeta =
      const VerificationMeta('appName');
  @override
  late final GeneratedColumn<String> appName = GeneratedColumn<String>(
      'app_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
      'is_read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_read" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _hasAttachmentMeta =
      const VerificationMeta('hasAttachment');
  @override
  late final GeneratedColumn<bool> hasAttachment = GeneratedColumn<bool>(
      'has_attachment', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_attachment" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _attachmentPathMeta =
      const VerificationMeta('attachmentPath');
  @override
  late final GeneratedColumn<String> attachmentPath = GeneratedColumn<String>(
      'attachment_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _attachmentMimeTypeMeta =
      const VerificationMeta('attachmentMimeType');
  @override
  late final GeneratedColumn<String> attachmentMimeType =
      GeneratedColumn<String>('attachment_mime_type', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _packageNameMeta =
      const VerificationMeta('packageName');
  @override
  late final GeneratedColumn<String> packageName = GeneratedColumn<String>(
      'package_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notificationIdMeta =
      const VerificationMeta('notificationId');
  @override
  late final GeneratedColumn<int> notificationId = GeneratedColumn<int>(
      'notification_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _extrasMeta = const VerificationMeta('extras');
  @override
  late final GeneratedColumn<String> extras = GeneratedColumn<String>(
      'extras', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _supportsQuickReplyMeta =
      const VerificationMeta('supportsQuickReply');
  @override
  late final GeneratedColumn<bool> supportsQuickReply = GeneratedColumn<bool>(
      'supports_quick_reply', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("supports_quick_reply" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _quickReplyPlaceholderMeta =
      const VerificationMeta('quickReplyPlaceholder');
  @override
  late final GeneratedColumn<String> quickReplyPlaceholder =
      GeneratedColumn<String>('quick_reply_placeholder', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quickReplyChoicesMeta =
      const VerificationMeta('quickReplyChoices');
  @override
  late final GeneratedColumn<String> quickReplyChoices =
      GeneratedColumn<String>('quick_reply_choices', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _actionsMeta =
      const VerificationMeta('actions');
  @override
  late final GeneratedColumn<String> actions = GeneratedColumn<String>(
      'actions', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
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
        tags,
        extras,
        supportsQuickReply,
        quickReplyPlaceholder,
        quickReplyChoices,
        actions,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notifications';
  @override
  VerificationContext validateIntegrity(Insertable<NotificationEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source_device_id')) {
      context.handle(
          _sourceDeviceIdMeta,
          sourceDeviceId.isAcceptableOrUnknown(
              data['source_device_id']!, _sourceDeviceIdMeta));
    } else if (isInserting) {
      context.missing(_sourceDeviceIdMeta);
    }
    if (data.containsKey('app_name')) {
      context.handle(_appNameMeta,
          appName.isAcceptableOrUnknown(data['app_name']!, _appNameMeta));
    } else if (isInserting) {
      context.missing(_appNameMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    if (data.containsKey('has_attachment')) {
      context.handle(
          _hasAttachmentMeta,
          hasAttachment.isAcceptableOrUnknown(
              data['has_attachment']!, _hasAttachmentMeta));
    }
    if (data.containsKey('attachment_path')) {
      context.handle(
          _attachmentPathMeta,
          attachmentPath.isAcceptableOrUnknown(
              data['attachment_path']!, _attachmentPathMeta));
    }
    if (data.containsKey('attachment_mime_type')) {
      context.handle(
          _attachmentMimeTypeMeta,
          attachmentMimeType.isAcceptableOrUnknown(
              data['attachment_mime_type']!, _attachmentMimeTypeMeta));
    }
    if (data.containsKey('package_name')) {
      context.handle(
          _packageNameMeta,
          packageName.isAcceptableOrUnknown(
              data['package_name']!, _packageNameMeta));
    }
    if (data.containsKey('notification_id')) {
      context.handle(
          _notificationIdMeta,
          notificationId.isAcceptableOrUnknown(
              data['notification_id']!, _notificationIdMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('extras')) {
      context.handle(_extrasMeta,
          extras.isAcceptableOrUnknown(data['extras']!, _extrasMeta));
    }
    if (data.containsKey('supports_quick_reply')) {
      context.handle(
          _supportsQuickReplyMeta,
          supportsQuickReply.isAcceptableOrUnknown(
              data['supports_quick_reply']!, _supportsQuickReplyMeta));
    }
    if (data.containsKey('quick_reply_placeholder')) {
      context.handle(
          _quickReplyPlaceholderMeta,
          quickReplyPlaceholder.isAcceptableOrUnknown(
              data['quick_reply_placeholder']!, _quickReplyPlaceholderMeta));
    }
    if (data.containsKey('quick_reply_choices')) {
      context.handle(
          _quickReplyChoicesMeta,
          quickReplyChoices.isAcceptableOrUnknown(
              data['quick_reply_choices']!, _quickReplyChoicesMeta));
    }
    if (data.containsKey('actions')) {
      context.handle(_actionsMeta,
          actions.isAcceptableOrUnknown(data['actions']!, _actionsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sourceDeviceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}source_device_id'])!,
      appName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}app_name'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      isRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_read'])!,
      hasAttachment: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_attachment'])!,
      attachmentPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attachment_path']),
      attachmentMimeType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}attachment_mime_type']),
      packageName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}package_name']),
      notificationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}notification_id']),
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!,
      extras: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}extras'])!,
      supportsQuickReply: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}supports_quick_reply'])!,
      quickReplyPlaceholder: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}quick_reply_placeholder']),
      quickReplyChoices: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}quick_reply_choices']),
      actions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}actions'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $NotificationsTable createAlias(String alias) {
    return $NotificationsTable(attachedDatabase, alias);
  }
}

class NotificationEntity extends DataClass
    implements Insertable<NotificationEntity> {
  final String id;
  final String sourceDeviceId;
  final String appName;
  final String title;
  final String content;
  final DateTime timestamp;
  final bool isRead;
  final bool hasAttachment;
  final String? attachmentPath;
  final String? attachmentMimeType;
  final String? packageName;
  final int? notificationId;
  final String tags;
  final String extras;
  final bool supportsQuickReply;
  final String? quickReplyPlaceholder;
  final String? quickReplyChoices;
  final String actions;
  final DateTime createdAt;
  final DateTime updatedAt;
  const NotificationEntity(
      {required this.id,
      required this.sourceDeviceId,
      required this.appName,
      required this.title,
      required this.content,
      required this.timestamp,
      required this.isRead,
      required this.hasAttachment,
      this.attachmentPath,
      this.attachmentMimeType,
      this.packageName,
      this.notificationId,
      required this.tags,
      required this.extras,
      required this.supportsQuickReply,
      this.quickReplyPlaceholder,
      this.quickReplyChoices,
      required this.actions,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['source_device_id'] = Variable<String>(sourceDeviceId);
    map['app_name'] = Variable<String>(appName);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['is_read'] = Variable<bool>(isRead);
    map['has_attachment'] = Variable<bool>(hasAttachment);
    if (!nullToAbsent || attachmentPath != null) {
      map['attachment_path'] = Variable<String>(attachmentPath);
    }
    if (!nullToAbsent || attachmentMimeType != null) {
      map['attachment_mime_type'] = Variable<String>(attachmentMimeType);
    }
    if (!nullToAbsent || packageName != null) {
      map['package_name'] = Variable<String>(packageName);
    }
    if (!nullToAbsent || notificationId != null) {
      map['notification_id'] = Variable<int>(notificationId);
    }
    map['tags'] = Variable<String>(tags);
    map['extras'] = Variable<String>(extras);
    map['supports_quick_reply'] = Variable<bool>(supportsQuickReply);
    if (!nullToAbsent || quickReplyPlaceholder != null) {
      map['quick_reply_placeholder'] = Variable<String>(quickReplyPlaceholder);
    }
    if (!nullToAbsent || quickReplyChoices != null) {
      map['quick_reply_choices'] = Variable<String>(quickReplyChoices);
    }
    map['actions'] = Variable<String>(actions);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  NotificationsCompanion toCompanion(bool nullToAbsent) {
    return NotificationsCompanion(
      id: Value(id),
      sourceDeviceId: Value(sourceDeviceId),
      appName: Value(appName),
      title: Value(title),
      content: Value(content),
      timestamp: Value(timestamp),
      isRead: Value(isRead),
      hasAttachment: Value(hasAttachment),
      attachmentPath: attachmentPath == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentPath),
      attachmentMimeType: attachmentMimeType == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentMimeType),
      packageName: packageName == null && nullToAbsent
          ? const Value.absent()
          : Value(packageName),
      notificationId: notificationId == null && nullToAbsent
          ? const Value.absent()
          : Value(notificationId),
      tags: Value(tags),
      extras: Value(extras),
      supportsQuickReply: Value(supportsQuickReply),
      quickReplyPlaceholder: quickReplyPlaceholder == null && nullToAbsent
          ? const Value.absent()
          : Value(quickReplyPlaceholder),
      quickReplyChoices: quickReplyChoices == null && nullToAbsent
          ? const Value.absent()
          : Value(quickReplyChoices),
      actions: Value(actions),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory NotificationEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationEntity(
      id: serializer.fromJson<String>(json['id']),
      sourceDeviceId: serializer.fromJson<String>(json['sourceDeviceId']),
      appName: serializer.fromJson<String>(json['appName']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      hasAttachment: serializer.fromJson<bool>(json['hasAttachment']),
      attachmentPath: serializer.fromJson<String?>(json['attachmentPath']),
      attachmentMimeType:
          serializer.fromJson<String?>(json['attachmentMimeType']),
      packageName: serializer.fromJson<String?>(json['packageName']),
      notificationId: serializer.fromJson<int?>(json['notificationId']),
      tags: serializer.fromJson<String>(json['tags']),
      extras: serializer.fromJson<String>(json['extras']),
      supportsQuickReply: serializer.fromJson<bool>(json['supportsQuickReply']),
      quickReplyPlaceholder:
          serializer.fromJson<String?>(json['quickReplyPlaceholder']),
      quickReplyChoices:
          serializer.fromJson<String?>(json['quickReplyChoices']),
      actions: serializer.fromJson<String>(json['actions']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sourceDeviceId': serializer.toJson<String>(sourceDeviceId),
      'appName': serializer.toJson<String>(appName),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'isRead': serializer.toJson<bool>(isRead),
      'hasAttachment': serializer.toJson<bool>(hasAttachment),
      'attachmentPath': serializer.toJson<String?>(attachmentPath),
      'attachmentMimeType': serializer.toJson<String?>(attachmentMimeType),
      'packageName': serializer.toJson<String?>(packageName),
      'notificationId': serializer.toJson<int?>(notificationId),
      'tags': serializer.toJson<String>(tags),
      'extras': serializer.toJson<String>(extras),
      'supportsQuickReply': serializer.toJson<bool>(supportsQuickReply),
      'quickReplyPlaceholder':
          serializer.toJson<String?>(quickReplyPlaceholder),
      'quickReplyChoices': serializer.toJson<String?>(quickReplyChoices),
      'actions': serializer.toJson<String>(actions),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  NotificationEntity copyWith(
          {String? id,
          String? sourceDeviceId,
          String? appName,
          String? title,
          String? content,
          DateTime? timestamp,
          bool? isRead,
          bool? hasAttachment,
          Value<String?> attachmentPath = const Value.absent(),
          Value<String?> attachmentMimeType = const Value.absent(),
          Value<String?> packageName = const Value.absent(),
          Value<int?> notificationId = const Value.absent(),
          String? tags,
          String? extras,
          bool? supportsQuickReply,
          Value<String?> quickReplyPlaceholder = const Value.absent(),
          Value<String?> quickReplyChoices = const Value.absent(),
          String? actions,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      NotificationEntity(
        id: id ?? this.id,
        sourceDeviceId: sourceDeviceId ?? this.sourceDeviceId,
        appName: appName ?? this.appName,
        title: title ?? this.title,
        content: content ?? this.content,
        timestamp: timestamp ?? this.timestamp,
        isRead: isRead ?? this.isRead,
        hasAttachment: hasAttachment ?? this.hasAttachment,
        attachmentPath:
            attachmentPath.present ? attachmentPath.value : this.attachmentPath,
        attachmentMimeType: attachmentMimeType.present
            ? attachmentMimeType.value
            : this.attachmentMimeType,
        packageName: packageName.present ? packageName.value : this.packageName,
        notificationId:
            notificationId.present ? notificationId.value : this.notificationId,
        tags: tags ?? this.tags,
        extras: extras ?? this.extras,
        supportsQuickReply: supportsQuickReply ?? this.supportsQuickReply,
        quickReplyPlaceholder: quickReplyPlaceholder.present
            ? quickReplyPlaceholder.value
            : this.quickReplyPlaceholder,
        quickReplyChoices: quickReplyChoices.present
            ? quickReplyChoices.value
            : this.quickReplyChoices,
        actions: actions ?? this.actions,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  NotificationEntity copyWithCompanion(NotificationsCompanion data) {
    return NotificationEntity(
      id: data.id.present ? data.id.value : this.id,
      sourceDeviceId: data.sourceDeviceId.present
          ? data.sourceDeviceId.value
          : this.sourceDeviceId,
      appName: data.appName.present ? data.appName.value : this.appName,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      hasAttachment: data.hasAttachment.present
          ? data.hasAttachment.value
          : this.hasAttachment,
      attachmentPath: data.attachmentPath.present
          ? data.attachmentPath.value
          : this.attachmentPath,
      attachmentMimeType: data.attachmentMimeType.present
          ? data.attachmentMimeType.value
          : this.attachmentMimeType,
      packageName:
          data.packageName.present ? data.packageName.value : this.packageName,
      notificationId: data.notificationId.present
          ? data.notificationId.value
          : this.notificationId,
      tags: data.tags.present ? data.tags.value : this.tags,
      extras: data.extras.present ? data.extras.value : this.extras,
      supportsQuickReply: data.supportsQuickReply.present
          ? data.supportsQuickReply.value
          : this.supportsQuickReply,
      quickReplyPlaceholder: data.quickReplyPlaceholder.present
          ? data.quickReplyPlaceholder.value
          : this.quickReplyPlaceholder,
      quickReplyChoices: data.quickReplyChoices.present
          ? data.quickReplyChoices.value
          : this.quickReplyChoices,
      actions: data.actions.present ? data.actions.value : this.actions,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationEntity(')
          ..write('id: $id, ')
          ..write('sourceDeviceId: $sourceDeviceId, ')
          ..write('appName: $appName, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('timestamp: $timestamp, ')
          ..write('isRead: $isRead, ')
          ..write('hasAttachment: $hasAttachment, ')
          ..write('attachmentPath: $attachmentPath, ')
          ..write('attachmentMimeType: $attachmentMimeType, ')
          ..write('packageName: $packageName, ')
          ..write('notificationId: $notificationId, ')
          ..write('tags: $tags, ')
          ..write('extras: $extras, ')
          ..write('supportsQuickReply: $supportsQuickReply, ')
          ..write('quickReplyPlaceholder: $quickReplyPlaceholder, ')
          ..write('quickReplyChoices: $quickReplyChoices, ')
          ..write('actions: $actions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
      tags,
      extras,
      supportsQuickReply,
      quickReplyPlaceholder,
      quickReplyChoices,
      actions,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationEntity &&
          other.id == this.id &&
          other.sourceDeviceId == this.sourceDeviceId &&
          other.appName == this.appName &&
          other.title == this.title &&
          other.content == this.content &&
          other.timestamp == this.timestamp &&
          other.isRead == this.isRead &&
          other.hasAttachment == this.hasAttachment &&
          other.attachmentPath == this.attachmentPath &&
          other.attachmentMimeType == this.attachmentMimeType &&
          other.packageName == this.packageName &&
          other.notificationId == this.notificationId &&
          other.tags == this.tags &&
          other.extras == this.extras &&
          other.supportsQuickReply == this.supportsQuickReply &&
          other.quickReplyPlaceholder == this.quickReplyPlaceholder &&
          other.quickReplyChoices == this.quickReplyChoices &&
          other.actions == this.actions &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NotificationsCompanion extends UpdateCompanion<NotificationEntity> {
  final Value<String> id;
  final Value<String> sourceDeviceId;
  final Value<String> appName;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime> timestamp;
  final Value<bool> isRead;
  final Value<bool> hasAttachment;
  final Value<String?> attachmentPath;
  final Value<String?> attachmentMimeType;
  final Value<String?> packageName;
  final Value<int?> notificationId;
  final Value<String> tags;
  final Value<String> extras;
  final Value<bool> supportsQuickReply;
  final Value<String?> quickReplyPlaceholder;
  final Value<String?> quickReplyChoices;
  final Value<String> actions;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const NotificationsCompanion({
    this.id = const Value.absent(),
    this.sourceDeviceId = const Value.absent(),
    this.appName = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.isRead = const Value.absent(),
    this.hasAttachment = const Value.absent(),
    this.attachmentPath = const Value.absent(),
    this.attachmentMimeType = const Value.absent(),
    this.packageName = const Value.absent(),
    this.notificationId = const Value.absent(),
    this.tags = const Value.absent(),
    this.extras = const Value.absent(),
    this.supportsQuickReply = const Value.absent(),
    this.quickReplyPlaceholder = const Value.absent(),
    this.quickReplyChoices = const Value.absent(),
    this.actions = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotificationsCompanion.insert({
    this.id = const Value.absent(),
    required String sourceDeviceId,
    required String appName,
    required String title,
    required String content,
    required DateTime timestamp,
    this.isRead = const Value.absent(),
    this.hasAttachment = const Value.absent(),
    this.attachmentPath = const Value.absent(),
    this.attachmentMimeType = const Value.absent(),
    this.packageName = const Value.absent(),
    this.notificationId = const Value.absent(),
    this.tags = const Value.absent(),
    this.extras = const Value.absent(),
    this.supportsQuickReply = const Value.absent(),
    this.quickReplyPlaceholder = const Value.absent(),
    this.quickReplyChoices = const Value.absent(),
    this.actions = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : sourceDeviceId = Value(sourceDeviceId),
        appName = Value(appName),
        title = Value(title),
        content = Value(content),
        timestamp = Value(timestamp);
  static Insertable<NotificationEntity> custom({
    Expression<String>? id,
    Expression<String>? sourceDeviceId,
    Expression<String>? appName,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? timestamp,
    Expression<bool>? isRead,
    Expression<bool>? hasAttachment,
    Expression<String>? attachmentPath,
    Expression<String>? attachmentMimeType,
    Expression<String>? packageName,
    Expression<int>? notificationId,
    Expression<String>? tags,
    Expression<String>? extras,
    Expression<bool>? supportsQuickReply,
    Expression<String>? quickReplyPlaceholder,
    Expression<String>? quickReplyChoices,
    Expression<String>? actions,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceDeviceId != null) 'source_device_id': sourceDeviceId,
      if (appName != null) 'app_name': appName,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (timestamp != null) 'timestamp': timestamp,
      if (isRead != null) 'is_read': isRead,
      if (hasAttachment != null) 'has_attachment': hasAttachment,
      if (attachmentPath != null) 'attachment_path': attachmentPath,
      if (attachmentMimeType != null)
        'attachment_mime_type': attachmentMimeType,
      if (packageName != null) 'package_name': packageName,
      if (notificationId != null) 'notification_id': notificationId,
      if (tags != null) 'tags': tags,
      if (extras != null) 'extras': extras,
      if (supportsQuickReply != null)
        'supports_quick_reply': supportsQuickReply,
      if (quickReplyPlaceholder != null)
        'quick_reply_placeholder': quickReplyPlaceholder,
      if (quickReplyChoices != null) 'quick_reply_choices': quickReplyChoices,
      if (actions != null) 'actions': actions,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotificationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? sourceDeviceId,
      Value<String>? appName,
      Value<String>? title,
      Value<String>? content,
      Value<DateTime>? timestamp,
      Value<bool>? isRead,
      Value<bool>? hasAttachment,
      Value<String?>? attachmentPath,
      Value<String?>? attachmentMimeType,
      Value<String?>? packageName,
      Value<int?>? notificationId,
      Value<String>? tags,
      Value<String>? extras,
      Value<bool>? supportsQuickReply,
      Value<String?>? quickReplyPlaceholder,
      Value<String?>? quickReplyChoices,
      Value<String>? actions,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return NotificationsCompanion(
      id: id ?? this.id,
      sourceDeviceId: sourceDeviceId ?? this.sourceDeviceId,
      appName: appName ?? this.appName,
      title: title ?? this.title,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
      hasAttachment: hasAttachment ?? this.hasAttachment,
      attachmentPath: attachmentPath ?? this.attachmentPath,
      attachmentMimeType: attachmentMimeType ?? this.attachmentMimeType,
      packageName: packageName ?? this.packageName,
      notificationId: notificationId ?? this.notificationId,
      tags: tags ?? this.tags,
      extras: extras ?? this.extras,
      supportsQuickReply: supportsQuickReply ?? this.supportsQuickReply,
      quickReplyPlaceholder:
          quickReplyPlaceholder ?? this.quickReplyPlaceholder,
      quickReplyChoices: quickReplyChoices ?? this.quickReplyChoices,
      actions: actions ?? this.actions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sourceDeviceId.present) {
      map['source_device_id'] = Variable<String>(sourceDeviceId.value);
    }
    if (appName.present) {
      map['app_name'] = Variable<String>(appName.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (hasAttachment.present) {
      map['has_attachment'] = Variable<bool>(hasAttachment.value);
    }
    if (attachmentPath.present) {
      map['attachment_path'] = Variable<String>(attachmentPath.value);
    }
    if (attachmentMimeType.present) {
      map['attachment_mime_type'] = Variable<String>(attachmentMimeType.value);
    }
    if (packageName.present) {
      map['package_name'] = Variable<String>(packageName.value);
    }
    if (notificationId.present) {
      map['notification_id'] = Variable<int>(notificationId.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (extras.present) {
      map['extras'] = Variable<String>(extras.value);
    }
    if (supportsQuickReply.present) {
      map['supports_quick_reply'] = Variable<bool>(supportsQuickReply.value);
    }
    if (quickReplyPlaceholder.present) {
      map['quick_reply_placeholder'] =
          Variable<String>(quickReplyPlaceholder.value);
    }
    if (quickReplyChoices.present) {
      map['quick_reply_choices'] = Variable<String>(quickReplyChoices.value);
    }
    if (actions.present) {
      map['actions'] = Variable<String>(actions.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsCompanion(')
          ..write('id: $id, ')
          ..write('sourceDeviceId: $sourceDeviceId, ')
          ..write('appName: $appName, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('timestamp: $timestamp, ')
          ..write('isRead: $isRead, ')
          ..write('hasAttachment: $hasAttachment, ')
          ..write('attachmentPath: $attachmentPath, ')
          ..write('attachmentMimeType: $attachmentMimeType, ')
          ..write('packageName: $packageName, ')
          ..write('notificationId: $notificationId, ')
          ..write('tags: $tags, ')
          ..write('extras: $extras, ')
          ..write('supportsQuickReply: $supportsQuickReply, ')
          ..write('quickReplyPlaceholder: $quickReplyPlaceholder, ')
          ..write('quickReplyChoices: $quickReplyChoices, ')
          ..write('actions: $actions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DevicesTable extends Devices
    with TableInfo<$DevicesTable, DeviceEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _platformMeta =
      const VerificationMeta('platform');
  @override
  late final GeneratedColumn<String> platform = GeneratedColumn<String>(
      'platform', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localIpMeta =
      const VerificationMeta('localIp');
  @override
  late final GeneratedColumn<String> localIp = GeneratedColumn<String>(
      'local_ip', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _portMeta = const VerificationMeta('port');
  @override
  late final GeneratedColumn<int> port = GeneratedColumn<int>(
      'port', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _connectionStateMeta =
      const VerificationMeta('connectionState');
  @override
  late final GeneratedColumn<String> connectionState = GeneratedColumn<String>(
      'connection_state', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('disconnected'));
  static const VerificationMeta _lastSeenMeta =
      const VerificationMeta('lastSeen');
  @override
  late final GeneratedColumn<DateTime> lastSeen = GeneratedColumn<DateTime>(
      'last_seen', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _permissionsMeta =
      const VerificationMeta('permissions');
  @override
  late final GeneratedColumn<String> permissions = GeneratedColumn<String>(
      'permissions', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('read_only'));
  static const VerificationMeta _publicKeyMeta =
      const VerificationMeta('publicKey');
  @override
  late final GeneratedColumn<String> publicKey = GeneratedColumn<String>(
      'public_key', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _metadataMeta =
      const VerificationMeta('metadata');
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
      'metadata', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _allowedAppsMeta =
      const VerificationMeta('allowedApps');
  @override
  late final GeneratedColumn<String> allowedApps = GeneratedColumn<String>(
      'allowed_apps', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _blockedAppsMeta =
      const VerificationMeta('blockedApps');
  @override
  late final GeneratedColumn<String> blockedApps = GeneratedColumn<String>(
      'blocked_apps', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _keywordFiltersMeta =
      const VerificationMeta('keywordFilters');
  @override
  late final GeneratedColumn<String> keywordFilters = GeneratedColumn<String>(
      'keyword_filters', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        platform,
        localIp,
        port,
        connectionState,
        lastSeen,
        permissions,
        publicKey,
        metadata,
        allowedApps,
        blockedApps,
        keywordFilters,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'devices';
  @override
  VerificationContext validateIntegrity(Insertable<DeviceEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('platform')) {
      context.handle(_platformMeta,
          platform.isAcceptableOrUnknown(data['platform']!, _platformMeta));
    } else if (isInserting) {
      context.missing(_platformMeta);
    }
    if (data.containsKey('local_ip')) {
      context.handle(_localIpMeta,
          localIp.isAcceptableOrUnknown(data['local_ip']!, _localIpMeta));
    } else if (isInserting) {
      context.missing(_localIpMeta);
    }
    if (data.containsKey('port')) {
      context.handle(
          _portMeta, port.isAcceptableOrUnknown(data['port']!, _portMeta));
    }
    if (data.containsKey('connection_state')) {
      context.handle(
          _connectionStateMeta,
          connectionState.isAcceptableOrUnknown(
              data['connection_state']!, _connectionStateMeta));
    }
    if (data.containsKey('last_seen')) {
      context.handle(_lastSeenMeta,
          lastSeen.isAcceptableOrUnknown(data['last_seen']!, _lastSeenMeta));
    } else if (isInserting) {
      context.missing(_lastSeenMeta);
    }
    if (data.containsKey('permissions')) {
      context.handle(
          _permissionsMeta,
          permissions.isAcceptableOrUnknown(
              data['permissions']!, _permissionsMeta));
    }
    if (data.containsKey('public_key')) {
      context.handle(_publicKeyMeta,
          publicKey.isAcceptableOrUnknown(data['public_key']!, _publicKeyMeta));
    }
    if (data.containsKey('metadata')) {
      context.handle(_metadataMeta,
          metadata.isAcceptableOrUnknown(data['metadata']!, _metadataMeta));
    }
    if (data.containsKey('allowed_apps')) {
      context.handle(
          _allowedAppsMeta,
          allowedApps.isAcceptableOrUnknown(
              data['allowed_apps']!, _allowedAppsMeta));
    }
    if (data.containsKey('blocked_apps')) {
      context.handle(
          _blockedAppsMeta,
          blockedApps.isAcceptableOrUnknown(
              data['blocked_apps']!, _blockedAppsMeta));
    }
    if (data.containsKey('keyword_filters')) {
      context.handle(
          _keywordFiltersMeta,
          keywordFilters.isAcceptableOrUnknown(
              data['keyword_filters']!, _keywordFiltersMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeviceEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeviceEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      platform: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}platform'])!,
      localIp: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_ip'])!,
      port: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}port']),
      connectionState: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}connection_state'])!,
      lastSeen: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_seen'])!,
      permissions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}permissions'])!,
      publicKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}public_key']),
      metadata: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metadata'])!,
      allowedApps: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}allowed_apps'])!,
      blockedApps: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blocked_apps'])!,
      keywordFilters: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}keyword_filters'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $DevicesTable createAlias(String alias) {
    return $DevicesTable(attachedDatabase, alias);
  }
}

class DeviceEntity extends DataClass implements Insertable<DeviceEntity> {
  final String id;
  final String name;
  final String platform;
  final String localIp;
  final int? port;
  final String connectionState;
  final DateTime lastSeen;
  final String permissions;
  final String? publicKey;
  final String metadata;
  final String allowedApps;
  final String blockedApps;
  final String keywordFilters;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DeviceEntity(
      {required this.id,
      required this.name,
      required this.platform,
      required this.localIp,
      this.port,
      required this.connectionState,
      required this.lastSeen,
      required this.permissions,
      this.publicKey,
      required this.metadata,
      required this.allowedApps,
      required this.blockedApps,
      required this.keywordFilters,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['platform'] = Variable<String>(platform);
    map['local_ip'] = Variable<String>(localIp);
    if (!nullToAbsent || port != null) {
      map['port'] = Variable<int>(port);
    }
    map['connection_state'] = Variable<String>(connectionState);
    map['last_seen'] = Variable<DateTime>(lastSeen);
    map['permissions'] = Variable<String>(permissions);
    if (!nullToAbsent || publicKey != null) {
      map['public_key'] = Variable<String>(publicKey);
    }
    map['metadata'] = Variable<String>(metadata);
    map['allowed_apps'] = Variable<String>(allowedApps);
    map['blocked_apps'] = Variable<String>(blockedApps);
    map['keyword_filters'] = Variable<String>(keywordFilters);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DevicesCompanion toCompanion(bool nullToAbsent) {
    return DevicesCompanion(
      id: Value(id),
      name: Value(name),
      platform: Value(platform),
      localIp: Value(localIp),
      port: port == null && nullToAbsent ? const Value.absent() : Value(port),
      connectionState: Value(connectionState),
      lastSeen: Value(lastSeen),
      permissions: Value(permissions),
      publicKey: publicKey == null && nullToAbsent
          ? const Value.absent()
          : Value(publicKey),
      metadata: Value(metadata),
      allowedApps: Value(allowedApps),
      blockedApps: Value(blockedApps),
      keywordFilters: Value(keywordFilters),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DeviceEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeviceEntity(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      platform: serializer.fromJson<String>(json['platform']),
      localIp: serializer.fromJson<String>(json['localIp']),
      port: serializer.fromJson<int?>(json['port']),
      connectionState: serializer.fromJson<String>(json['connectionState']),
      lastSeen: serializer.fromJson<DateTime>(json['lastSeen']),
      permissions: serializer.fromJson<String>(json['permissions']),
      publicKey: serializer.fromJson<String?>(json['publicKey']),
      metadata: serializer.fromJson<String>(json['metadata']),
      allowedApps: serializer.fromJson<String>(json['allowedApps']),
      blockedApps: serializer.fromJson<String>(json['blockedApps']),
      keywordFilters: serializer.fromJson<String>(json['keywordFilters']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'platform': serializer.toJson<String>(platform),
      'localIp': serializer.toJson<String>(localIp),
      'port': serializer.toJson<int?>(port),
      'connectionState': serializer.toJson<String>(connectionState),
      'lastSeen': serializer.toJson<DateTime>(lastSeen),
      'permissions': serializer.toJson<String>(permissions),
      'publicKey': serializer.toJson<String?>(publicKey),
      'metadata': serializer.toJson<String>(metadata),
      'allowedApps': serializer.toJson<String>(allowedApps),
      'blockedApps': serializer.toJson<String>(blockedApps),
      'keywordFilters': serializer.toJson<String>(keywordFilters),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DeviceEntity copyWith(
          {String? id,
          String? name,
          String? platform,
          String? localIp,
          Value<int?> port = const Value.absent(),
          String? connectionState,
          DateTime? lastSeen,
          String? permissions,
          Value<String?> publicKey = const Value.absent(),
          String? metadata,
          String? allowedApps,
          String? blockedApps,
          String? keywordFilters,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      DeviceEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        platform: platform ?? this.platform,
        localIp: localIp ?? this.localIp,
        port: port.present ? port.value : this.port,
        connectionState: connectionState ?? this.connectionState,
        lastSeen: lastSeen ?? this.lastSeen,
        permissions: permissions ?? this.permissions,
        publicKey: publicKey.present ? publicKey.value : this.publicKey,
        metadata: metadata ?? this.metadata,
        allowedApps: allowedApps ?? this.allowedApps,
        blockedApps: blockedApps ?? this.blockedApps,
        keywordFilters: keywordFilters ?? this.keywordFilters,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  DeviceEntity copyWithCompanion(DevicesCompanion data) {
    return DeviceEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      platform: data.platform.present ? data.platform.value : this.platform,
      localIp: data.localIp.present ? data.localIp.value : this.localIp,
      port: data.port.present ? data.port.value : this.port,
      connectionState: data.connectionState.present
          ? data.connectionState.value
          : this.connectionState,
      lastSeen: data.lastSeen.present ? data.lastSeen.value : this.lastSeen,
      permissions:
          data.permissions.present ? data.permissions.value : this.permissions,
      publicKey: data.publicKey.present ? data.publicKey.value : this.publicKey,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
      allowedApps:
          data.allowedApps.present ? data.allowedApps.value : this.allowedApps,
      blockedApps:
          data.blockedApps.present ? data.blockedApps.value : this.blockedApps,
      keywordFilters: data.keywordFilters.present
          ? data.keywordFilters.value
          : this.keywordFilters,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeviceEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('platform: $platform, ')
          ..write('localIp: $localIp, ')
          ..write('port: $port, ')
          ..write('connectionState: $connectionState, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('permissions: $permissions, ')
          ..write('publicKey: $publicKey, ')
          ..write('metadata: $metadata, ')
          ..write('allowedApps: $allowedApps, ')
          ..write('blockedApps: $blockedApps, ')
          ..write('keywordFilters: $keywordFilters, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      platform,
      localIp,
      port,
      connectionState,
      lastSeen,
      permissions,
      publicKey,
      metadata,
      allowedApps,
      blockedApps,
      keywordFilters,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeviceEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.platform == this.platform &&
          other.localIp == this.localIp &&
          other.port == this.port &&
          other.connectionState == this.connectionState &&
          other.lastSeen == this.lastSeen &&
          other.permissions == this.permissions &&
          other.publicKey == this.publicKey &&
          other.metadata == this.metadata &&
          other.allowedApps == this.allowedApps &&
          other.blockedApps == this.blockedApps &&
          other.keywordFilters == this.keywordFilters &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DevicesCompanion extends UpdateCompanion<DeviceEntity> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> platform;
  final Value<String> localIp;
  final Value<int?> port;
  final Value<String> connectionState;
  final Value<DateTime> lastSeen;
  final Value<String> permissions;
  final Value<String?> publicKey;
  final Value<String> metadata;
  final Value<String> allowedApps;
  final Value<String> blockedApps;
  final Value<String> keywordFilters;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const DevicesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.platform = const Value.absent(),
    this.localIp = const Value.absent(),
    this.port = const Value.absent(),
    this.connectionState = const Value.absent(),
    this.lastSeen = const Value.absent(),
    this.permissions = const Value.absent(),
    this.publicKey = const Value.absent(),
    this.metadata = const Value.absent(),
    this.allowedApps = const Value.absent(),
    this.blockedApps = const Value.absent(),
    this.keywordFilters = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DevicesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String platform,
    required String localIp,
    this.port = const Value.absent(),
    this.connectionState = const Value.absent(),
    required DateTime lastSeen,
    this.permissions = const Value.absent(),
    this.publicKey = const Value.absent(),
    this.metadata = const Value.absent(),
    this.allowedApps = const Value.absent(),
    this.blockedApps = const Value.absent(),
    this.keywordFilters = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        platform = Value(platform),
        localIp = Value(localIp),
        lastSeen = Value(lastSeen);
  static Insertable<DeviceEntity> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? platform,
    Expression<String>? localIp,
    Expression<int>? port,
    Expression<String>? connectionState,
    Expression<DateTime>? lastSeen,
    Expression<String>? permissions,
    Expression<String>? publicKey,
    Expression<String>? metadata,
    Expression<String>? allowedApps,
    Expression<String>? blockedApps,
    Expression<String>? keywordFilters,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (platform != null) 'platform': platform,
      if (localIp != null) 'local_ip': localIp,
      if (port != null) 'port': port,
      if (connectionState != null) 'connection_state': connectionState,
      if (lastSeen != null) 'last_seen': lastSeen,
      if (permissions != null) 'permissions': permissions,
      if (publicKey != null) 'public_key': publicKey,
      if (metadata != null) 'metadata': metadata,
      if (allowedApps != null) 'allowed_apps': allowedApps,
      if (blockedApps != null) 'blocked_apps': blockedApps,
      if (keywordFilters != null) 'keyword_filters': keywordFilters,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DevicesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? platform,
      Value<String>? localIp,
      Value<int?>? port,
      Value<String>? connectionState,
      Value<DateTime>? lastSeen,
      Value<String>? permissions,
      Value<String?>? publicKey,
      Value<String>? metadata,
      Value<String>? allowedApps,
      Value<String>? blockedApps,
      Value<String>? keywordFilters,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return DevicesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      platform: platform ?? this.platform,
      localIp: localIp ?? this.localIp,
      port: port ?? this.port,
      connectionState: connectionState ?? this.connectionState,
      lastSeen: lastSeen ?? this.lastSeen,
      permissions: permissions ?? this.permissions,
      publicKey: publicKey ?? this.publicKey,
      metadata: metadata ?? this.metadata,
      allowedApps: allowedApps ?? this.allowedApps,
      blockedApps: blockedApps ?? this.blockedApps,
      keywordFilters: keywordFilters ?? this.keywordFilters,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (platform.present) {
      map['platform'] = Variable<String>(platform.value);
    }
    if (localIp.present) {
      map['local_ip'] = Variable<String>(localIp.value);
    }
    if (port.present) {
      map['port'] = Variable<int>(port.value);
    }
    if (connectionState.present) {
      map['connection_state'] = Variable<String>(connectionState.value);
    }
    if (lastSeen.present) {
      map['last_seen'] = Variable<DateTime>(lastSeen.value);
    }
    if (permissions.present) {
      map['permissions'] = Variable<String>(permissions.value);
    }
    if (publicKey.present) {
      map['public_key'] = Variable<String>(publicKey.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(metadata.value);
    }
    if (allowedApps.present) {
      map['allowed_apps'] = Variable<String>(allowedApps.value);
    }
    if (blockedApps.present) {
      map['blocked_apps'] = Variable<String>(blockedApps.value);
    }
    if (keywordFilters.present) {
      map['keyword_filters'] = Variable<String>(keywordFilters.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DevicesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('platform: $platform, ')
          ..write('localIp: $localIp, ')
          ..write('port: $port, ')
          ..write('connectionState: $connectionState, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('permissions: $permissions, ')
          ..write('publicKey: $publicKey, ')
          ..write('metadata: $metadata, ')
          ..write('allowedApps: $allowedApps, ')
          ..write('blockedApps: $blockedApps, ')
          ..write('keywordFilters: $keywordFilters, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotificationGroupsTable extends NotificationGroups
    with TableInfo<$NotificationGroupsTable, NotificationGroupEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _signatureMeta =
      const VerificationMeta('signature');
  @override
  late final GeneratedColumn<String> signature = GeneratedColumn<String>(
      'signature', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notificationIdsMeta =
      const VerificationMeta('notificationIds');
  @override
  late final GeneratedColumn<String> notificationIds = GeneratedColumn<String>(
      'notification_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _firstSeenMeta =
      const VerificationMeta('firstSeen');
  @override
  late final GeneratedColumn<DateTime> firstSeen = GeneratedColumn<DateTime>(
      'first_seen', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isExpandedMeta =
      const VerificationMeta('isExpanded');
  @override
  late final GeneratedColumn<bool> isExpanded = GeneratedColumn<bool>(
      'is_expanded', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_expanded" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [signature, notificationIds, count, firstSeen, lastUpdated, isExpanded];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_groups';
  @override
  VerificationContext validateIntegrity(
      Insertable<NotificationGroupEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('signature')) {
      context.handle(_signatureMeta,
          signature.isAcceptableOrUnknown(data['signature']!, _signatureMeta));
    } else if (isInserting) {
      context.missing(_signatureMeta);
    }
    if (data.containsKey('notification_ids')) {
      context.handle(
          _notificationIdsMeta,
          notificationIds.isAcceptableOrUnknown(
              data['notification_ids']!, _notificationIdsMeta));
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    }
    if (data.containsKey('first_seen')) {
      context.handle(_firstSeenMeta,
          firstSeen.isAcceptableOrUnknown(data['first_seen']!, _firstSeenMeta));
    } else if (isInserting) {
      context.missing(_firstSeenMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    if (data.containsKey('is_expanded')) {
      context.handle(
          _isExpandedMeta,
          isExpanded.isAcceptableOrUnknown(
              data['is_expanded']!, _isExpandedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {signature};
  @override
  NotificationGroupEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationGroupEntity(
      signature: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}signature'])!,
      notificationIds: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}notification_ids'])!,
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count'])!,
      firstSeen: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}first_seen'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
      isExpanded: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_expanded'])!,
    );
  }

  @override
  $NotificationGroupsTable createAlias(String alias) {
    return $NotificationGroupsTable(attachedDatabase, alias);
  }
}

class NotificationGroupEntity extends DataClass
    implements Insertable<NotificationGroupEntity> {
  final String signature;
  final String notificationIds;
  final int count;
  final DateTime firstSeen;
  final DateTime lastUpdated;
  final bool isExpanded;
  const NotificationGroupEntity(
      {required this.signature,
      required this.notificationIds,
      required this.count,
      required this.firstSeen,
      required this.lastUpdated,
      required this.isExpanded});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['signature'] = Variable<String>(signature);
    map['notification_ids'] = Variable<String>(notificationIds);
    map['count'] = Variable<int>(count);
    map['first_seen'] = Variable<DateTime>(firstSeen);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    map['is_expanded'] = Variable<bool>(isExpanded);
    return map;
  }

  NotificationGroupsCompanion toCompanion(bool nullToAbsent) {
    return NotificationGroupsCompanion(
      signature: Value(signature),
      notificationIds: Value(notificationIds),
      count: Value(count),
      firstSeen: Value(firstSeen),
      lastUpdated: Value(lastUpdated),
      isExpanded: Value(isExpanded),
    );
  }

  factory NotificationGroupEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationGroupEntity(
      signature: serializer.fromJson<String>(json['signature']),
      notificationIds: serializer.fromJson<String>(json['notificationIds']),
      count: serializer.fromJson<int>(json['count']),
      firstSeen: serializer.fromJson<DateTime>(json['firstSeen']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
      isExpanded: serializer.fromJson<bool>(json['isExpanded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'signature': serializer.toJson<String>(signature),
      'notificationIds': serializer.toJson<String>(notificationIds),
      'count': serializer.toJson<int>(count),
      'firstSeen': serializer.toJson<DateTime>(firstSeen),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
      'isExpanded': serializer.toJson<bool>(isExpanded),
    };
  }

  NotificationGroupEntity copyWith(
          {String? signature,
          String? notificationIds,
          int? count,
          DateTime? firstSeen,
          DateTime? lastUpdated,
          bool? isExpanded}) =>
      NotificationGroupEntity(
        signature: signature ?? this.signature,
        notificationIds: notificationIds ?? this.notificationIds,
        count: count ?? this.count,
        firstSeen: firstSeen ?? this.firstSeen,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        isExpanded: isExpanded ?? this.isExpanded,
      );
  NotificationGroupEntity copyWithCompanion(NotificationGroupsCompanion data) {
    return NotificationGroupEntity(
      signature: data.signature.present ? data.signature.value : this.signature,
      notificationIds: data.notificationIds.present
          ? data.notificationIds.value
          : this.notificationIds,
      count: data.count.present ? data.count.value : this.count,
      firstSeen: data.firstSeen.present ? data.firstSeen.value : this.firstSeen,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
      isExpanded:
          data.isExpanded.present ? data.isExpanded.value : this.isExpanded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationGroupEntity(')
          ..write('signature: $signature, ')
          ..write('notificationIds: $notificationIds, ')
          ..write('count: $count, ')
          ..write('firstSeen: $firstSeen, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('isExpanded: $isExpanded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      signature, notificationIds, count, firstSeen, lastUpdated, isExpanded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationGroupEntity &&
          other.signature == this.signature &&
          other.notificationIds == this.notificationIds &&
          other.count == this.count &&
          other.firstSeen == this.firstSeen &&
          other.lastUpdated == this.lastUpdated &&
          other.isExpanded == this.isExpanded);
}

class NotificationGroupsCompanion
    extends UpdateCompanion<NotificationGroupEntity> {
  final Value<String> signature;
  final Value<String> notificationIds;
  final Value<int> count;
  final Value<DateTime> firstSeen;
  final Value<DateTime> lastUpdated;
  final Value<bool> isExpanded;
  final Value<int> rowid;
  const NotificationGroupsCompanion({
    this.signature = const Value.absent(),
    this.notificationIds = const Value.absent(),
    this.count = const Value.absent(),
    this.firstSeen = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.isExpanded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotificationGroupsCompanion.insert({
    required String signature,
    this.notificationIds = const Value.absent(),
    this.count = const Value.absent(),
    required DateTime firstSeen,
    required DateTime lastUpdated,
    this.isExpanded = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : signature = Value(signature),
        firstSeen = Value(firstSeen),
        lastUpdated = Value(lastUpdated);
  static Insertable<NotificationGroupEntity> custom({
    Expression<String>? signature,
    Expression<String>? notificationIds,
    Expression<int>? count,
    Expression<DateTime>? firstSeen,
    Expression<DateTime>? lastUpdated,
    Expression<bool>? isExpanded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (signature != null) 'signature': signature,
      if (notificationIds != null) 'notification_ids': notificationIds,
      if (count != null) 'count': count,
      if (firstSeen != null) 'first_seen': firstSeen,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (isExpanded != null) 'is_expanded': isExpanded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotificationGroupsCompanion copyWith(
      {Value<String>? signature,
      Value<String>? notificationIds,
      Value<int>? count,
      Value<DateTime>? firstSeen,
      Value<DateTime>? lastUpdated,
      Value<bool>? isExpanded,
      Value<int>? rowid}) {
    return NotificationGroupsCompanion(
      signature: signature ?? this.signature,
      notificationIds: notificationIds ?? this.notificationIds,
      count: count ?? this.count,
      firstSeen: firstSeen ?? this.firstSeen,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      isExpanded: isExpanded ?? this.isExpanded,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (signature.present) {
      map['signature'] = Variable<String>(signature.value);
    }
    if (notificationIds.present) {
      map['notification_ids'] = Variable<String>(notificationIds.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (firstSeen.present) {
      map['first_seen'] = Variable<DateTime>(firstSeen.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (isExpanded.present) {
      map['is_expanded'] = Variable<bool>(isExpanded.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationGroupsCompanion(')
          ..write('signature: $signature, ')
          ..write('notificationIds: $notificationIds, ')
          ..write('count: $count, ')
          ..write('firstSeen: $firstSeen, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('isExpanded: $isExpanded, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FilterSettingsTableTable extends FilterSettingsTable
    with TableInfo<$FilterSettingsTableTable, FilterSettingsEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FilterSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _whitelistAppsMeta =
      const VerificationMeta('whitelistApps');
  @override
  late final GeneratedColumn<String> whitelistApps = GeneratedColumn<String>(
      'whitelist_apps', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _blacklistAppsMeta =
      const VerificationMeta('blacklistApps');
  @override
  late final GeneratedColumn<String> blacklistApps = GeneratedColumn<String>(
      'blacklist_apps', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _keywordWhitelistMeta =
      const VerificationMeta('keywordWhitelist');
  @override
  late final GeneratedColumn<String> keywordWhitelist = GeneratedColumn<String>(
      'keyword_whitelist', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _keywordBlacklistMeta =
      const VerificationMeta('keywordBlacklist');
  @override
  late final GeneratedColumn<String> keywordBlacklist = GeneratedColumn<String>(
      'keyword_blacklist', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _enableDeduplicationMeta =
      const VerificationMeta('enableDeduplication');
  @override
  late final GeneratedColumn<bool> enableDeduplication = GeneratedColumn<bool>(
      'enable_deduplication', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("enable_deduplication" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _dedupWindowMeta =
      const VerificationMeta('dedupWindow');
  @override
  late final GeneratedColumn<String> dedupWindow = GeneratedColumn<String>(
      'dedup_window', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('minutes5'));
  static const VerificationMeta _showSystemNotificationsMeta =
      const VerificationMeta('showSystemNotifications');
  @override
  late final GeneratedColumn<bool> showSystemNotifications =
      GeneratedColumn<bool>('show_system_notifications', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("show_system_notifications" IN (0, 1))'),
          defaultValue: const Constant(true));
  static const VerificationMeta _minPriorityMeta =
      const VerificationMeta('minPriority');
  @override
  late final GeneratedColumn<String> minPriority = GeneratedColumn<String>(
      'min_priority', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('low'));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        whitelistApps,
        blacklistApps,
        keywordWhitelist,
        keywordBlacklist,
        enableDeduplication,
        dedupWindow,
        showSystemNotifications,
        minPriority,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'filter_settings_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<FilterSettingsEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('whitelist_apps')) {
      context.handle(
          _whitelistAppsMeta,
          whitelistApps.isAcceptableOrUnknown(
              data['whitelist_apps']!, _whitelistAppsMeta));
    }
    if (data.containsKey('blacklist_apps')) {
      context.handle(
          _blacklistAppsMeta,
          blacklistApps.isAcceptableOrUnknown(
              data['blacklist_apps']!, _blacklistAppsMeta));
    }
    if (data.containsKey('keyword_whitelist')) {
      context.handle(
          _keywordWhitelistMeta,
          keywordWhitelist.isAcceptableOrUnknown(
              data['keyword_whitelist']!, _keywordWhitelistMeta));
    }
    if (data.containsKey('keyword_blacklist')) {
      context.handle(
          _keywordBlacklistMeta,
          keywordBlacklist.isAcceptableOrUnknown(
              data['keyword_blacklist']!, _keywordBlacklistMeta));
    }
    if (data.containsKey('enable_deduplication')) {
      context.handle(
          _enableDeduplicationMeta,
          enableDeduplication.isAcceptableOrUnknown(
              data['enable_deduplication']!, _enableDeduplicationMeta));
    }
    if (data.containsKey('dedup_window')) {
      context.handle(
          _dedupWindowMeta,
          dedupWindow.isAcceptableOrUnknown(
              data['dedup_window']!, _dedupWindowMeta));
    }
    if (data.containsKey('show_system_notifications')) {
      context.handle(
          _showSystemNotificationsMeta,
          showSystemNotifications.isAcceptableOrUnknown(
              data['show_system_notifications']!,
              _showSystemNotificationsMeta));
    }
    if (data.containsKey('min_priority')) {
      context.handle(
          _minPriorityMeta,
          minPriority.isAcceptableOrUnknown(
              data['min_priority']!, _minPriorityMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FilterSettingsEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FilterSettingsEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      whitelistApps: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}whitelist_apps'])!,
      blacklistApps: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blacklist_apps'])!,
      keywordWhitelist: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}keyword_whitelist'])!,
      keywordBlacklist: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}keyword_blacklist'])!,
      enableDeduplication: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}enable_deduplication'])!,
      dedupWindow: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dedup_window'])!,
      showSystemNotifications: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}show_system_notifications'])!,
      minPriority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}min_priority'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $FilterSettingsTableTable createAlias(String alias) {
    return $FilterSettingsTableTable(attachedDatabase, alias);
  }
}

class FilterSettingsEntity extends DataClass
    implements Insertable<FilterSettingsEntity> {
  final int id;
  final String whitelistApps;
  final String blacklistApps;
  final String keywordWhitelist;
  final String keywordBlacklist;
  final bool enableDeduplication;
  final String dedupWindow;
  final bool showSystemNotifications;
  final String minPriority;
  final DateTime updatedAt;
  const FilterSettingsEntity(
      {required this.id,
      required this.whitelistApps,
      required this.blacklistApps,
      required this.keywordWhitelist,
      required this.keywordBlacklist,
      required this.enableDeduplication,
      required this.dedupWindow,
      required this.showSystemNotifications,
      required this.minPriority,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['whitelist_apps'] = Variable<String>(whitelistApps);
    map['blacklist_apps'] = Variable<String>(blacklistApps);
    map['keyword_whitelist'] = Variable<String>(keywordWhitelist);
    map['keyword_blacklist'] = Variable<String>(keywordBlacklist);
    map['enable_deduplication'] = Variable<bool>(enableDeduplication);
    map['dedup_window'] = Variable<String>(dedupWindow);
    map['show_system_notifications'] = Variable<bool>(showSystemNotifications);
    map['min_priority'] = Variable<String>(minPriority);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  FilterSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return FilterSettingsTableCompanion(
      id: Value(id),
      whitelistApps: Value(whitelistApps),
      blacklistApps: Value(blacklistApps),
      keywordWhitelist: Value(keywordWhitelist),
      keywordBlacklist: Value(keywordBlacklist),
      enableDeduplication: Value(enableDeduplication),
      dedupWindow: Value(dedupWindow),
      showSystemNotifications: Value(showSystemNotifications),
      minPriority: Value(minPriority),
      updatedAt: Value(updatedAt),
    );
  }

  factory FilterSettingsEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FilterSettingsEntity(
      id: serializer.fromJson<int>(json['id']),
      whitelistApps: serializer.fromJson<String>(json['whitelistApps']),
      blacklistApps: serializer.fromJson<String>(json['blacklistApps']),
      keywordWhitelist: serializer.fromJson<String>(json['keywordWhitelist']),
      keywordBlacklist: serializer.fromJson<String>(json['keywordBlacklist']),
      enableDeduplication:
          serializer.fromJson<bool>(json['enableDeduplication']),
      dedupWindow: serializer.fromJson<String>(json['dedupWindow']),
      showSystemNotifications:
          serializer.fromJson<bool>(json['showSystemNotifications']),
      minPriority: serializer.fromJson<String>(json['minPriority']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'whitelistApps': serializer.toJson<String>(whitelistApps),
      'blacklistApps': serializer.toJson<String>(blacklistApps),
      'keywordWhitelist': serializer.toJson<String>(keywordWhitelist),
      'keywordBlacklist': serializer.toJson<String>(keywordBlacklist),
      'enableDeduplication': serializer.toJson<bool>(enableDeduplication),
      'dedupWindow': serializer.toJson<String>(dedupWindow),
      'showSystemNotifications':
          serializer.toJson<bool>(showSystemNotifications),
      'minPriority': serializer.toJson<String>(minPriority),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  FilterSettingsEntity copyWith(
          {int? id,
          String? whitelistApps,
          String? blacklistApps,
          String? keywordWhitelist,
          String? keywordBlacklist,
          bool? enableDeduplication,
          String? dedupWindow,
          bool? showSystemNotifications,
          String? minPriority,
          DateTime? updatedAt}) =>
      FilterSettingsEntity(
        id: id ?? this.id,
        whitelistApps: whitelistApps ?? this.whitelistApps,
        blacklistApps: blacklistApps ?? this.blacklistApps,
        keywordWhitelist: keywordWhitelist ?? this.keywordWhitelist,
        keywordBlacklist: keywordBlacklist ?? this.keywordBlacklist,
        enableDeduplication: enableDeduplication ?? this.enableDeduplication,
        dedupWindow: dedupWindow ?? this.dedupWindow,
        showSystemNotifications:
            showSystemNotifications ?? this.showSystemNotifications,
        minPriority: minPriority ?? this.minPriority,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  FilterSettingsEntity copyWithCompanion(FilterSettingsTableCompanion data) {
    return FilterSettingsEntity(
      id: data.id.present ? data.id.value : this.id,
      whitelistApps: data.whitelistApps.present
          ? data.whitelistApps.value
          : this.whitelistApps,
      blacklistApps: data.blacklistApps.present
          ? data.blacklistApps.value
          : this.blacklistApps,
      keywordWhitelist: data.keywordWhitelist.present
          ? data.keywordWhitelist.value
          : this.keywordWhitelist,
      keywordBlacklist: data.keywordBlacklist.present
          ? data.keywordBlacklist.value
          : this.keywordBlacklist,
      enableDeduplication: data.enableDeduplication.present
          ? data.enableDeduplication.value
          : this.enableDeduplication,
      dedupWindow:
          data.dedupWindow.present ? data.dedupWindow.value : this.dedupWindow,
      showSystemNotifications: data.showSystemNotifications.present
          ? data.showSystemNotifications.value
          : this.showSystemNotifications,
      minPriority:
          data.minPriority.present ? data.minPriority.value : this.minPriority,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FilterSettingsEntity(')
          ..write('id: $id, ')
          ..write('whitelistApps: $whitelistApps, ')
          ..write('blacklistApps: $blacklistApps, ')
          ..write('keywordWhitelist: $keywordWhitelist, ')
          ..write('keywordBlacklist: $keywordBlacklist, ')
          ..write('enableDeduplication: $enableDeduplication, ')
          ..write('dedupWindow: $dedupWindow, ')
          ..write('showSystemNotifications: $showSystemNotifications, ')
          ..write('minPriority: $minPriority, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      whitelistApps,
      blacklistApps,
      keywordWhitelist,
      keywordBlacklist,
      enableDeduplication,
      dedupWindow,
      showSystemNotifications,
      minPriority,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FilterSettingsEntity &&
          other.id == this.id &&
          other.whitelistApps == this.whitelistApps &&
          other.blacklistApps == this.blacklistApps &&
          other.keywordWhitelist == this.keywordWhitelist &&
          other.keywordBlacklist == this.keywordBlacklist &&
          other.enableDeduplication == this.enableDeduplication &&
          other.dedupWindow == this.dedupWindow &&
          other.showSystemNotifications == this.showSystemNotifications &&
          other.minPriority == this.minPriority &&
          other.updatedAt == this.updatedAt);
}

class FilterSettingsTableCompanion
    extends UpdateCompanion<FilterSettingsEntity> {
  final Value<int> id;
  final Value<String> whitelistApps;
  final Value<String> blacklistApps;
  final Value<String> keywordWhitelist;
  final Value<String> keywordBlacklist;
  final Value<bool> enableDeduplication;
  final Value<String> dedupWindow;
  final Value<bool> showSystemNotifications;
  final Value<String> minPriority;
  final Value<DateTime> updatedAt;
  const FilterSettingsTableCompanion({
    this.id = const Value.absent(),
    this.whitelistApps = const Value.absent(),
    this.blacklistApps = const Value.absent(),
    this.keywordWhitelist = const Value.absent(),
    this.keywordBlacklist = const Value.absent(),
    this.enableDeduplication = const Value.absent(),
    this.dedupWindow = const Value.absent(),
    this.showSystemNotifications = const Value.absent(),
    this.minPriority = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FilterSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.whitelistApps = const Value.absent(),
    this.blacklistApps = const Value.absent(),
    this.keywordWhitelist = const Value.absent(),
    this.keywordBlacklist = const Value.absent(),
    this.enableDeduplication = const Value.absent(),
    this.dedupWindow = const Value.absent(),
    this.showSystemNotifications = const Value.absent(),
    this.minPriority = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<FilterSettingsEntity> custom({
    Expression<int>? id,
    Expression<String>? whitelistApps,
    Expression<String>? blacklistApps,
    Expression<String>? keywordWhitelist,
    Expression<String>? keywordBlacklist,
    Expression<bool>? enableDeduplication,
    Expression<String>? dedupWindow,
    Expression<bool>? showSystemNotifications,
    Expression<String>? minPriority,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (whitelistApps != null) 'whitelist_apps': whitelistApps,
      if (blacklistApps != null) 'blacklist_apps': blacklistApps,
      if (keywordWhitelist != null) 'keyword_whitelist': keywordWhitelist,
      if (keywordBlacklist != null) 'keyword_blacklist': keywordBlacklist,
      if (enableDeduplication != null)
        'enable_deduplication': enableDeduplication,
      if (dedupWindow != null) 'dedup_window': dedupWindow,
      if (showSystemNotifications != null)
        'show_system_notifications': showSystemNotifications,
      if (minPriority != null) 'min_priority': minPriority,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FilterSettingsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? whitelistApps,
      Value<String>? blacklistApps,
      Value<String>? keywordWhitelist,
      Value<String>? keywordBlacklist,
      Value<bool>? enableDeduplication,
      Value<String>? dedupWindow,
      Value<bool>? showSystemNotifications,
      Value<String>? minPriority,
      Value<DateTime>? updatedAt}) {
    return FilterSettingsTableCompanion(
      id: id ?? this.id,
      whitelistApps: whitelistApps ?? this.whitelistApps,
      blacklistApps: blacklistApps ?? this.blacklistApps,
      keywordWhitelist: keywordWhitelist ?? this.keywordWhitelist,
      keywordBlacklist: keywordBlacklist ?? this.keywordBlacklist,
      enableDeduplication: enableDeduplication ?? this.enableDeduplication,
      dedupWindow: dedupWindow ?? this.dedupWindow,
      showSystemNotifications:
          showSystemNotifications ?? this.showSystemNotifications,
      minPriority: minPriority ?? this.minPriority,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (whitelistApps.present) {
      map['whitelist_apps'] = Variable<String>(whitelistApps.value);
    }
    if (blacklistApps.present) {
      map['blacklist_apps'] = Variable<String>(blacklistApps.value);
    }
    if (keywordWhitelist.present) {
      map['keyword_whitelist'] = Variable<String>(keywordWhitelist.value);
    }
    if (keywordBlacklist.present) {
      map['keyword_blacklist'] = Variable<String>(keywordBlacklist.value);
    }
    if (enableDeduplication.present) {
      map['enable_deduplication'] = Variable<bool>(enableDeduplication.value);
    }
    if (dedupWindow.present) {
      map['dedup_window'] = Variable<String>(dedupWindow.value);
    }
    if (showSystemNotifications.present) {
      map['show_system_notifications'] =
          Variable<bool>(showSystemNotifications.value);
    }
    if (minPriority.present) {
      map['min_priority'] = Variable<String>(minPriority.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FilterSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('whitelistApps: $whitelistApps, ')
          ..write('blacklistApps: $blacklistApps, ')
          ..write('keywordWhitelist: $keywordWhitelist, ')
          ..write('keywordBlacklist: $keywordBlacklist, ')
          ..write('enableDeduplication: $enableDeduplication, ')
          ..write('dedupWindow: $dedupWindow, ')
          ..write('showSystemNotifications: $showSystemNotifications, ')
          ..write('minPriority: $minPriority, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NotificationsTable notifications = $NotificationsTable(this);
  late final $DevicesTable devices = $DevicesTable(this);
  late final $NotificationGroupsTable notificationGroups =
      $NotificationGroupsTable(this);
  late final $FilterSettingsTableTable filterSettingsTable =
      $FilterSettingsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [notifications, devices, notificationGroups, filterSettingsTable];
}

typedef $$NotificationsTableCreateCompanionBuilder = NotificationsCompanion
    Function({
  Value<String> id,
  required String sourceDeviceId,
  required String appName,
  required String title,
  required String content,
  required DateTime timestamp,
  Value<bool> isRead,
  Value<bool> hasAttachment,
  Value<String?> attachmentPath,
  Value<String?> attachmentMimeType,
  Value<String?> packageName,
  Value<int?> notificationId,
  Value<String> tags,
  Value<String> extras,
  Value<bool> supportsQuickReply,
  Value<String?> quickReplyPlaceholder,
  Value<String?> quickReplyChoices,
  Value<String> actions,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$NotificationsTableUpdateCompanionBuilder = NotificationsCompanion
    Function({
  Value<String> id,
  Value<String> sourceDeviceId,
  Value<String> appName,
  Value<String> title,
  Value<String> content,
  Value<DateTime> timestamp,
  Value<bool> isRead,
  Value<bool> hasAttachment,
  Value<String?> attachmentPath,
  Value<String?> attachmentMimeType,
  Value<String?> packageName,
  Value<int?> notificationId,
  Value<String> tags,
  Value<String> extras,
  Value<bool> supportsQuickReply,
  Value<String?> quickReplyPlaceholder,
  Value<String?> quickReplyChoices,
  Value<String> actions,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$NotificationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotificationsTable,
    NotificationEntity,
    $$NotificationsTableFilterComposer,
    $$NotificationsTableOrderingComposer,
    $$NotificationsTableCreateCompanionBuilder,
    $$NotificationsTableUpdateCompanionBuilder> {
  $$NotificationsTableTableManager(_$AppDatabase db, $NotificationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$NotificationsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$NotificationsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> sourceDeviceId = const Value.absent(),
            Value<String> appName = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<bool> isRead = const Value.absent(),
            Value<bool> hasAttachment = const Value.absent(),
            Value<String?> attachmentPath = const Value.absent(),
            Value<String?> attachmentMimeType = const Value.absent(),
            Value<String?> packageName = const Value.absent(),
            Value<int?> notificationId = const Value.absent(),
            Value<String> tags = const Value.absent(),
            Value<String> extras = const Value.absent(),
            Value<bool> supportsQuickReply = const Value.absent(),
            Value<String?> quickReplyPlaceholder = const Value.absent(),
            Value<String?> quickReplyChoices = const Value.absent(),
            Value<String> actions = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotificationsCompanion(
            id: id,
            sourceDeviceId: sourceDeviceId,
            appName: appName,
            title: title,
            content: content,
            timestamp: timestamp,
            isRead: isRead,
            hasAttachment: hasAttachment,
            attachmentPath: attachmentPath,
            attachmentMimeType: attachmentMimeType,
            packageName: packageName,
            notificationId: notificationId,
            tags: tags,
            extras: extras,
            supportsQuickReply: supportsQuickReply,
            quickReplyPlaceholder: quickReplyPlaceholder,
            quickReplyChoices: quickReplyChoices,
            actions: actions,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String sourceDeviceId,
            required String appName,
            required String title,
            required String content,
            required DateTime timestamp,
            Value<bool> isRead = const Value.absent(),
            Value<bool> hasAttachment = const Value.absent(),
            Value<String?> attachmentPath = const Value.absent(),
            Value<String?> attachmentMimeType = const Value.absent(),
            Value<String?> packageName = const Value.absent(),
            Value<int?> notificationId = const Value.absent(),
            Value<String> tags = const Value.absent(),
            Value<String> extras = const Value.absent(),
            Value<bool> supportsQuickReply = const Value.absent(),
            Value<String?> quickReplyPlaceholder = const Value.absent(),
            Value<String?> quickReplyChoices = const Value.absent(),
            Value<String> actions = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotificationsCompanion.insert(
            id: id,
            sourceDeviceId: sourceDeviceId,
            appName: appName,
            title: title,
            content: content,
            timestamp: timestamp,
            isRead: isRead,
            hasAttachment: hasAttachment,
            attachmentPath: attachmentPath,
            attachmentMimeType: attachmentMimeType,
            packageName: packageName,
            notificationId: notificationId,
            tags: tags,
            extras: extras,
            supportsQuickReply: supportsQuickReply,
            quickReplyPlaceholder: quickReplyPlaceholder,
            quickReplyChoices: quickReplyChoices,
            actions: actions,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
        ));
}

class $$NotificationsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sourceDeviceId => $state.composableBuilder(
      column: $state.table.sourceDeviceId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get appName => $state.composableBuilder(
      column: $state.table.appName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isRead => $state.composableBuilder(
      column: $state.table.isRead,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get hasAttachment => $state.composableBuilder(
      column: $state.table.hasAttachment,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get attachmentPath => $state.composableBuilder(
      column: $state.table.attachmentPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get attachmentMimeType => $state.composableBuilder(
      column: $state.table.attachmentMimeType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get packageName => $state.composableBuilder(
      column: $state.table.packageName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get notificationId => $state.composableBuilder(
      column: $state.table.notificationId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tags => $state.composableBuilder(
      column: $state.table.tags,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get extras => $state.composableBuilder(
      column: $state.table.extras,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get supportsQuickReply => $state.composableBuilder(
      column: $state.table.supportsQuickReply,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get quickReplyPlaceholder => $state.composableBuilder(
      column: $state.table.quickReplyPlaceholder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get quickReplyChoices => $state.composableBuilder(
      column: $state.table.quickReplyChoices,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get actions => $state.composableBuilder(
      column: $state.table.actions,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$NotificationsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sourceDeviceId => $state.composableBuilder(
      column: $state.table.sourceDeviceId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get appName => $state.composableBuilder(
      column: $state.table.appName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isRead => $state.composableBuilder(
      column: $state.table.isRead,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get hasAttachment => $state.composableBuilder(
      column: $state.table.hasAttachment,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get attachmentPath => $state.composableBuilder(
      column: $state.table.attachmentPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get attachmentMimeType => $state.composableBuilder(
      column: $state.table.attachmentMimeType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get packageName => $state.composableBuilder(
      column: $state.table.packageName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get notificationId => $state.composableBuilder(
      column: $state.table.notificationId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tags => $state.composableBuilder(
      column: $state.table.tags,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get extras => $state.composableBuilder(
      column: $state.table.extras,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get supportsQuickReply => $state.composableBuilder(
      column: $state.table.supportsQuickReply,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get quickReplyPlaceholder => $state.composableBuilder(
      column: $state.table.quickReplyPlaceholder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get quickReplyChoices => $state.composableBuilder(
      column: $state.table.quickReplyChoices,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get actions => $state.composableBuilder(
      column: $state.table.actions,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$DevicesTableCreateCompanionBuilder = DevicesCompanion Function({
  Value<String> id,
  required String name,
  required String platform,
  required String localIp,
  Value<int?> port,
  Value<String> connectionState,
  required DateTime lastSeen,
  Value<String> permissions,
  Value<String?> publicKey,
  Value<String> metadata,
  Value<String> allowedApps,
  Value<String> blockedApps,
  Value<String> keywordFilters,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$DevicesTableUpdateCompanionBuilder = DevicesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> platform,
  Value<String> localIp,
  Value<int?> port,
  Value<String> connectionState,
  Value<DateTime> lastSeen,
  Value<String> permissions,
  Value<String?> publicKey,
  Value<String> metadata,
  Value<String> allowedApps,
  Value<String> blockedApps,
  Value<String> keywordFilters,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$DevicesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DevicesTable,
    DeviceEntity,
    $$DevicesTableFilterComposer,
    $$DevicesTableOrderingComposer,
    $$DevicesTableCreateCompanionBuilder,
    $$DevicesTableUpdateCompanionBuilder> {
  $$DevicesTableTableManager(_$AppDatabase db, $DevicesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DevicesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$DevicesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> platform = const Value.absent(),
            Value<String> localIp = const Value.absent(),
            Value<int?> port = const Value.absent(),
            Value<String> connectionState = const Value.absent(),
            Value<DateTime> lastSeen = const Value.absent(),
            Value<String> permissions = const Value.absent(),
            Value<String?> publicKey = const Value.absent(),
            Value<String> metadata = const Value.absent(),
            Value<String> allowedApps = const Value.absent(),
            Value<String> blockedApps = const Value.absent(),
            Value<String> keywordFilters = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DevicesCompanion(
            id: id,
            name: name,
            platform: platform,
            localIp: localIp,
            port: port,
            connectionState: connectionState,
            lastSeen: lastSeen,
            permissions: permissions,
            publicKey: publicKey,
            metadata: metadata,
            allowedApps: allowedApps,
            blockedApps: blockedApps,
            keywordFilters: keywordFilters,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String name,
            required String platform,
            required String localIp,
            Value<int?> port = const Value.absent(),
            Value<String> connectionState = const Value.absent(),
            required DateTime lastSeen,
            Value<String> permissions = const Value.absent(),
            Value<String?> publicKey = const Value.absent(),
            Value<String> metadata = const Value.absent(),
            Value<String> allowedApps = const Value.absent(),
            Value<String> blockedApps = const Value.absent(),
            Value<String> keywordFilters = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DevicesCompanion.insert(
            id: id,
            name: name,
            platform: platform,
            localIp: localIp,
            port: port,
            connectionState: connectionState,
            lastSeen: lastSeen,
            permissions: permissions,
            publicKey: publicKey,
            metadata: metadata,
            allowedApps: allowedApps,
            blockedApps: blockedApps,
            keywordFilters: keywordFilters,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
        ));
}

class $$DevicesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get platform => $state.composableBuilder(
      column: $state.table.platform,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get localIp => $state.composableBuilder(
      column: $state.table.localIp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get port => $state.composableBuilder(
      column: $state.table.port,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get connectionState => $state.composableBuilder(
      column: $state.table.connectionState,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastSeen => $state.composableBuilder(
      column: $state.table.lastSeen,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get permissions => $state.composableBuilder(
      column: $state.table.permissions,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get publicKey => $state.composableBuilder(
      column: $state.table.publicKey,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get metadata => $state.composableBuilder(
      column: $state.table.metadata,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get allowedApps => $state.composableBuilder(
      column: $state.table.allowedApps,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get blockedApps => $state.composableBuilder(
      column: $state.table.blockedApps,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get keywordFilters => $state.composableBuilder(
      column: $state.table.keywordFilters,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DevicesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get platform => $state.composableBuilder(
      column: $state.table.platform,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get localIp => $state.composableBuilder(
      column: $state.table.localIp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get port => $state.composableBuilder(
      column: $state.table.port,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get connectionState => $state.composableBuilder(
      column: $state.table.connectionState,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastSeen => $state.composableBuilder(
      column: $state.table.lastSeen,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get permissions => $state.composableBuilder(
      column: $state.table.permissions,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get publicKey => $state.composableBuilder(
      column: $state.table.publicKey,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get metadata => $state.composableBuilder(
      column: $state.table.metadata,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get allowedApps => $state.composableBuilder(
      column: $state.table.allowedApps,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get blockedApps => $state.composableBuilder(
      column: $state.table.blockedApps,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get keywordFilters => $state.composableBuilder(
      column: $state.table.keywordFilters,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$NotificationGroupsTableCreateCompanionBuilder
    = NotificationGroupsCompanion Function({
  required String signature,
  Value<String> notificationIds,
  Value<int> count,
  required DateTime firstSeen,
  required DateTime lastUpdated,
  Value<bool> isExpanded,
  Value<int> rowid,
});
typedef $$NotificationGroupsTableUpdateCompanionBuilder
    = NotificationGroupsCompanion Function({
  Value<String> signature,
  Value<String> notificationIds,
  Value<int> count,
  Value<DateTime> firstSeen,
  Value<DateTime> lastUpdated,
  Value<bool> isExpanded,
  Value<int> rowid,
});

class $$NotificationGroupsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotificationGroupsTable,
    NotificationGroupEntity,
    $$NotificationGroupsTableFilterComposer,
    $$NotificationGroupsTableOrderingComposer,
    $$NotificationGroupsTableCreateCompanionBuilder,
    $$NotificationGroupsTableUpdateCompanionBuilder> {
  $$NotificationGroupsTableTableManager(
      _$AppDatabase db, $NotificationGroupsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$NotificationGroupsTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$NotificationGroupsTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> signature = const Value.absent(),
            Value<String> notificationIds = const Value.absent(),
            Value<int> count = const Value.absent(),
            Value<DateTime> firstSeen = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<bool> isExpanded = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotificationGroupsCompanion(
            signature: signature,
            notificationIds: notificationIds,
            count: count,
            firstSeen: firstSeen,
            lastUpdated: lastUpdated,
            isExpanded: isExpanded,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String signature,
            Value<String> notificationIds = const Value.absent(),
            Value<int> count = const Value.absent(),
            required DateTime firstSeen,
            required DateTime lastUpdated,
            Value<bool> isExpanded = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotificationGroupsCompanion.insert(
            signature: signature,
            notificationIds: notificationIds,
            count: count,
            firstSeen: firstSeen,
            lastUpdated: lastUpdated,
            isExpanded: isExpanded,
            rowid: rowid,
          ),
        ));
}

class $$NotificationGroupsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $NotificationGroupsTable> {
  $$NotificationGroupsTableFilterComposer(super.$state);
  ColumnFilters<String> get signature => $state.composableBuilder(
      column: $state.table.signature,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get notificationIds => $state.composableBuilder(
      column: $state.table.notificationIds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get count => $state.composableBuilder(
      column: $state.table.count,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get firstSeen => $state.composableBuilder(
      column: $state.table.firstSeen,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastUpdated => $state.composableBuilder(
      column: $state.table.lastUpdated,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isExpanded => $state.composableBuilder(
      column: $state.table.isExpanded,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$NotificationGroupsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $NotificationGroupsTable> {
  $$NotificationGroupsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get signature => $state.composableBuilder(
      column: $state.table.signature,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get notificationIds => $state.composableBuilder(
      column: $state.table.notificationIds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get count => $state.composableBuilder(
      column: $state.table.count,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get firstSeen => $state.composableBuilder(
      column: $state.table.firstSeen,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastUpdated => $state.composableBuilder(
      column: $state.table.lastUpdated,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isExpanded => $state.composableBuilder(
      column: $state.table.isExpanded,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$FilterSettingsTableTableCreateCompanionBuilder
    = FilterSettingsTableCompanion Function({
  Value<int> id,
  Value<String> whitelistApps,
  Value<String> blacklistApps,
  Value<String> keywordWhitelist,
  Value<String> keywordBlacklist,
  Value<bool> enableDeduplication,
  Value<String> dedupWindow,
  Value<bool> showSystemNotifications,
  Value<String> minPriority,
  Value<DateTime> updatedAt,
});
typedef $$FilterSettingsTableTableUpdateCompanionBuilder
    = FilterSettingsTableCompanion Function({
  Value<int> id,
  Value<String> whitelistApps,
  Value<String> blacklistApps,
  Value<String> keywordWhitelist,
  Value<String> keywordBlacklist,
  Value<bool> enableDeduplication,
  Value<String> dedupWindow,
  Value<bool> showSystemNotifications,
  Value<String> minPriority,
  Value<DateTime> updatedAt,
});

class $$FilterSettingsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FilterSettingsTableTable,
    FilterSettingsEntity,
    $$FilterSettingsTableTableFilterComposer,
    $$FilterSettingsTableTableOrderingComposer,
    $$FilterSettingsTableTableCreateCompanionBuilder,
    $$FilterSettingsTableTableUpdateCompanionBuilder> {
  $$FilterSettingsTableTableTableManager(
      _$AppDatabase db, $FilterSettingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$FilterSettingsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$FilterSettingsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> whitelistApps = const Value.absent(),
            Value<String> blacklistApps = const Value.absent(),
            Value<String> keywordWhitelist = const Value.absent(),
            Value<String> keywordBlacklist = const Value.absent(),
            Value<bool> enableDeduplication = const Value.absent(),
            Value<String> dedupWindow = const Value.absent(),
            Value<bool> showSystemNotifications = const Value.absent(),
            Value<String> minPriority = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              FilterSettingsTableCompanion(
            id: id,
            whitelistApps: whitelistApps,
            blacklistApps: blacklistApps,
            keywordWhitelist: keywordWhitelist,
            keywordBlacklist: keywordBlacklist,
            enableDeduplication: enableDeduplication,
            dedupWindow: dedupWindow,
            showSystemNotifications: showSystemNotifications,
            minPriority: minPriority,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> whitelistApps = const Value.absent(),
            Value<String> blacklistApps = const Value.absent(),
            Value<String> keywordWhitelist = const Value.absent(),
            Value<String> keywordBlacklist = const Value.absent(),
            Value<bool> enableDeduplication = const Value.absent(),
            Value<String> dedupWindow = const Value.absent(),
            Value<bool> showSystemNotifications = const Value.absent(),
            Value<String> minPriority = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              FilterSettingsTableCompanion.insert(
            id: id,
            whitelistApps: whitelistApps,
            blacklistApps: blacklistApps,
            keywordWhitelist: keywordWhitelist,
            keywordBlacklist: keywordBlacklist,
            enableDeduplication: enableDeduplication,
            dedupWindow: dedupWindow,
            showSystemNotifications: showSystemNotifications,
            minPriority: minPriority,
            updatedAt: updatedAt,
          ),
        ));
}

class $$FilterSettingsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FilterSettingsTableTable> {
  $$FilterSettingsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get whitelistApps => $state.composableBuilder(
      column: $state.table.whitelistApps,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get blacklistApps => $state.composableBuilder(
      column: $state.table.blacklistApps,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get keywordWhitelist => $state.composableBuilder(
      column: $state.table.keywordWhitelist,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get keywordBlacklist => $state.composableBuilder(
      column: $state.table.keywordBlacklist,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get enableDeduplication => $state.composableBuilder(
      column: $state.table.enableDeduplication,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get dedupWindow => $state.composableBuilder(
      column: $state.table.dedupWindow,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get showSystemNotifications => $state.composableBuilder(
      column: $state.table.showSystemNotifications,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get minPriority => $state.composableBuilder(
      column: $state.table.minPriority,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FilterSettingsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FilterSettingsTableTable> {
  $$FilterSettingsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get whitelistApps => $state.composableBuilder(
      column: $state.table.whitelistApps,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get blacklistApps => $state.composableBuilder(
      column: $state.table.blacklistApps,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get keywordWhitelist => $state.composableBuilder(
      column: $state.table.keywordWhitelist,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get keywordBlacklist => $state.composableBuilder(
      column: $state.table.keywordBlacklist,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get enableDeduplication => $state.composableBuilder(
      column: $state.table.enableDeduplication,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get dedupWindow => $state.composableBuilder(
      column: $state.table.dedupWindow,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get showSystemNotifications => $state.composableBuilder(
      column: $state.table.showSystemNotifications,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get minPriority => $state.composableBuilder(
      column: $state.table.minPriority,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NotificationsTableTableManager get notifications =>
      $$NotificationsTableTableManager(_db, _db.notifications);
  $$DevicesTableTableManager get devices =>
      $$DevicesTableTableManager(_db, _db.devices);
  $$NotificationGroupsTableTableManager get notificationGroups =>
      $$NotificationGroupsTableTableManager(_db, _db.notificationGroups);
  $$FilterSettingsTableTableTableManager get filterSettingsTable =>
      $$FilterSettingsTableTableTableManager(_db, _db.filterSettingsTable);
}
