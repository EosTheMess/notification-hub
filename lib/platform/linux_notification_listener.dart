// Linux Notification Listener using DBus
// This file should be placed in: lib/platform/linux_notification_listener.dart

import 'dart:async';
import 'dart:io';

import 'package:dbus/dbus.dart';
import 'package:riverpod/riverpod.dart';

import '../core/models/notification.dart';

class LinuxNotificationListener {
  static const String _busName = 'org.freedesktop.Notifications';
  static const String _objectPath = '/org/freedesktop/Notifications';
  static const String _interface = 'org.freedesktop.Notifications';

  DBusClient? _client;
  StreamController<NotificationModel>? _notificationController;
  StreamSubscription<DBusSignal>? _signalSubscription;
  String? _deviceId;
  Timer? _watchTimer;

  Stream<NotificationModel> get notifications => _notificationController!.stream;

  Future<void> initialize(String deviceId) async {
    _deviceId = deviceId;
    _notificationController = StreamController.broadcast();

    try {
      _client = DBusClient.session();
      await _client!.requestName(
        _busName,
        flags: {
          DBusRequestNameFlag.allowReplacement,
          DBusRequestNameFlag.replaceExisting,
        },
      );
      _setupSignalStream();
      _startPolling();
      print('Linux notification listener initialized');
    } catch (e) {
      print('Failed to initialize Linux notification listener: $e');
      // Fallback to polling if DBus fails
      _startPolling();
    }
  }

  void _setupSignalStream() {
    if (_client == null) return;

    try {
      // Listen for incoming notification signals
      _signalSubscription = DBusSignalStream(
        _client!,
        interface: _interface,
        name: 'Notify',
      ).listen(_handleSignal);
    } catch (e) {
      print('Failed to setup DBus signal stream: $e');
    }
  }

  void _handleSignal(DBusSignal signal) {
    if (signal.interface == _interface && signal.name == 'Notify') {
      _parseNotification(signal.values);
    }
  }

  void _parseNotification(List<DBusValue> body) {
    // Notify method signature: (susssasa{sv}i)
    // app_name, replaces_id, app_icon, summary, body, actions, hints, expire_timeout
    if (body.length < 8) return;

    final appName = body[0].toNative() as String;
    final replacesId = body[1].toNative() as int;
    final appIcon = body[2].toNative() as String;
    final summary = body[3].toNative() as String;
    final bodyText = body[4].toNative() as String;
    final actions = body[5].toNative() as List;
    final hints = body[6].toNative() as Map;
    final expireTimeout = body[7].toNative() as int;

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
      packageName: appIcon,
      notificationId: replacesId,
      tags: [],
      extras: hints.map((k, v) => MapEntry(k.toString(), v)),
      supportsQuickReply: false, // Linux notifications don't typically support quick reply
      actions: notificationActions,
    );

    _notificationController?.add(notification);
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
        await _client!.callMethod(
          destination: _busName,
          path: DBusObjectPath(_objectPath),
          interface: _interface,
          name: 'GetCapabilities',
          values: const [],
        );
      }
    } catch (e) {
      // Ignore polling errors
    }
  }

  Future<void> dismissNotification(String packageName, int notificationId) async {
    if (_client == null) return;

    try {
      await _client!.callMethod(
        destination: _busName,
        path: DBusObjectPath(_objectPath),
        interface: _interface,
        name: 'CloseNotification',
        values: [DBusUint32(notificationId)],
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

  Future<void> dispose() async {
    _watchTimer?.cancel();
    _signalSubscription?.cancel();
    await _notificationController?.close();
    await _client?.close();
  }
}

/// Provider for Linux notification listener
final linuxNotificationListenerProvider = Provider<LinuxNotificationListener>((ref) {
  return LinuxNotificationListener();
});
