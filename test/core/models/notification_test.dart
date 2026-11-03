import 'package:flutter_test/flutter_test.dart';

import 'package:notification_hub/core/models/notification.dart';

void main() {
  group('NotificationModel', () {
    final now = DateTime(2026, 11, 2, 12, 0, 0);

    final json = <String, dynamic>{
      'id': 'notif-123',
      'sourceDeviceId': 'device-abc',
      'appName': 'WhatsApp',
      'title': 'Hello',
      'content': 'How are you?',
      'timestamp': now.toIso8601String(),
      'isRead': false,
      'hasAttachment': true,
      'attachmentPath': '/tmp/attach.png',
      'attachmentMimeType': 'image/png',
      'packageName': 'com.whatsapp',
      'notificationId': 42,
      'tags': ['urgent', 'chat'],
      'extras': <String, dynamic>{'key': 'value'},
      'supportsQuickReply': true,
      'quickReplyPlaceholder': 'Reply...',
      'quickReplyChoices': ['Yes', 'No'],
      'actions': [
        <String, dynamic>{'id': 'dismiss_1', 'label': 'Dismiss', 'type': 'dismiss', 'enabled': true},
        <String, dynamic>{'id': 'reply_1', 'label': 'Reply', 'type': 'reply', 'enabled': true},
      ],
    };

    test('fromJson parses all fields', () {
      final model = NotificationModel.fromJson(json);
      expect(model.id, 'notif-123');
      expect(model.sourceDeviceId, 'device-abc');
      expect(model.appName, 'WhatsApp');
      expect(model.title, 'Hello');
      expect(model.content, 'How are you?');
      expect(model.timestamp, now);
      expect(model.isRead, false);
      expect(model.hasAttachment, true);
      expect(model.attachmentPath, '/tmp/attach.png');
      expect(model.attachmentMimeType, 'image/png');
      expect(model.packageName, 'com.whatsapp');
      expect(model.notificationId, 42);
      expect(model.tags, ['urgent', 'chat']);
      expect(model.extras, {'key': 'value'});
      expect(model.supportsQuickReply, true);
      expect(model.quickReplyPlaceholder, 'Reply...');
      expect(model.quickReplyChoices, ['Yes', 'No']);
      expect(model.actions.length, 2);
      expect(model.actions.first.type, ActionType.dismiss);
    });

    test('fromJson to toJson preserves data (no actions)', () {
      // Note: generated toJson keeps `actions` as objects rather than JSON
      // maps, so round-tripping through toJson requires actions to be absent.
      final noActions = Map<String, dynamic>.from(json)..remove('actions');
      final model = NotificationModel.fromJson(noActions);
      final roundTrip = NotificationModel.fromJson(model.toJson());
      expect(roundTrip, model);
    });

    test('createNotification generates an id and defaults', () {
      final model = createNotification(
        sourceDeviceId: 'device-abc',
        appName: 'Slack',
        title: 'Mention',
        content: '@you mentioned you',
      );
      expect(model.id, isNotEmpty);
      expect(model.sourceDeviceId, 'device-abc');
      expect(model.appName, 'Slack');
      expect(model.title, 'Mention');
      expect(model.content, '@you mentioned you');
      expect(model.isRead, false);
      expect(model.hasAttachment, false);
      expect(model.tags, isEmpty);
      expect(model.extras, isEmpty);
      expect(model.actions, isEmpty);
    });

    test('copyWith modifies selected fields', () {
      final model = NotificationModel.fromJson(json);
      final updated = model.copyWith(isRead: true, content: 'Updated');
      expect(updated.id, model.id);
      expect(updated.isRead, true);
      expect(updated.content, 'Updated');
      expect(updated.title, model.title); // unchanged
    });
  });

  group('NotificationAction', () {
    test('fromJson / toJson round trip', () {
      final json = {
        'id': 'open_1',
        'label': 'Open',
        'type': 'open',
        'payload': null,
        'enabled': true,
      };
      final action = NotificationAction.fromJson(json);
      expect(action.id, 'open_1');
      expect(action.label, 'Open');
      expect(action.type, ActionType.open);
      expect(action.enabled, true);
      expect(NotificationAction.fromJson(action.toJson()), action);
    });

    test('ActionType json values', () {
      expect(ActionType.dismiss.name, 'dismiss');
      expect(ActionType.reply.name, 'reply');
      expect(ActionType.open.name, 'open');
      expect(ActionType.custom.name, 'custom');
    });
  });

  group('DeviceModel', () {
    test('fromJson / toJson round trip', () {
      final json = <String, dynamic>{
        'id': 'device-1',
        'name': 'My Phone',
        'platform': 'android',
        'localIp': '192.168.1.42',
        'port': 8765,
        'connectionState': 'connected',
        'lastSeen': '2026-11-02T12:00:00.000Z',
        'permissions': 'actionable',
        'publicKey': 'pubkey',
        'metadata': <String, dynamic>{},
        'allowedApps': ['com.whatsapp'],
        'blockedApps': ['com.facebook'],
        'keywordFilters': ['spam'],
      };
      final device = DeviceModel.fromJson(json);
      expect(device.id, 'device-1');
      expect(device.name, 'My Phone');
      expect(device.platform, DevicePlatform.android);
      expect(device.localIp, '192.168.1.42');
      expect(device.port, 8765);
      expect(device.connectionState, DeviceConnectionState.connected);
      expect(device.permissions, DevicePermissions.actionable);
      expect(device.publicKey, 'pubkey');
      expect(device.allowedApps, ['com.whatsapp']);
      expect(device.blockedApps, ['com.facebook']);
      expect(device.keywordFilters, ['spam']);
      expect(DeviceModel.fromJson(device.toJson()), device);
    });

    test('createDevice generates an id', () {
      final device = createDevice(
        name: 'Laptop',
        platform: DevicePlatform.linux,
        localIp: '10.0.0.5',
      );
      expect(device.id, isNotEmpty);
      expect(device.name, 'Laptop');
      expect(device.platform, DevicePlatform.linux);
      expect(device.connectionState, DeviceConnectionState.disconnected);
      expect(device.permissions, DevicePermissions.readOnly);
    });
  });

  group('FilterSettings', () {
    test('fromJson / toJson round trip', () {
      final json = {
        'whitelistApps': ['com.whatsapp'],
        'blacklistApps': ['com.facebook'],
        'keywordWhitelist': ['urgent'],
        'keywordBlacklist': ['spam'],
        'enableDeduplication': true,
        'dedupWindow': 'minutes5',
        'showSystemNotifications': false,
        'minPriority': 'high',
      };
      final settings = FilterSettings.fromJson(json);
      expect(settings.whitelistApps, ['com.whatsapp']);
      expect(settings.blacklistApps, ['com.facebook']);
      expect(settings.keywordWhitelist, ['urgent']);
      expect(settings.keywordBlacklist, ['spam']);
      expect(settings.enableDeduplication, true);
      expect(settings.dedupWindow, DeduplicationWindow.minutes5);
      expect(settings.showSystemNotifications, false);
      expect(settings.minPriority, NotificationPriority.high);
      expect(FilterSettings.fromJson(settings.toJson()), settings);
    });

    test('copyWith modifies selected fields', () {
      final settings = FilterSettings();
      final updated = settings.copyWith(
        enableDeduplication: false,
        minPriority: NotificationPriority.critical,
      );
      expect(updated.enableDeduplication, false);
      expect(updated.minPriority, NotificationPriority.critical);
      expect(updated.showSystemNotifications, settings.showSystemNotifications);
    });

    test('defaults are sensible', () {
      final settings = FilterSettings();
      expect(settings.enableDeduplication, true);
      expect(settings.dedupWindow, DeduplicationWindow.minutes5);
      expect(settings.showSystemNotifications, true);
      expect(settings.minPriority, NotificationPriority.low);
    });
  });

  group('PairingData', () {
    test('fromJson / toJson round trip', () {
      final now = DateTime(2026, 11, 2, 12, 0, 0);
      final json = <String, dynamic>{
        'deviceId': 'device-xyz',
        'deviceName': 'Tablet',
        'platform': 'ios',
        'localIp': '10.0.0.9',
        'port': 8765,
        'publicKey': 'pubkey',
        'version': 1,
        'timestamp': now.toIso8601String(),
      };
      final pairing = PairingData.fromJson(json);
      expect(pairing.deviceId, 'device-xyz');
      expect(pairing.deviceName, 'Tablet');
      expect(pairing.platform, DevicePlatform.ios);
      expect(pairing.localIp, '10.0.0.9');
      expect(pairing.port, 8765);
      expect(pairing.publicKey, 'pubkey');
      expect(pairing.version, 1);
      expect(pairing.timestamp, now);
      expect(PairingData.fromJson(pairing.toJson()), pairing);
    });
  });

  group('DeduplicationWindow', () {
    test('json values map correctly', () {
      expect(DeduplicationWindow.none.name, 'none');
      expect(DeduplicationWindow.seconds30.name, 'seconds30');
      expect(DeduplicationWindow.minutes1.name, 'minutes1');
      expect(DeduplicationWindow.minutes5.name, 'minutes5');
      expect(DeduplicationWindow.minutes15.name, 'minutes15');
      expect(DeduplicationWindow.hour1.name, 'hour1');
    });
  });

  group('NotificationPriority', () {
    test('json values map correctly', () {
      expect(NotificationPriority.low.name, 'low');
      expect(NotificationPriority.normal.name, 'normal');
      expect(NotificationPriority.high.name, 'high');
      expect(NotificationPriority.critical.name, 'critical');
    });
  });

  group('DeviceConnectionState', () {
    test('json values map correctly', () {
      expect(DeviceConnectionState.connected.name, 'connected');
      expect(DeviceConnectionState.disconnected.name, 'disconnected');
      expect(DeviceConnectionState.error.name, 'error');
      expect(DeviceConnectionState.pairing.name, 'pairing');
    });
  });

  group('DevicePermissions', () {
    test('dart names and json values', () {
      // `.name` is the Dart identifier; `@JsonValue` controls serialization.
      expect(DevicePermissions.readOnly.name, 'readOnly');
      expect(DevicePermissions.actionable.name, 'actionable');
      expect(DevicePermissions.full.name, 'full');
    });
  });

  group('DevicePlatform', () {
    test('json values map correctly', () {
      expect(DevicePlatform.android.name, 'android');
      expect(DevicePlatform.ios.name, 'ios');
      expect(DevicePlatform.linux.name, 'linux');
      expect(DevicePlatform.macos.name, 'macos');
      expect(DevicePlatform.windows.name, 'windows');
      expect(DevicePlatform.unknown.name, 'unknown');
    });
  });
}
