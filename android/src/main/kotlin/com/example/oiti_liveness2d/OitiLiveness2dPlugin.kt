package com.example.oiti_liveness2d

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import br.com.oiti.certiface.facecaptcha.FaceCaptchaActivity
import br.com.oiti.certiface.facecaptcha.UserData
import br.com.oiti.certiface.documentscopy.DocumentscopyActivity
import br.com.oiti.certiface.documentscopy.DocumentscopyErrorCode

/** OitiLiveness2dPlugin */
class OitiLiveness2dPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private val DOCUMENTSCOPY_RESULT_REQUEST = 1
    private val FACECAPTCHA_RESULT_REQUEST = 2
    private val E_ACTIVITY_DOES_NOT_EXIST = "E_ACTIVITY_DOES_NOT_EXIST"
    private val E_FAILED_TO_SHOW_PICKER = "E_FAILED_TO_SHOW_PICKER"

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "oiti_liveness2d")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
      when (call.method) {
            "OITI.startLiveness2d" -> {
                resultReference = result
                val appKey = call.argument<String>("appKey")
                val baseUrl = call.argument<String>("baseUrl")
                startLiveness3d(appKey, baseUrl, isProd)
            }
            else -> {
                result.notImplemented()
            }
        }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun startLiveness2d(appKey: String?, baseUrl: String?,) {
        try {
            val userData = UserData(appKey = appKey)
            val intent =  Intent(getCurrentActivity(), FaceCaptchaActivity::class.java).apply{
              putExtra(FaceCaptchaActivity.PARAM_ENDPOINT, ENDPOINT)
              putExtra(FaceCaptchaActivity.PARAM_USER_DATA, userData)
            }
            getCurrentActivity()?.startActivityForResult(intent, FACECAPTCHA_RESULT_REQUEST)

        } catch (e: AltLiveness3dException) {
            resultReference?.error(e.code, e.message, null)

        } catch (e: Exception) {
            resultReference?.error("UNKNOWN_ERROR", e.message, e.stackTrace.toString())

        }
    }
}
