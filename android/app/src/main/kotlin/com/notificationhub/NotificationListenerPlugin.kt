// Platform channel handler for Flutter communication
// This file should be placed in: android/app/src/main/kotlin/com/notificationhub/NotificationListenerPlugin.kt

package com.notificationhub

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.provider.Settings
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class NotificationListenerPlugin : MethodCallHandler {
    private var listenerService: NotificationListenerService? = null
    private var context: Context? = null

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "com.notificationhub/notification_listener")
            val plugin = NotificationListenerPlugin()
            plugin.context = registrar.context()
            channel.setMethodCallHandler(plugin)
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "initialize" -> {
                // Service is started separately via Android manifest
                result.success(null)
            }
            "requestPermission" -> {
                val intent = Intent("android.settings.ACTION_NOTIFICATION_LISTENER_SETTINGS")
                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                context?.startActivity(intent)
                result.success(null)
            }
            "checkPermission" -> {
                val enabled = isNotificationListenerEnabled()
                result.success(enabled)
            }
            "dismissNotification" -> {
                val args = call.arguments as? Map<String, Any>
                val packageName = args?.get("packageName") as? String
                val notificationId = args?.get("notificationId") as? Int
                if (packageName != null && notificationId != null) {
                    listenerService?.dismissNotification(packageName, notificationId)
                    result.success(null)
                } else {
                    result.error("INVALID_ARGS", "Missing packageName or notificationId", null)
                }
            }
            "replyToNotification" -> {
                val args = call.arguments as? Map<String, Any>
                val packageName = args?.get("packageName") as? String
                val notificationId = args?.get("notificationId") as? Int
                val replyText = args?.get("replyText") as? String
                if (packageName != null && notificationId != null && replyText != null) {
                    listenerService?.replyToNotification(packageName, notificationId, replyText)
                    result.success(null)
                } else {
                    result.error("INVALID_ARGS", "Missing required arguments", null)
                }
            }
            else -> result.notImplemented()
        }
    }

    private fun isNotificationListenerEnabled(): Boolean {
        val context = context ?: return false
        val packageName = context.packageName
        val flat = Settings.Secure.getString(
            context.contentResolver,
            "enabled_notification_listeners"
        ) ?: ""
        return flat.contains(packageName)
    }

    fun setListenerService(service: NotificationListenerService) {
        listenerService = service
    }
}