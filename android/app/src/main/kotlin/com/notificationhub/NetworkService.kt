// WebSocket Network Service for local device communication
// This file should be placed in: android/app/src/main/kotlin/com/notificationhub/NetworkService.kt

package com.notificationhub

import android.app.Service
import android.content.Intent
import android.os.IBinder
import android.util.Log
import okhttp3.*
import org.json.JSONObject
import java.util.concurrent.TimeUnit

class NetworkService : Service() {
    companion object {
        const val CHANNEL = "com.notificationhub/network_service"
    }

    private var webSocket: WebSocket? = null
    private var client: OkHttpClient? = null
    private var isRunning = false

    override fun onCreate() {
        super.onCreate()
        Log.d("NetworkService", "NetworkService created")
        initializeClient()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (!isRunning) {
            isRunning = true
            connectWebSocket()
        }
        return START_STICKY
    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    override fun onDestroy() {
        super.onDestroy()
        isRunning = false
        webSocket?.close(1000, "Service destroyed")
        client?.dispatcher().executorService?.shutdown()
        Log.d("NetworkService", "NetworkService destroyed")
    }

    private fun initializeClient() {
        client = OkHttpClient.Builder()
            .pingInterval(30, TimeUnit.SECONDS)
            .build()
    }

    private fun connectWebSocket() {
        val request = Request.Builder()
            .url("ws://192.168.1.100:8765") // TODO: Get from preferences
            .build()

        webSocket = client?.newWebSocket(request, object : WebSocketListener() {
            override fun onOpen(webSocket: WebSocket, response: Response) {
                Log.d("NetworkService", "WebSocket connected")
                sendDeviceInfo()
            }

            override fun onMessage(webSocket: WebSocket, text: String) {
                handleMessage(text)
            }

            override fun onClosed(webSocket: WebSocket, code: Int, reason: String) {
                Log.d("NetworkService", "WebSocket closed: $code $reason")
                // Reconnect after 5 seconds
                if (isRunning) {
                    android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({
                        connectWebSocket()
                    }, 5000)
                }
            }

            override fun onFailure(webSocket: WebSocket, t: Throwable, response: Response?) {
                Log.e("NetworkService", "WebSocket error", t)
            }
        })
    }

    private fun sendDeviceInfo() {
        val json = JSONObject().apply {
            put("type", "device_info")
            put("deviceId", getDeviceId())
            put("deviceName", "Android Device")
            put("platform", "android")
            put("timestamp", System.currentTimeMillis())
        }
        webSocket?.send(json.toString())
    }

    private fun handleMessage(text: String) {
        try {
            val json = JSONObject(text)
            val type = json.optString("type")
            
            when (type) {
                "pairing_request" -> handlePairingRequest(json)
                "notification" -> handleIncomingNotification(json)
                "action" -> handleAction(json)
                "heartbeat" -> { /* keep alive */ }
            }
        } catch (e: Exception) {
            Log.e("NetworkService", "Error handling message", e)
        }
    }

    private fun handlePairingRequest(json: JSONObject) {
        // Handle pairing request from another device
        val response = JSONObject().apply {
            put("type", "pairing_response")
            put("accepted", true)
            put("deviceId", getDeviceId())
        }
        webSocket?.send(response.toString())
    }

    private fun handleIncomingNotification(json: JSONObject) {
        // Forward to Flutter via method channel
        // This would need a reference to the Flutter engine
    }

    private fun handleAction(json: JSONObject) {
        // Handle actions like dismiss, reply
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