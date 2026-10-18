// Broadcast Receiver for handling notification events
// This file should be placed in: android/app/src/main/kotlin/com/notificationhub/NotificationReceiver.kt

package com.notificationhub

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject

class NotificationReceiver : BroadcastReceiver() {
    companion object {
        const val ACTION_NOTIFICATION_RECEIVED = "com.notificationhub.NOTIFICATION_RECEIVED"
        const val EXTRA_NOTIFICATION_DATA = "notification_data"
    }

    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action == ACTION_NOTIFICATION_RECEIVED) {
            val notificationData = intent.getStringExtra(EXTRA_NOTIFICATION_DATA)
            if (notificationData != null) {
                Log.d("NotificationReceiver", "Received notification: $notificationData")
                
                // Forward to Flutter via MethodChannel if Flutter engine is available
                // This would need to be handled by the Flutter plugin system
            }
        }
    }
}

// Companion class for sending broadcasts
object NotificationBroadcaster {
    fun sendNotification(context: Context, notificationJson: String) {
        val intent = Intent(ACTION_NOTIFICATION_RECEIVED)
        intent.putExtra(EXTRA_NOTIFICATION_DATA, notificationJson)
        intent.setPackage(context.packageName)
        context.sendBroadcast(intent)
    }
}