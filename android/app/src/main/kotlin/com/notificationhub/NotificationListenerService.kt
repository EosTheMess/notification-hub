// Android Notification Listener Service
// This file should be placed in: android/app/src/main/kotlin/com/notificationhub/NotificationListenerService.kt

package com.notificationhub

import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification
import android.os.Bundle
import android.util.Log
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import org.json.JSONObject
import org.json.JSONArray

class NotificationListenerService : NotificationListenerService() {
    companion object {
        const val CHANNEL = "com.notificationhub/notification_listener"
        private var methodChannel: MethodChannel? = null
        private var isConnected = false
    }

    override fun onCreate() {
        super.onCreate()
        Log.d("NotificationHub", "NotificationListenerService created")
    }

    override fun onNotificationPosted(sbn: StatusBarNotification) {
        super.onNotificationPosted(sbn)
        if (!isConnected) return
        
        val notification = sbn.notification
        val extras = notification.extras
        
        // Extract notification data
        val title = extras.getString(Notification.EXTRA_TITLE) ?: ""
        val text = extras.getCharSequence(Notification.EXTRA_TEXT)?.toString() ?: ""
        val appName = sbn.packageName
        val packageName = sbn.packageName
        val notificationId = sbn.id
        val timestamp = System.currentTimeMillis()
        
        // Check for attachment
        var hasAttachment = false
        var attachmentPath: String? = null
        var attachmentMimeType: String? = null
        
        if (notification.extras.containsKey(Notification.EXTRA_PICTURE)) {
            hasAttachment = true
            // Save attachment to cache and get path
            // Implementation depends on your storage strategy
        }
        
        // Check for quick reply
        val supportsQuickReply = notification.actions.any { it.remoteInputs.isNotEmpty() }
        var quickReplyPlaceholder: String? = null
        var quickReplyChoices: JSONArray = JSONArray()
        
        if (supportsQuickReply) {
            val remoteInput = notification.actions.first { it.remoteInputs.isNotEmpty() }.remoteInputs[0]
            quickReplyPlaceholder = remoteInput.label?.toString()
            if (remoteInput.choices != null) {
                for (choice in remoteInput.choices) {
                    quickReplyChoices.put(choice.toString())
                }
            }
        }
        
        // Extract actions
        val actionsArray = JSONArray()
        for (action in notification.actions) {
            val actionObj = JSONObject()
            actionObj.put("id", action.actionIntent?.toString() ?: "")
            actionObj.put("label", action.title?.toString() ?: "")
            actionObj.put("type", "custom")
            actionsArray.put(actionObj)
        }
        
        // Add dismiss action
        val dismissAction = JSONObject()
        dismissAction.put("id", "dismiss_$notificationId")
        dismissAction.put("label", "Dismiss")
        dismissAction.put("type", "dismiss")
        actionsArray.put(dismissAction)
        
        // Add reply action if supported
        if (supportsQuickReply) {
            val replyAction = JSONObject()
            replyAction.put("id", "reply_$notificationId")
            replyAction.put("label", "Reply")
            replyAction.put("type", "reply")
            actionsArray.put(replyAction)
        }
        
        // Create notification JSON
        val notificationJson = JSONObject().apply {
            put("id", java.util.UUID.randomUUID().toString())
            put("sourceDeviceId", getDeviceId())
            put("appName", appName)
            put("title", title)
            put("content", text)
            put("timestamp", timestamp)
            put("isRead", false)
            put("hasAttachment", hasAttachment)
            put("attachmentPath", attachmentPath)
            put("attachmentMimeType", attachmentMimeType)
            put("packageName", packageName)
            put("notificationId", notificationId)
            put("tags", JSONArray())
            put("extras", JSONObject())
            put("supportsQuickReply", supportsQuickReply)
            put("quickReplyPlaceholder", quickReplyPlaceholder)
            put("quickReplyChoices", quickReplyChoices)
            put("actions", actionsArray)
        }
        
        // Send to Flutter
        methodChannel?.invokeMethod("onNotificationPosted", notificationJson.toString())
    }

