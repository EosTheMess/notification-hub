// Network service for local device discovery and communication

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bonsoir/bonsoir.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/notification.dart';

const _uuid = Uuid();

/// Service types for mDNS discovery
const String _serviceType = '_notification-hub._tcp';
const int _servicePort = 8765;

/// Message types for WebSocket communication
enum MessageType {
  notification,
  notificationBatch,
  action,
  pairingRequest,
  pairingResponse,
  heartbeat,
  deviceInfo,
  syncRequest,
  syncResponse,
  error,
}

/// Base message envelope
sealed class NetworkMessage {
  final String id;
  final MessageType type;
  final DateTime timestamp;
  final String sourceDeviceId;

  const NetworkMessage({
    required this.id,
    required this.type,
    required this.timestamp,
    required this.sourceDeviceId,
  });

  Map<String, dynamic> toJson();

  // Use a static method instead of factory on sealed class
  static NetworkMessage fromJson(Map<String, dynamic> json) {
    final typeStr = json['type'] as String?;
    if (typeStr == null) {
      throw FormatException('Missing type field in message');
    }
    final type = MessageType.values.firstWhere(
      (e) => e.name == typeStr,
      orElse: () => MessageType.error,
    );

    switch (type) {
      case MessageType.notification:
        return NotificationMessage.fromJson(json);
      case MessageType.notificationBatch:
        return NotificationBatchMessage.fromJson(json);
      case MessageType.action:
        return ActionMessage.fromJson(json);
      case MessageType.pairingRequest:
        return PairingRequestMessage.fromJson(json);
      case MessageType.pairingResponse:
        return PairingResponseMessage.fromJson(json);
      case MessageType.heartbeat:
        return HeartbeatMessage.fromJson(json);
      case MessageType.deviceInfo:
        return DeviceInfoMessage.fromJson(json);
      case MessageType.error:
        return ErrorMessage.fromJson(json);
      default:
        throw FormatException('Unknown message type: $typeStr');
    }
  }
}

/// Notification message
class NotificationMessage extends NetworkMessage {
  final NotificationModel notification;

  const NotificationMessage({
    required super.id,
    required super.timestamp,
    required super.sourceDeviceId,
    required this.notification,
  }) : super(type: MessageType.notification);

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.name,
    'timestamp': timestamp.toIso8601String(),
    'sourceDeviceId': sourceDeviceId,
    'notification': notification.toJson(),
  };

  factory NotificationMessage.fromJson(Map<String, dynamic> json) => NotificationMessage(
    id: json['id'] as String,
    timestamp: DateTime.parse(json['timestamp'] as String),
    sourceDeviceId: json['sourceDeviceId'] as String,
    notification: NotificationModel.fromJson(json['notification'] as Map<String, dynamic>),
  );
}

/// Batch notification message
class NotificationBatchMessage extends NetworkMessage {
  final List<NotificationModel> notifications;

  const NotificationBatchMessage({
    required super.id,
    required super.timestamp,
    required super.sourceDeviceId,
    required this.notifications,
  }) : super(type: MessageType.notificationBatch);

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.name,
    'timestamp': timestamp.toIso8601String(),
    'sourceDeviceId': sourceDeviceId,
    'notifications': notifications.map((n) => n.toJson()).toList(),
  };

  factory NotificationBatchMessage.fromJson(Map<String, dynamic> json) => NotificationBatchMessage(
    id: json['id'] as String,
    timestamp: DateTime.parse(json['timestamp'] as String),
    sourceDeviceId: json['sourceDeviceId'] as String,
    notifications: (json['notifications'] as List).map((n) => NotificationModel.fromJson(n as Map<String, dynamic>)).toList(),
  );
}

/// Action message (dismiss, reply, etc.)
class ActionMessage extends NetworkMessage {
  final String notificationId;
  final String actionId;
  final String? payload;

  const ActionMessage({
    required super.id,
    required super.timestamp,
    required super.sourceDeviceId,
    required this.notificationId,
    required this.actionId,
    this.payload,
  }) : super(type: MessageType.action);

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.name,
    'timestamp': timestamp.toIso8601String(),
    'sourceDeviceId': sourceDeviceId,
    'notificationId': notificationId,
    'actionId': actionId,
    'payload': payload,
  };

  factory ActionMessage.fromJson(Map<String, dynamic> json) => ActionMessage(
    id: json['id'] as String,
    timestamp: DateTime.parse(json['timestamp'] as String),
    sourceDeviceId: json['sourceDeviceId'] as String,
    notificationId: json['notificationId'] as String,
    actionId: json['actionId'] as String,
    payload: json['payload'] as String?,
  );
}

