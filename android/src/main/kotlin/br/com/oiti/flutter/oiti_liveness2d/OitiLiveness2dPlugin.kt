package br.com.oiti.flutter.oiti_liveness2d

import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import br.com.oiti.flutter.oiti_liveness2d.utils.NativeMethod
import br.com.oiti.flutter.oiti_liveness2d.utils.Environment

/** OitiLiveness2dPlugin */
class OitiLiveness2dPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private val errorResponseMessage = "oiti.response.error"
  private val successResponseMessage = "oiti.response.success"

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "oiti_liveness2d")
    channel.setMethodCallHandler(this)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    val method = NativeMethod.getMethod(call.method)

    if (method != null) {
      when (method) {
        NativeMethod.OPEN_FACECAPTCHA, NativeMethod.OPEN_DOCUMENTSCOPY -> {
          val appKey = call.argument<String>("appkey")
          val environmentString = call.argument<String>("env")

          if (appKey != null && environmentString != null) {
            try {
              val environment = Environment.getEnvironment(environmentString)
              runMethod(appKey, environment, method)
              result.success(successResponseMessage)
            } catch (e: IllegalArgumentException) {
              result.success(errorResponseMessage)
            }
          } else {
            result.success(errorResponseMessage)
          }
        }

        NativeMethod.RECORD_EVENT -> {
          val event = call.argument<String>("event")
          if (event != null) {
            recordEvent(event)
            result.success(successResponseMessage)
          } else {
            result.success(errorResponseMessage)
          }
        }
      }
    } else {
      result.notImplemented()
    }
  }

  private fun runMethod(appKey: String, environment: Environment, method: NativeMethod) {
    when (method) {
      NativeMethod.OPEN_FACECAPTCHA -> {
        openFaceCaptcha(appKey, environment)
      }

      NativeMethod.OPEN_DOCUMENTSCOPY -> {
        openDocumentscopy(appKey, environment)
      }
    }
  }
  private fun openFaceCaptcha(appKey: String, environment: Environment) {
    Log.d("Method", "openFaceCaptcha -> AppKey: $appKey | Environment: $environment")
  }

  private fun openDocumentscopy(appKey: String, environment: Environment) {
    Log.d("Method", "openDocumentscopy -> AppKey: $appKey | Environment: $environment")
  }

  private fun recordEvent(event: String) {
    Log.d("Method", "recordEvent -> Event: $event")
  }
}
