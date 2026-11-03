import UserNotifications
import UIKit

/// Notification Service Extension for iOS.
///
/// Intercepts remote (APNs) notifications before they are delivered so the
/// hub can enrich them with attachments, custom actions, or deduplication
/// metadata, then forwards them to the main Notification Hub app via an
/// App Group shared container.
class NotificationService: UNNotificationServiceExtension {

  /// The shared container identifier used to pass notifications to the main app.
  /// Must match the `app-group` entitlement of both the Runner target and this
  /// extension target.
  static let appGroupIdentifier = "group.com.notificationhub"

  var contentHandler: ((UNNotificationContent) -> Void)?
  var bestAttemptContent: UNMutableNotificationContent?

  override func didReceive(
    _ request: UNNotificationRequest,
    withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void
  ) {
    self.contentHandler = contentHandler
    bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)

    if let bestAttemptContent = bestAttemptContent {
      // Enrich the notification with hub-specific metadata.
      bestAttemptContent.title = request.content.title
      bestAttemptContent.body = request.content.body

      // Forward the raw notification to the main app so it can be routed
      // through the normal live-feed pipeline.
      forwardToMainApp(
        appName: bestAttemptContent.categoryIdentifier.isEmpty
          ? "Notification Hub"
          : bestAttemptContent.categoryIdentifier,
        title: bestAttemptContent.title,
        body: bestAttemptContent.body,
        userInfo: request.content.userInfo
      )

      contentHandler(bestAttemptContent)
    }
  }

  override func serviceExtensionTimeWillExpire() {
    // Called just before the extension will be terminated by the system.
    // Deliver whatever content we have, even if it's incomplete.
    if let contentHandler = contentHandler, let bestAttemptContent = bestAttemptContent {
      contentHandler(bestAttemptContent)
    }
  }

  /// Writes the incoming notification to the shared App Group container so the
  /// main Notification Hub app can pick it up on launch / resume.
  private func forwardToMainApp(
    appName: String,
    title: String,
    body: String,
    userInfo: [AnyHashable: Any]
  ) {
    guard let sharedDefaults = UserDefaults(suiteName: Self.appGroupIdentifier) else {
      return
    }

    var payload: [String: Any] = [
      "appName": appName,
      "title": title,
      "content": body,
      "timestamp": Date().timeIntervalSince1970,
      "sourceDeviceId": "ios_device",
    ]

    if let aps = userInfo["aps"] as? [AnyHashable: Any] {
      payload["aps"] = aps
    }

    var pending = sharedDefaults.array(forKey: "pending_notifications") as? [[String: Any]] ?? []
    pending.append(payload)
    sharedDefaults.set(pending, forKey: "pending_notifications")
    sharedDefaults.synchronize()

    // Post a local notification so the main app can react while running.
    let nc = NotificationCenter.default
    nc.post(name: .notificationHubReceivedRemoteNotification, object: nil, userInfo: payload)
  }
}

// MARK: - Notification name

extension Notification.Name {
  static let notificationHubReceivedRemoteNotification =
    Notification.Name("notificationHubReceivedRemoteNotification")
}