/// Pairing request
class PairingRequestMessage extends NetworkMessage {
  final PairingData pairingData;

  const PairingRequestMessage({
    required super.id,
    required super.timestamp,
    required super.sourceDeviceId,
    required this.pairingData,
  }) : super(type: MessageType.pairingRequest);

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.name,
    'timestamp': timestamp.toIso8601String(),
    'sourceDeviceId': sourceDeviceId,
    'pairingData': pairingData.toJson(),
  };

  factory PairingRequestMessage.fromJson(Map<String, dynamic> json) => PairingRequestMessage(
    id: json['id'] as String,
    timestamp: DateTime.parse(json['timestamp'] as String),
    sourceDeviceId: json['sourceDeviceId'] as String,
    pairingData: PairingData.fromJson(json['pairingData'] as Map<String, dynamic>),
  );
}

/// Pairing response
class PairingResponseMessage extends NetworkMessage {
  final bool accepted;
  final PairingData? pairingData;
  final String? error;

  const PairingResponseMessage({
    required super.id,
    required super.timestamp,
    required super.sourceDeviceId,
    required this.accepted,
    this.pairingData,
    this.error,
  }) : super(type: MessageType.pairingResponse);

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.name,
    'timestamp': timestamp.toIso8601String(),
    'sourceDeviceId': sourceDeviceId,
    'accepted': accepted,
    'pairingData': pairingData?.toJson(),
    'error': error,
  };

  factory PairingResponseMessage.fromJson(Map<String, dynamic> json) => PairingResponseMessage(
    id: json['id'] as String,
    timestamp: DateTime.parse(json['timestamp'] as String),
    sourceDeviceId: json['sourceDeviceId'] as String,
    accepted: json['accepted'] as bool,
    pairingData: json['pairingData'] != null ? PairingData.fromJson(json['pairingData'] as Map<String, dynamic>) : null,
    error: json['error'] as String?,
  );
}

/// Heartbeat message
class HeartbeatMessage extends NetworkMessage {
  const HeartbeatMessage({
    required super.id,
    required super.timestamp,
    required super.sourceDeviceId,
  }) : super(type: MessageType.heartbeat);

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.name,
    'timestamp': timestamp.toIso8601String(),
    'sourceDeviceId': sourceDeviceId,
  };

  factory HeartbeatMessage.fromJson(Map<String, dynamic> json) => HeartbeatMessage(
    id: json['id'] as String,
    timestamp: DateTime.parse(json['timestamp'] as String),
    sourceDeviceId: json['sourceDeviceId'] as String,
  );
}

/// Device info message
class DeviceInfoMessage extends NetworkMessage {
  final DeviceModel deviceInfo;

  const DeviceInfoMessage({
    required super.id,
    required super.timestamp,
    required super.sourceDeviceId,
    required this.deviceInfo,
  }) : super(type: MessageType.deviceInfo);

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.name,
    'timestamp': timestamp.toIso8601String(),
    'sourceDeviceId': sourceDeviceId,
    'deviceInfo': deviceInfo.toJson(),
  };

  factory DeviceInfoMessage.fromJson(Map<String, dynamic> json) => DeviceInfoMessage(
    id: json['id'] as String,
    timestamp: DateTime.parse(json['timestamp'] as String),
    sourceDeviceId: json['sourceDeviceId'] as String,
    deviceInfo: DeviceModel.fromJson(json['deviceInfo'] as Map<String, dynamic>),
  );
}

/// Error message
class ErrorMessage extends NetworkMessage {
  final String code;
  final String message;

  const ErrorMessage({
    required super.id,
    required super.timestamp,
    required super.sourceDeviceId,
    required this.code,
    required this.message,
  }) : super(type: MessageType.error);

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.name,
    'timestamp': timestamp.toIso8601String(),
    'sourceDeviceId': sourceDeviceId,
    'code': code,
    'message': message,
  };

  factory ErrorMessage.fromJson(Map<String, dynamic> json) => ErrorMessage(
    id: json['id'] as String,
    timestamp: DateTime.parse(json['timestamp'] as String),
    sourceDeviceId: json['sourceDeviceId'] as String,
    code: json['code'] as String,
    message: json['message'] as String,
  );
}

