# Unified Notification Hub

A cross-platform notification aggregator that synchronizes alerts from Android, iOS, and Linux into a single real-time dashboard with a high-energy 'Neon Rush' aesthetic.

## Overview

The Unified Notification Hub streamlines digital clutter by consolidating notifications from multiple platforms into a single, intuitive interface. Features include:

- **Real-time synchronization** across devices using local network communication (mDNS/IP pairing)
- **Intelligent deduplication** to group identical notifications into unified cards
- **Rich media support** for notification attachments
- **Bidirectional actions** - dismiss, quick reply, and open notifications on source devices
- **Powerful filtering** with app and keyword whitelists/blacklists
- **Comprehensive archive** with search and filtering capabilities

## Core Features

### Live Notification Feed
- Displays incoming alerts in real-time
- Visual grouping for identical notifications
- Action buttons for 'Dismiss' and 'Quick Reply'
- Dark mode with neon green aesthetics

### Device Connection Manager
- Scan and pair local devices via QR code or manual IP entry
- Display connection status (Online/Offline)
- Toggle permissions for each connected device (Read-only vs. Actionable)

### Priority Filter Settings
- Whitelist/blacklist apps from specific platforms
- Keyword-based filtering to mute low-priority notifications
- Configurable deduplication windows

### Activity Archive
- Searchable history of all past notifications
- Filterable by device source and date range
- Media viewer for notification attachments

## Technical Architecture

### Cross-Platform Support
- **Android**: `NotificationListenerService` for system-level capture
- **iOS**: `NotificationServiceExtension` for background processing
- **Linux**: DBus-based notification listener integration

### Core Components

1. **Data Models** (`lib/core/models/`):
   - `NotificationModel` - Core notification entity
   - `DeviceModel` - Device configuration and state
   - `PairingData` - Device pairing information
   - `FilterSettings` - User filtering preferences

2. **Database** (`lib/core/database/`):
   - Drift-based SQLite with schema for notifications, devices, and groups
   - Efficient indexing for common queries
   - Support for media storage

3. **Networking** (`lib/core/network/`):
   - `NetworkService` for WebSocket-based device communication
   - mDNS/Bonjour discovery for automatic device finding
   - Secure pairing with public key authentication

4. **Platform-Specific Listeners**:
   - Android: `NotificationListenerService.kt`
   - iOS: `NotificationService.swift`
   - Linux: `linux_notification_listener.dart`

5. **UI Components**:
   - Live feed with animated group cards
   - Device manager with real-time status
   - Settings screens for filtering and preferences
   - Archive with search and media viewer

## Visual Style: Neon Rush

### Color Scheme
- **Primary Color**: Electric Green (#00FFB4)
- **Background**: Charcoal (#141414) / Deep Black (#0A0A0A)
- **Surface**: Light Charcoal (#1E1E1E)

### UI Elements
- Glow effects on cards and buttons
- Rounded corners throughout
- High-contrast typography
- Fluid transition animations

## Development Setup

### Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  riverpod: ^2.5.1
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0
  # Plus all platform-specific packages...
```

### Platform Configuration

#### Android
```kotlin
// android/app/src/main/AndroidManifest.xml
<!-- Notification Listener Service -->
<service
    android:name=".NotificationListenerService"
    android:label="Notification Hub Listener"
    android:permission="android.permission.BIND_NOTIFICATION_LISTENER_SERVICE" />
```

#### iOS
```swift
// ios/NotificationServiceExtension/Info.plist
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSExceptionDomains</key>
  <dict>
    <key>localhost</key>
    <dict>
      <key>NSExceptionAllowsInsecureHTTPLoads</key>
      <true/>
    </dict>
  </dict>
</dict>
```

#### Linux
Dependencies:
- `libdbus-dbus` for DBus integration
- `libglib2.0` for threading utilities

## Usage

### 1. Initial Setup
```bash
# Clone the repository
git clone <repository-url>
cd notification-hub
flutter pub get
```

### 2. Build and Run
```bash
# Android
flutter build apk --debug
adb install app.apk

# iOS
flutter run --device-type=ios

# Linux
flutter run --platform linux
```

### 3. Pairing Process
1. On the hub device, navigate to **Devices** → **Add Device**
2. Choose between:
   - **Scan QR Code**: Uses device camera to scan pairing code
   - **Manual Entry**: Enter IP address of the remote device
3. The remote device receives a pairing request
4. Accept pairing to establish connection

### 4. Notification Management
- **Incoming notifications** appear in real-time in the Live Feed
- **Dismiss actions** remove notifications from the hub without affecting the source
- **Quick replies** send responses back to the source device
- **Archive management** allows searching and filtering of past notifications

## Configuration

### Development
- Set `FLUTTER_DEBUG=true` for enhanced logging
- Configure `LOCAL_NETWORK` permission for discovery
- Use `.env` file for API keys and secrets

### Production
- Enable background notifications for continuous operation
- Configure automatic network reconnection strategies
- Set up media storage optimization

## Testing

### Unit Tests
```bash
flutter test --coverage
```

### Integration Tests
```bash
flutter drive --test-cases=test_cases/integration/
```

### Device Testing
- Physical device testing for Android notification capture
- iOS simulator testing for service extension
- Linux environment testing for DBus integration

## Roadmap

### Phase 1 (v1.0)
- [x] Core notification models
- [x] Database persistence
- [x] Network communication (WebSocket + mDNS)
- [x] Platform-specific listeners
- [x] Neon Rush UI theme
- [x] Live feed with deduplication
- [x] Device manager
- [x] Filter settings
- [x] Archive functionality

### Phase 2 (v1.1)
- [ ] Advanced filtering options
- [ ] Media attachment viewer
- [ ] Custom notification actions
- [ ] Push notification support
- [ ] Cloud backup/sync

### Phase 3 (v2.0)
- [ ] Multi-language support
- [ ] Advanced notification templates
- [ ] Analytics and insights
- [ ] Widget support for home screen

## License

This project is part of the Hermes Agent development ecosystem. Licensed under the terms of the Hermes Project.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Submit a pull request
4. Ensure all tests pass

## Support

For issues and documentation, visit:
- [GitHub Repository](https://github.com/hermes-agent/notification-hub)
- [Documentation](https://hermes-agent.nousresearch.com/docs)
- [Discord](https://discord.gg/hermes)

---

**Built with ❤️ by the Hermes Agent team**
**Inspired by the Neon Rush aesthetic**
