import 'package:flutter_test/flutter_test.dart';

import 'package:notification_hub/core/models/notification.dart';

void main() {
  group('FilterSettings defaults and copyWith', () {
    test('defaults are sensible', () {
      final settings = FilterSettings();
      expect(settings.enableDeduplication, true);
      expect(settings.dedupWindow, DeduplicationWindow.minutes5);
      expect(settings.showSystemNotifications, true);
      expect(settings.minPriority, NotificationPriority.low);
      expect(settings.whitelistApps, isEmpty);
      expect(settings.blacklistApps, isEmpty);
      expect(settings.keywordWhitelist, isEmpty);
      expect(settings.keywordBlacklist, isEmpty);
    });

    test('copyWith modifies selected fields only', () {
      final settings = FilterSettings();
      final updated = settings.copyWith(
        enableDeduplication: false,
        minPriority: NotificationPriority.critical,
        showSystemNotifications: false,
      );
      expect(updated.enableDeduplication, false);
      expect(updated.minPriority, NotificationPriority.critical);
      expect(updated.showSystemNotifications, false);
      // Untouched fields keep their defaults.
      expect(updated.dedupWindow, settings.dedupWindow);
      expect(updated.whitelistApps, settings.whitelistApps);
    });
  });

  group('Deduplication window', () {
    test('enum json values map correctly', () {
      expect(DeduplicationWindow.none.name, 'none');
      expect(DeduplicationWindow.seconds30.name, 'seconds30');
      expect(DeduplicationWindow.minutes1.name, 'minutes1');
      expect(DeduplicationWindow.minutes5.name, 'minutes5');
      expect(DeduplicationWindow.minutes15.name, 'minutes15');
      expect(DeduplicationWindow.hour1.name, 'hour1');
    });
  });

  group('Notification priority', () {
    test('enum json values map correctly', () {
      expect(NotificationPriority.low.name, 'low');
      expect(NotificationPriority.normal.name, 'normal');
      expect(NotificationPriority.high.name, 'high');
      expect(NotificationPriority.critical.name, 'critical');
    });
  });

  group('Device platform / connection / permissions', () {
    test('enum json values map correctly', () {
      expect(DevicePlatform.android.name, 'android');
      expect(DevicePlatform.ios.name, 'ios');
      expect(DevicePlatform.linux.name, 'linux');
      expect(DeviceConnectionState.connected.name, 'connected');
      expect(DeviceConnectionState.disconnected.name, 'disconnected');
      expect(DeviceConnectionState.pairing.name, 'pairing');
      expect(DevicePermissions.readOnly.name, 'readOnly');
      expect(DevicePermissions.actionable.name, 'actionable');
      expect(DevicePermissions.full.name, 'full');
    });
  });
}
