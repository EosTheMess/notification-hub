// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'68c9ad772c198d1a34d2dcccc0a6a35f43092fd5';

/// Database provider
///
/// Copied from [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = AutoDisposeProvider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = AutoDisposeProviderRef<AppDatabase>;
String _$deviceIdHash() => r'd2843861c07a7562778ceaefc64c74622dcff817';

/// Current device ID provider
///
/// Copied from [deviceId].
@ProviderFor(deviceId)
final deviceIdProvider = AutoDisposeProvider<String>.internal(
  deviceId,
  name: r'deviceIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$deviceIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DeviceIdRef = AutoDisposeProviderRef<String>;
String _$currentDeviceHash() => r'f33d069a611096005994450f81a85f8c2fee78f4';

/// Current device model provider
///
/// Copied from [currentDevice].
@ProviderFor(currentDevice)
final currentDeviceProvider = AutoDisposeProvider<DeviceModel>.internal(
  currentDevice,
  name: r'currentDeviceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentDeviceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentDeviceRef = AutoDisposeProviderRef<DeviceModel>;
String _$filterSettingsNotifierHash() =>
    r'012a9221d3282e88920c64c87a5619f35a9824e7';

/// Filter settings provider
///
/// Copied from [FilterSettingsNotifier].
@ProviderFor(FilterSettingsNotifier)
final filterSettingsNotifierProvider = AutoDisposeAsyncNotifierProvider<
    FilterSettingsNotifier, FilterSettings>.internal(
  FilterSettingsNotifier.new,
  name: r'filterSettingsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filterSettingsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FilterSettingsNotifier = AutoDisposeAsyncNotifier<FilterSettings>;
String _$networkServiceNotifierHash() =>
    r'0fc21973d415ed18d8c16f94dbdcd5c2c16cb6b7';

/// Network service provider
///
/// Copied from [NetworkServiceNotifier].
@ProviderFor(NetworkServiceNotifier)
final networkServiceNotifierProvider = AutoDisposeAsyncNotifierProvider<
    NetworkServiceNotifier, NetworkService?>.internal(
  NetworkServiceNotifier.new,
  name: r'networkServiceNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkServiceNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NetworkServiceNotifier = AutoDisposeAsyncNotifier<NetworkService?>;
String _$notificationRepositoryHash() =>
    r'f1dca31b6a0bbf50b771b729418976ac998e907c';

/// Notification repository provider
///
/// Copied from [NotificationRepository].
@ProviderFor(NotificationRepository)
final notificationRepositoryProvider =
    AutoDisposeAsyncNotifierProvider<NotificationRepository, void>.internal(
  NotificationRepository.new,
  name: r'notificationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationRepository = AutoDisposeAsyncNotifier<void>;
String _$liveNotificationFeedHash() =>
    r'e2493e13047f332098e70e195b945e9fa6d4f451';

/// Live notification feed provider with deduplication
///
/// Copied from [LiveNotificationFeed].
@ProviderFor(LiveNotificationFeed)
final liveNotificationFeedProvider = AutoDisposeStreamNotifierProvider<
    LiveNotificationFeed, List<NotificationGroup>>.internal(
  LiveNotificationFeed.new,
  name: r'liveNotificationFeedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveNotificationFeedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LiveNotificationFeed
    = AutoDisposeStreamNotifier<List<NotificationGroup>>;
String _$deviceManagerHash() => r'7ecf1c51893512da15f25bd9c15a597320cd17ca';

/// Device manager provider
///
/// Copied from [DeviceManager].
@ProviderFor(DeviceManager)
final deviceManagerProvider = AutoDisposeStreamNotifierProvider<DeviceManager,
    List<DeviceModel>>.internal(
  DeviceManager.new,
  name: r'deviceManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeviceManager = AutoDisposeStreamNotifier<List<DeviceModel>>;
String _$archiveProviderHash() => r'235e17c865be4c2b0792090961be7f85d4febf6c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ArchiveProvider
    extends BuildlessAutoDisposeAsyncNotifier<List<NotificationModel>> {
  late final ArchiveQuery query;

  FutureOr<List<NotificationModel>> build(
    ArchiveQuery query,
  );
}

/// Archive query provider
///
/// Copied from [ArchiveProvider].
@ProviderFor(ArchiveProvider)
const archiveProviderProvider = ArchiveProviderFamily();

/// Archive query provider
///
/// Copied from [ArchiveProvider].
class ArchiveProviderFamily
    extends Family<AsyncValue<List<NotificationModel>>> {
  /// Archive query provider
  ///
  /// Copied from [ArchiveProvider].
  const ArchiveProviderFamily();

  /// Archive query provider
  ///
  /// Copied from [ArchiveProvider].
  ArchiveProviderProvider call(
    ArchiveQuery query,
  ) {
    return ArchiveProviderProvider(
      query,
    );
  }

  @override
  ArchiveProviderProvider getProviderOverride(
    covariant ArchiveProviderProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'archiveProviderProvider';
}

/// Archive query provider
///
/// Copied from [ArchiveProvider].
class ArchiveProviderProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ArchiveProvider, List<NotificationModel>> {
  /// Archive query provider
  ///
  /// Copied from [ArchiveProvider].
  ArchiveProviderProvider(
    ArchiveQuery query,
  ) : this._internal(
          () => ArchiveProvider()..query = query,
          from: archiveProviderProvider,
          name: r'archiveProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$archiveProviderHash,
          dependencies: ArchiveProviderFamily._dependencies,
          allTransitiveDependencies:
              ArchiveProviderFamily._allTransitiveDependencies,
          query: query,
        );

  ArchiveProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final ArchiveQuery query;

  @override
  FutureOr<List<NotificationModel>> runNotifierBuild(
    covariant ArchiveProvider notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(ArchiveProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArchiveProviderProvider._internal(
        () => create()..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ArchiveProvider,
      List<NotificationModel>> createElement() {
    return _ArchiveProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArchiveProviderProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ArchiveProviderRef
    on AutoDisposeAsyncNotifierProviderRef<List<NotificationModel>> {
  /// The parameter `query` of this provider.
  ArchiveQuery get query;
}

class _ArchiveProviderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ArchiveProvider,
        List<NotificationModel>> with ArchiveProviderRef {
  _ArchiveProviderProviderElement(super.provider);

  @override
  ArchiveQuery get query => (origin as ArchiveProviderProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