/// Network service for managing connections
class NetworkService {
  final String _deviceId;
  final DeviceModel _localDevice;
  final StreamController<NetworkMessage> _messageController = StreamController.broadcast();
  final Map<String, WebSocketChannel> _connections = {};
  final Map<String, Timer> _heartbeatTimers = {};

  BonsoirService? _bonsoirService;
  BonsoirBroadcast? _broadcast;
  BonsoirDiscovery? _discovery;
  HttpServer? _server;
  StreamSubscription? _serverSubscription;

  NetworkService(this._deviceId, this._localDevice);

  Stream<NetworkMessage> get messages => _messageController.stream;
  String get deviceId => _deviceId;
  DeviceModel get localDevice => _localDevice;

  /// Start the network service (server + discovery)
  Future<void> start() async {
    await _startServer();
    await _startDiscovery();
    _startHeartbeat();
  }

  /// Stop the network service
  Future<void> stop() async {
    _stopHeartbeat();
    await _stopDiscovery();
    await _stopServer();
    _closeAllConnections();
    await _messageController.close();
  }

  /// Send a message to a specific device
  Future<void> sendTo(String deviceId, NetworkMessage message) async {
    final channel = _connections[deviceId];
    if (channel != null) {
      channel.sink.add(jsonEncode(message.toJson()));
    }
  }

  /// Broadcast a message to all connected devices
  Future<void> broadcast(NetworkMessage message) async {
    for (final channel in _connections.values) {
      channel.sink.add(jsonEncode(message.toJson()));
    }
  }

  /// Send notification to all connected devices
  Future<void> sendNotification(NotificationModel notification) async {
    final message = NotificationMessage(
      id: _uuid.v4(),
      timestamp: DateTime.now(),
      sourceDeviceId: _deviceId,
      notification: notification,
    );
    await broadcast(message);
  }

  /// Send action to source device
  Future<void> sendAction(String targetDeviceId, String notificationId, String actionId, [String? payload]) async {
    final message = ActionMessage(
      id: _uuid.v4(),
      timestamp: DateTime.now(),
      sourceDeviceId: _deviceId,
      notificationId: notificationId,
      actionId: actionId,
      payload: payload,
    );
    await sendTo(targetDeviceId, message);
  }

  /// Initiate pairing with a device
  Future<void> requestPairing(String targetDeviceId, PairingData pairingData) async {
    final message = PairingRequestMessage(
      id: _uuid.v4(),
      timestamp: DateTime.now(),
      sourceDeviceId: _deviceId,
      pairingData: pairingData,
    );
    await sendTo(targetDeviceId, message);
  }

  /// Respond to pairing request
  Future<void> respondToPairing(String targetDeviceId, String requestId, bool accepted, [PairingData? pairingData, String? error]) async {
    final message = PairingResponseMessage(
      id: requestId,
      timestamp: DateTime.now(),
      sourceDeviceId: _deviceId,
      accepted: accepted,
      pairingData: pairingData,
      error: error,
    );
    await sendTo(targetDeviceId, message);
  }

  // Private methods

  Future<void> _startServer() async {
    _server = await HttpServer.bind(InternetAddress.anyIPv4, _servicePort);
    _serverSubscription = _server!.listen(_handleConnection);
    print('Network server started on port $_servicePort');
  }

  Future<void> _stopServer() async {
    await _serverSubscription?.cancel();
    await _server?.close(force: true);
  }

  void _handleConnection(HttpRequest request) async {
    if (WebSocketTransformer.isUpgradeRequest(request)) {
      final channel = IOWebSocketChannel(await WebSocketTransformer.upgrade(request));
      _handleWebSocketChannel(channel);
    } else {
      request.response.statusCode = HttpStatus.badRequest;
      request.response.close();
    }
  }

  void _handleWebSocketChannel(WebSocketChannel channel) {
    String? remoteDeviceId;

    channel.stream.listen(
      (data) {
        try {
          final json = jsonDecode(data as String);
          final message = NetworkMessage.fromJson(json);

          remoteDeviceId ??= message.sourceDeviceId;
          _messageController.add(message);

          // Handle pairing requests automatically
          if (message is PairingRequestMessage) {
            _handlePairingRequest(message, channel);
          }
        } catch (e) {
          print('Error parsing message: $e');
        }
      },
      onDone: () {
        if (remoteDeviceId != null) {
          _connections.remove(remoteDeviceId);
          _heartbeatTimers[remoteDeviceId]?.cancel();
          _heartbeatTimers.remove(remoteDeviceId);
        }
      },
      onError: (error) {
        print('WebSocket error: $error');
      },
    );
  }

