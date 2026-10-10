// iOS Notification Service Extension
// This file should be placed in: ios/NotificationServiceExtension/NotificationService.swift

import UserNotifications
import Foundation

class NotificationService: UNNotificationServiceExtension {
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        guard let bestAttemptContent = bestAttemptContent else { return }
        
        // Extract notification data
        let userInfo = bestAttemptContent.userInfo
        let notificationData: [String: Any] = [
            "id": UUID().uuidString,
            "sourceDeviceId": getDeviceId(),
            "appName": Bundle.main.bundleIdentifier ?? "Unknown",
            "title": bestAttemptContent.title,
            "content": bestAttemptContent.body,
            "timestamp": Date().timeIntervalSince1970 * 1000,
            "isRead": false,
            "hasAttachment": bestAttemptContent.attachments.count > 0,
            "attachmentPath": bestAttemptContent.attachments.first?.url.path,
            "attachmentMimeType": bestAttemptContent.attachments.first?.type,
            "packageName": Bundle.main.bundleIdentifier,
            "notificationId": request.identifier.hashValue,
            "tags": [],
            "extras": userInfo,
            "supportsQuickReply": false, // iOS doesn't support quick reply from service extension
            "quickReplyPlaceholder": nil,
            "quickReplyChoices": [],
            "actions": [
                ["id": "dismiss_\(request.identifier.hashValue)", "label": "Dismiss", "type": "dismiss"],
                ["id": "open_\(request.identifier.hashValue)", "label": "Open", "type": "open"]
            ]
        ]
        
        // Send to Flutter via App Groups or shared container
        sendToFlutter(notificationData)
        
        // Deliver the notification
        contentHandler(bestAttemptContent)
    }

    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent = bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

    private func getDeviceId() -> String {
        let userDefaults = UserDefaults(suiteName: "group.com.notificationhub")
        if let deviceId = userDefaults?.string(forKey: "device_id") {
            return deviceId
        } else {
            let deviceId = UUID().uuidString
            userDefaults?.set(deviceId, forKey: "device_id")
            return deviceId
        }
    }

    private func sendToFlutter(_ data: [String: Any]) {
        // Write to shared App Group container for Flutter to read
        let fileManager = FileManager.default
        guard let containerURL = fileManager.containerURL(forSecurityApplicationGroupIdentifier: "group.com.notificationhub") else { return }
        
        let notificationsURL = containerURL.appendingPathComponent("incoming_notifications.json")
        var notifications: [[String: Any]] = []
        
        if let existingData = try? Data(contentsOf: notificationsURL),
           let existingNotifications = try? JSONSerialization.jsonObject(with: existingData) as? [[String: Any]] {
            notifications = existingNotifications
        }
        
        notifications.append(data)
        
        // Keep only last 100 notifications
        if notifications.count > 100 {
            notifications = Array(notifications.suffix(100))
        }
        
        if let newData = try? JSONSerialization.data(withJSONObject: notifications) {
            try? newData.write(to: notificationsURL)
        }
        
        // Post notification to Flutter (if app is running)
        NotificationCenter.default.post(name: Notification.Name("NewNotificationReceived"), object: nil, userInfo: data)
    }
}