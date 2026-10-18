// Drift database schema for notification persistence

import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:uuid/uuid.dart';

part 'app_database.g.dart';

const _uuid = Uuid();

@DataClassName('NotificationEntity')
class Notifications extends Table {
  TextColumn get id => text().withDefault(const Constant(''))();
  TextColumn get sourceDeviceId => text()();
  TextColumn get appName => text()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  DateTimeColumn get timestamp => dateTime()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  BoolColumn get hasAttachment => boolean().withDefault(const Constant(false))();
  TextColumn get attachmentPath => text().nullable()();
  TextColumn get attachmentMimeType => text().nullable()();
  TextColumn get packageName => text().nullable()();
  IntColumn get notificationId => integer().nullable()();
  TextColumn get tags => text().withDefault(const Constant('[]'))(); // JSON array
  TextColumn get extras => text().withDefault(const Constant('{}'))(); // JSON object
  BoolColumn get supportsQuickReply => boolean().withDefault(const Constant(false))();
  TextColumn get quickReplyPlaceholder => text().nullable()();
  TextColumn get quickReplyChoices => text().nullable()(); // JSON array
  TextColumn get actions => text().withDefault(const Constant('[]'))(); // JSON array
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};

  // Indexes for common queries - using proper Drift index syntax
  @override
  List<Index> get indexes => [
    Index(name: 'idx_notifications_device_time', columns: {sourceDeviceId, timestamp}, unique: false),
    Index(name: 'idx_notifications_app_time', columns: {appName, timestamp}, unique: false),
    Index(name: 'idx_notifications_read', columns: {isRead, timestamp}, unique: false),
    Index(name: 'idx_notifications_unread_device', columns: {sourceDeviceId, isRead, timestamp}, unique: false),
  ];
}

