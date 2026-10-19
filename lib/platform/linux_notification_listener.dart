// Linux Notification Listener using DBus
// This file should be placed in: lib/platform/linux_notification_listener.dart

import 'dart:async';
import 'dart:convert';

import 'package:dbus/dbus.dart';
import 'package:riverpod/riverpod.dart';

import '../models/notification.dart';

class LinuxNotificationListener {
  static const String _busName = 'org.freedesktop.Notifications';
  static const String _objectPath = '/org/freedesktop/Notifications';
  static const String _interface = 'org.freedesktop.Notifications';

  DBusClient? _client;
  StreamController<NotificationModel>? _notificationController;
  String? _deviceId;
  Timer? _watchTimer;

  Stream<NotificationModel> get notifications => _notificationController!.stream;

  Future<void> initialize(String deviceId) async {
    _deviceId = deviceId;
    _notificationController = StreamController.broadcast();

    try {
      _client = await DBusClient.session();
      await _setupMatchRule();
      _startPolling();
      print('Linux notification listener initialized');
    } catch (e) {
      print('Failed to initialize Linux notification listener: $e');
      // Fallback to polling if DBus fails
      _startPolling();
    }
  }

  Future<void> _setupMatchRule() async {
    if (_client == null) return;

    try {
      // Add match rule for notification signals
      await _client!.requestBusName(
        'org.freedesktop.Notifications',
        flags: DBusNameFlags.allowReplacement | DBusNameFlags.replaceExisting,
      );

      // Listen for signals using the message stream
      _client!.messageStream.listen(_handleMessage);
    } catch (e) {
      print('Failed to setup DBus match rule: $e');
    }
  }

  void _handleMessage(DBusMessage message) {
    if (message is DBusSignal) {
      if (message.member == 'Notify' && message.interface == _interface) {
        _parseNotification(message.body);
      } else if (message.member == 'NotificationClosed') {
        _handleNotificationClosed(message.body);
      }
    }
  }

  void _parseNotification(List<dynamic> body) {
    // Notify method signature: (susssasa{sv}i)
    // app_name, replaces_id, app_icon, summary, body, actions, hints, expire_timeout
    if (body.length < 8) return;

    final appName = body[0] as String;
    final replacesId = body[1] as int;
    final appIcon = body[2] as String;
    final summary = body[3] as String;
    final bodyText = body[4] as String;
    final actions = body[5] as List<dynamic>;
    final hints = body[6] as Map<dynamic, dynamic>;
    final expireTimeout = body[7] as int;

    // Check for attachment in hints
    var hasAttachment = false;
    String? attachmentPath;
    String? attachmentMimeType;

    if (hints.containsKey('image-path') || hints.containsKey('image-data')) {
      hasAttachment = true;
      attachmentPath = hints['image-path'] as String?;
      attachmentMimeType = 'image/png';
    }

    // Build actions list
    final notificationActions = <NotificationAction>[];

    // Add dismiss action
    notificationActions.add(NotificationAction(
      id: 'dismiss_$replacesId',
      label: 'Dismiss',
      type: ActionType.dismiss,
    ));

    // Add open action
    notificationActions.add(NotificationAction(
      id: 'open_$replacesId',
      label: 'Open',
      type: ActionType.open,
    ));

    // Parse custom actions
    for (int i = 0; i < actions.length; i += 2) {
      if (i + 1 < actions.length) {
        final actionKey = actions[i] as String;
        final actionLabel = actions[i + 1] as String;
        notificationActions.add(NotificationAction(
          id: 'action_$actionKey',
          label: actionLabel,
          type: ActionType.custom,
          payload: actionKey,
        ));
      }
    }

    final notification = createNotification(
      sourceDeviceId: _deviceId!,
      appName: appName,
      title: summary,
      content: bodyText,
      timestamp: DateTime.now(),
      hasAttachment: hasAttachment,
      attachmentPath: attachmentPath,
      attachmentMimeType: attachmentMimeType,
      packageName: appName,
      notificationId: replacesId,
      tags: [],
      extras: hints.map((k, v) => MapEntry(k.toString(), v)),
      supportsQuickReply: false, // Linux notifications don't typically support quick reply
      actions: notificationActions,
    );

    _notificationController?.add(notification);
  }

  void _handleNotificationClosed(List<dynamic> body) {
    // NotificationClosed signal: (uint32 id, uint32 reason)
    if (body.length >= 2) {
      final id = body[0] as int;
      // Could emit a removal event here
      print('Notification closed: $id');
    }
  }

  void _startPolling() {
    // Fallback polling mechanism using notify-send or checking notification daemon
    _watchTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      _pollNotifications();
    });
  }

  Future<void> _pollNotifications() async {
    // Try to get notifications from notification daemon via DBus
    try {
      if (_client != null) {
        final result = await _client!.callMethod(
          _busName,
          _objectPath,
          _interface,
          'GetCapabilities',
          [],
        );
        print('Notification daemon capabilities: $result');
      }
    } catch (e) {
      // Ignore polling errors
    }
  }

  Future<void> dismissNotification(String packageName, int notificationId) async {
    if (_client == null) return;

    try {
      await _client!.callMethod(
        _busName,
        _objectPath,
        _interface,
        'CloseNotification',
        [notificationId],
      );
    } catch (e) {
      print('Failed to dismiss notification: $e');
    }
  }

  Future<void> replyToNotification(String packageName, int notificationId, String replyText) async {
    // Linux doesn't have standard quick reply via DBus
    // Would need app-specific implementation
    print('Quick reply not supported on Linux for $packageName:$notificationId');
  }

  void dispose() {
    _watchTimer?.cancel();
    _notificationController?.close();
    _client?.disconnect();
  }
}

/// Provider for Linux notification listener
final linuxNotificationListenerProvider = Provider<LinuxNotificationListener>((ref) {
  return LinuxNotificationListener();
});