    override fun onNotificationRemoved(sbn: StatusBarNotification) {
        super.onNotificationRemoved(sbn)
        if (!isConnected) return
        
        val json = JSONObject().apply {
            put("notificationId", sbn.id)
            put("packageName", sbn.packageName)
        }
        methodChannel?.invokeMethod("onNotificationRemoved", json.toString())
    }

    override fun onListenerConnected() {
        super.onListenerConnected()
        isConnected = true
        methodChannel?.invokeMethod("onListenerConnected", null)
        Log.d("NotificationHub", "Notification listener connected")
    }

    override fun onListenerDisconnected() {
        super.onListenerDisconnected()
        isConnected = false
        methodChannel?.invokeMethod("onListenerDisconnected", null)
        Log.d("NotificationHub", "Notification listener disconnected")
    }

    fun setMethodChannel(channel: MethodChannel) {
        methodChannel = channel
    }

    fun dismissNotification(packageName: String, notificationId: Int) {
        cancelNotification(packageName, notificationId)
    }

    fun replyToNotification(packageName: String, notificationId: Int, replyText: String) {
        val sbn = getActiveNotifications().firstOrNull { it.packageName == packageName && it.id == notificationId }
        sbn?.notification?.actions?.firstOrNull { it.remoteInputs.isNotEmpty() }?.let { action ->
            val remoteInput = action.remoteInputs[0]
            val replyBundle = Bundle()
            replyBundle.putCharSequence(remoteInput.resultKey, replyText)
            try {
                action.actionIntent?.send(this, 0, android.content.Intent().putExtras(replyBundle))
            } catch (e: Exception) {
                Log.e("NotificationHub", "Failed to send reply", e)
            }
        }
    }

    private fun getDeviceId(): String {
        val prefs = getSharedPreferences("notification_hub", MODE_PRIVATE)
        var deviceId = prefs.getString("device_id", null)
        if (deviceId == null) {
            deviceId = java.util.UUID.randomUUID().toString()
            prefs.edit().putString("device_id", deviceId).apply()
        }
        return deviceId
    }
}

// Platform channel handler for Flutter communication
class NotificationListenerPlugin : MethodCallHandler {
    private var listenerService: NotificationListenerService? = null

    override fun onMethodCall(call: MethodChannel.MethodCall, result: Result) {
        when (call.method) {
            "initialize" -> {
                // Service is started separately via Android manifest
                result.success(null)
            }
            "requestPermission" -> {
                val intent = android.content.Intent("android.settings.ACTION_NOTIFICATION_LISTENER_SETTINGS")
                intent.flags = android.content.Intent.FLAG_ACTIVITY_NEW_TASK
                startActivity(intent)
                result.success(null)
            }
            "checkPermission" -> {
                val enabled = isNotificationListenerEnabled()
                result.success(enabled)
            }
            "dismissNotification" -> {
                val args = call.arguments as Map<String, Any>
                val packageName = args["packageName"] as String
                val notificationId = args["notificationId"] as Int
                listenerService?.dismissNotification(packageName, notificationId)
                result.success(null)
            }
            "replyToNotification" -> {
                val args = call.arguments as Map<String, Any>
                val packageName = args["packageName"] as String
                val notificationId = args["notificationId"] as Int
                val replyText = args["replyText"] as String
                listenerService?.replyToNotification(packageName, notificationId, replyText)
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    private fun isNotificationListenerEnabled(): Boolean {
        val packageName = applicationContext.packageName
        val flat = android.provider.Settings.Secure.getString(
            applicationContext.contentResolver,
            "enabled_notification_listeners"
        ) ?: ""
        return flat.contains(packageName)
    }

    fun setListenerService(service: NotificationListenerService) {
        listenerService = service
    }
}