@DataClassName('DeviceEntity')
class Devices extends Table {
  TextColumn get id => text().withDefault(const Constant(''))();
  TextColumn get name => text()();
  TextColumn get platform => text()(); // Store as string: android, ios, linux, etc.
  TextColumn get localIp => text()();
  IntColumn get port => integer().nullable()();
  TextColumn get connectionState => text().withDefault(const Constant('disconnected'))();
  DateTimeColumn get lastSeen => dateTime()();
  TextColumn get permissions => text().withDefault(const Constant('read_only'))();
  TextColumn get publicKey => text().nullable()();
  TextColumn get metadata => text().withDefault(const Constant('{}'))();
  TextColumn get allowedApps => text().withDefault(const Constant('[]'))();
  TextColumn get blockedApps => text().withDefault(const Constant('[]'))();
  TextColumn get keywordFilters => text().withDefault(const Constant('[]'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('NotificationGroupEntity')
class NotificationGroups extends Table {
  TextColumn get signature => text()();
  TextColumn get notificationIds => text().withDefault(const Constant('[]'))(); // JSON array
  IntColumn get count => integer().withDefault(const Constant(1))();
  DateTimeColumn get firstSeen => dateTime()();
  DateTimeColumn get lastUpdated => dateTime()();
  BoolColumn get isExpanded => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {signature};
}

@DataClassName('FilterSettingsEntity')
class FilterSettingsTable extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))(); // Singleton
  TextColumn get whitelistApps => text().withDefault(const Constant('[]'))();
  TextColumn get blacklistApps => text().withDefault(const Constant('[]'))();
  TextColumn get keywordWhitelist => text().withDefault(const Constant('[]'))();
  TextColumn get keywordBlacklist => text().withDefault(const Constant('[]'))();
  BoolColumn get enableDeduplication => boolean().withDefault(const Constant(true))();
  TextColumn get dedupWindow => text().withDefault(const Constant('minutes5'))();
  BoolColumn get showSystemNotifications => boolean().withDefault(const Constant(true))();
  TextColumn get minPriority => text().withDefault(const Constant('low'))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Notifications, Devices, NotificationGroups, FilterSettingsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Future migrations here
    },
  );

  // Notification CRUD
  Future<int> insertNotification(NotificationsCompanion notification) =>
      into(notifications).insert(notification);

  Future<bool> updateNotification(NotificationsCompanion notification) =>
      update(notifications).replace(notification);

  Future<int> deleteNotification(String id) =>
      (delete(notifications)..where((t) => t.id.equals(id))).go();

  Future<NotificationEntity?> getNotification(String id) =>
      (select(notifications)..where((t) => t.id.equals(id))).getSingleOrNull();

  Stream<List<NotificationEntity>> watchNotifications({
    String? deviceId,
    bool? isRead,
    DateTime? since,
    int? limit,
    int? offset,
  }) {
    var query = select(notifications);

    if (deviceId != null) {
      query = query..where((t) => t.sourceDeviceId.equals(deviceId));
    }
    if (isRead != null) {
      query = query..where((t) => t.isRead.equals(isRead));
    }
    if (since != null) {
      query = query..where((t) => t.timestamp.isBiggerOrEqualValue(since));
    }

    query = query..orderBy([(t) => OrderingTerm.desc(t.timestamp)]);

    if (limit != null) {
      query = query..limit(limit, offset: offset);
    }

    return query.watch();
  }

  Future<List<NotificationEntity>> getNotifications({
    String? deviceId,
    bool? isRead,
    DateTime? since,
    int? limit,
    int? offset,
  }) {
    var query = select(notifications);

    if (deviceId != null) {
      query = query..where((t) => t.sourceDeviceId.equals(deviceId));
    }
    if (isRead != null) {
      query = query..where((t) => t.isRead.equals(isRead));
    }
    if (since != null) {
      query = query..where((t) => t.timestamp.isBiggerOrEqualValue(since));
    }

    query = query..orderBy([(t) => OrderingTerm.desc(t.timestamp)]);

    if (limit != null) {
      query = query..limit(limit, offset: offset);
    }

    return query.get();
  }

  Future<int> markAsRead(String id) =>
      (update(notifications)..where((t) => t.id.equals(id)))
          .write(NotificationsCompanion(isRead: const Value(true), updatedAt: Value(DateTime.now())));

  Future<int> markAllAsRead({String? deviceId}) {
    var query = update(notifications)..where((t) => t.isRead.equals(false));
    if (deviceId != null) {
      query = query..where((t) => t.sourceDeviceId.equals(deviceId));
    }
    return query.write(NotificationsCompanion(isRead: const Value(true), updatedAt: Value(DateTime.now())));
  }

  // Device CRUD
  Future<int> insertDevice(DevicesCompanion device) => into(devices).insert(device);

  Future<bool> updateDevice(DevicesCompanion device) => update(devices).replace(device);

  Future<int> deleteDevice(String id) =>
      (delete(devices)..where((t) => t.id.equals(id))).go();

  Future<DeviceEntity?> getDevice(String id) =>
      (select(devices)...where((t) => t.id.equals(id))).getSingleOrNull();

  Stream<List<DeviceEntity>> watchDevices({DeviceConnectionState? state}) {
    var query = select(devices);
    if (state != null) {
      query = query..where((t) => t.connectionState.equals(state.name));
    }
    return query.watch();
  }

  Future<List<DeviceEntity>> getDevices({DeviceConnectionState? state}) {
    var query = select(devices);
    if (state != null) {
      query = query..where((t) => t.connectionState.equals(state.name));
    }
    return query.get();
  }

  Future<int> updateDeviceConnectionState(String id, DeviceConnectionState state) =>
      (update(devices)..where((t) => t.id.equals(id)))
          .write(DevicesCompanion(
            connectionState: Value(state.name),
            lastSeen: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
          ));

  // Notification Groups
  Future<int> upsertGroup(NotificationGroupsCompanion group) =>
      into(notificationGroups).insertOnConflictUpdate(group);

  Stream<List<NotificationGroupEntity>> watchGroups() =>
      select(notificationGroups).watch();

  // Filter Settings
  Future<FilterSettingsEntity> getFilterSettings() async {
    final result = await (select(filterSettingsTable)..limit(1)).getSingleOrNull();
    if (result != null) return result;

    // Create default settings
    await into(filterSettingsTable).insert(
      FilterSettingsTableCompanion.insert(
        id: const Value(1),
        whitelistApps: const Value('[]'),
        blacklistApps: const Value('[]'),
        keywordWhitelist: const Value('[]'),
        keywordBlacklist: const Value('[]'),
        enableDeduplication: const Value(true),
        dedupWindow: const Value('minutes5'),
        showSystemNotifications: const Value(true),
        minPriority: const Value('low'),
      ),
    );
    return (await (select(filterSettingsTable)..limit(1)).getSingle())!;
  }

  Future<int> updateFilterSettings(FilterSettingsTableCompanion settings) =>
      (update(filterSettingsTable)..where((t) => t.id.equals(1))).write(settings);

  // Search
  Stream<List<NotificationEntity>> searchNotifications(String query, {int limit = 50}) {
    final searchTerm = '%$query%';
    return (select(notifications)
          ..where((t) => t.title.like(searchTerm) | t.content.like(searchTerm) | t.appName.like(searchTerm))
          ..orderBy([(t) => OrderingTerm.desc(t.timestamp)])
          ..limit(limit))
        .watch();
  }

  Future<List<NotificationEntity>> getNotificationsByDateRange(
    DateTime start,
    DateTime end, {
    String? deviceId,
    List<String>? appNames,
    bool? hasAttachment,
    bool? isRead,
    int limit = 50,
    int offset = 0,
  }) {
    var query = select(notifications)
      ..where((t) => t.timestamp.isBetweenValues(start, end))
      ..orderBy([(t) => OrderingTerm.desc(t.timestamp)])
      ..limit(limit, offset: offset);

    if (deviceId != null) {
      query = query..where((t) => t.sourceDeviceId.equals(deviceId));
    }
    if (appNames != null && appNames.isNotEmpty) {
      query = query..where((t) => t.appName.isIn(appNames));
    }
    if (hasAttachment != null) {
      query = query..where((t) => t.hasAttachment.equals(hasAttachment));
    }
    if (isRead != null) {
      query = query..where((t) => t.isRead.equals(isRead));
    }

    return query.get();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'notification_hub.sqlite'));
    return NativeDatabase(file);
  });
}