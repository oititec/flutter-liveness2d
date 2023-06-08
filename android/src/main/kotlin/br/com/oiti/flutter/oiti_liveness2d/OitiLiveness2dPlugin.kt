package br.com.oiti.flutter.oiti_liveness2d

import android.app.Activity
import android.content.Intent
import android.content.Context
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import br.com.oiti.flutter.oiti_liveness2d.utils.NativeMethod
import br.com.oiti.flutter.oiti_liveness2d.utils.Environment
import br.com.oiti.security.observability.firebase.FirebaseEvents
import br.com.oiti.certiface.documentscopy.DocumentscopyActivity
import br.com.oiti.certiface.documentscopy.DocumentscopyErrorCode
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry

/** OitiLiveness2dPlugin */
class OitiLiveness2dPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private val errorResponseMessage = "oiti.response.error"
  private val successResponseMessage = "oiti.response.success"

  private lateinit var context: Context
  private lateinit var activity: Activity

  private val DOCUMENTSCOPY_RESULT_REQUEST = 2

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "oiti_liveness2d")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
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
          val appKey = call.argument<String>("appkey")
          val event = call.argument<String>("event")

          if (appKey != null && event != null) {
            recordEvent(appKey, event)
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
    val baseUrl = when(environment) {
      Environment.HML -> "https://comercial.certiface.com.br"
      Environment.PRD -> "https://certiface.com.br"
    }

    val intent = Intent(context, DocumentscopyActivity::class.java).apply {
      putExtra(DocumentscopyActivity.PARAM_ENDPOINT, baseUrl)
      putExtra(DocumentscopyActivity.PARAM_APP_KEY, appKey)
      putExtra(DocumentscopyActivity.PARAM_DEBUG_ON, false)
    }

    activity.startActivityForResult(intent, DOCUMENTSCOPY_RESULT_REQUEST)
  }

  private fun recordEvent(appKey: String, event: String) {
    FirebaseEvents(event, appKey).apply()
  }

  // ActivityAware Methods
  override fun onDetachedFromActivity() {
    TODO("Not yet implemented")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    TODO("Not yet implemented")
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity;
//    binding.addActivityResultListener(PluginRegistry.ActivityResultListener(::activityResultListener))
  }

  override fun onDetachedFromActivityForConfigChanges() {
    TODO("Not yet implemented")
  }
}
