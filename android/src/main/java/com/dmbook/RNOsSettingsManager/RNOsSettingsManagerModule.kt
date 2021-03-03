package com.dmbook.RNOsSettingsManager

import androidx.core.app.NotificationManagerCompat
import android.content.Intent
import android.net.Uri
import android.provider.Settings
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise

class RNOsSettingsManagerModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "RNOsSettingsManager"
    }

    @ReactMethod
    fun openAppSettings(openAsNewTask: Boolean) {
        val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
        Uri.parse("package:" + currentActivity!!.packageName))
        if (openAsNewTask) {
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        }
        currentActivity!!.startActivity(intent)
    }

    @ReactMethod
    fun areNotificationsEnabled(promise: Promise) {
        try {
            val isEnabled = NotificationManagerCompat.from(reactApplicationContext).areNotificationsEnabled()
            promise.resolve(isEnabled)
        } catch (e: Exception) {
            promise.reject(e)
        }
    }
}
