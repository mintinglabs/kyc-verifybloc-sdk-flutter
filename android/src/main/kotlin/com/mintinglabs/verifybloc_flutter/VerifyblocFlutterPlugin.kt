package com.mintinglabs.verifybloc_flutter

import android.app.Activity
import androidx.annotation.MainThread
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import network.mintex.module_kyc.export.VerifyBlocEnv
import network.mintex.module_kyc.export.VerifyBlocIdentityType
import network.mintex.module_kyc.export.VerifyBlocManager

/** VerifyblocFlutterPlugin */
class VerifyblocFlutterPlugin : FlutterPlugin, ActivityAware, VerifyblocFlutterApi {
    private var binding: ActivityPluginBinding? = null

    private val activity: Activity
        get() {
            val binding =
                this.binding ?: throw FlutterError(
                    "-1",
                    "Plugin hasn't been attached to an Activity"
                )
            return binding.activity
        }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        VerifyblocFlutterApi.setUp(flutterPluginBinding.binaryMessenger, this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        VerifyblocFlutterApi.setUp(binding.binaryMessenger, null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        // plugin is now attached to an Activity
        this.binding = binding
    }

    override fun onDetachedFromActivityForConfigChanges() {
        // the Activity plugin was attached to was
        // destroyed to change configuration.
        // This call will be followed by onReattachedToActivityForConfigChanges().
        this.binding = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        // plugin is now attached to a new Activity
        // after a configuration change.
        this.binding = binding
    }

    override fun onDetachedFromActivity() {
        // plugin is no longer associated with an Activity.
        // Clean up references.
        this.binding = null
    }

    @MainThread
    override fun setAppLocale(locale: String) {
        VerifyBlocManager.setAppLocale(activity, locale)
    }

    @MainThread
    override fun setEnv(env: Long) {
        VerifyBlocManager.setEnv(VerifyBlocEnv.values()[env.toInt()])
    }

    @MainThread
    override fun setTheme(theme: VerifyblocTheme) {
        VerifyBlocManager.setTheme(theme.toAndroid())
    }

    @MainThread
    override fun initialize(partnerId: String, appId: String, privateKey: String) {
        VerifyBlocManager.initialize(partnerId, appId, privateKey)
    }

    @MainThread
    override fun startVerification(userId: String, identityType: Long) {
        VerifyBlocManager.startVerification(
            activity,
            userId,
            VerifyBlocIdentityType.values()[identityType.toInt()]
        )
    }
}