  void _handlePairingRequest(PairingRequestMessage message, WebSocketChannel channel) {
    // Auto-accept for now, could add UI prompt later
    final response = PairingResponseMessage(
      id: message.id,
      timestamp: DateTime.now(),
      sourceDeviceId: _deviceId,
      accepted: true,
      pairingData: PairingData(
        deviceId: _localDevice.id,
        deviceName: _localDevice.name,
        platform: _localDevice.platform,
        localIp: _localDevice.localIp,
        port: _localDevice.port ?? _servicePort,
        publicKey: _localDevice.publicKey ?? '',
        version: 1,
        timestamp: DateTime.now(),
      ),
    );
    channel.sink.add(jsonEncode(response.toJson()));
  }

  Future<void> _startDiscovery() async {
    _bonsoirService = BonsoirService(
      name: _localDevice.name,
      type: _serviceType,
      port: _servicePort,
      attributes: {
        'deviceId': _deviceId,
        'platform': _localDevice.platform.name,
        'version': '1',
      },
    );

    // Start broadcasting
    _broadcast = BonsoirBroadcast(service: _bonsoirService!);
    await _broadcast!.ready;

    // Start discovery
    _discovery = BonsoirDiscovery(type: _serviceType);
    _discovery!.stream.listen((event) {
      if (event.type == BonsoirDiscoveryEventType.discoveryServiceFound) {
        _connectToService(event.service!);
      } else if (event.type == BonsoirDiscoveryEventType.discoveryServiceLost) {
        _handleServiceLost(event.service!);
      }
    });
    await _discovery!.ready;
  }

  Future<void> _stopDiscovery() async {
    await _broadcast?.stop();
    await _discovery?.stop();
    _bonsoirService = null;
  }

  void _connectToService(BonsoirService service) {
    if (service.attributes['deviceId'] == _deviceId) return; // Skip self

    // Get the host address from the service
    final host = service.ipAddresses.isNotEmpty ? service.ipAddresses.first : '';
    final port = service.port;
    if (host.isEmpty) return;

    _connectToHost(host, port);
  }

  Future<void> _connectToHost(String host, int port) async {
    try {
      final channel = IOWebSocketChannel.connect('ws://$host:$port');
      _connections[host] = channel; // Temporary key, will be updated on first message

      channel.stream.listen(
        (data) {
          try {
            final json = jsonDecode(data as String);
            final message = NetworkMessage.fromJson(json);
            if (message != null) {
              final deviceId = message.sourceDeviceId;
              if (_connections[host] != null && deviceId != host) {
                _connections[deviceId] = _connections.remove(host)!;
              }
              _messageController.add(message);
            }
          } catch (e) {
            print('Error parsing incoming message: $e');
          }
        },
        onDone: () => _connections.remove(host),
        onError: (error) => _connections.remove(host),
      );
    } catch (e) {
      print('Failed to connect to $host:$port - $e');
    }
  }

  void _handleServiceLost(BonsoirService service) {
    final host = service.ipAddresses.isNotEmpty ? service.ipAddresses.first : '';
    if (host.isNotEmpty) {
      _connections.remove(host)?.sink.close();
    }
  }

  void _startHeartbeat() {
    Timer.periodic(const Duration(seconds: 30), (timer) {
      final heartbeat = HeartbeatMessage(
        id: _uuid.v4(),
        timestamp: DateTime.now(),
        sourceDeviceId: _deviceId,
      );
      broadcast(heartbeat);
    });
  }

  void _stopHeartbeat() {
    for (final timer in _heartbeatTimers.values) {
      timer.cancel();
    }
    _heartbeatTimers.clear();
  }

  void _closeAllConnections() {
    for (final channel in _connections.values) {
      channel.sink.close();
    }
    _connections.clear();
  }
}

/// Provider for network service
final networkServiceProvider = Provider<NetworkService>((ref) {
  throw UnimplementedError('NetworkService must be initialized with device info');
});