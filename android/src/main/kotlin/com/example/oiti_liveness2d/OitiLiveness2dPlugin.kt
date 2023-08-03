package com.example.oiti_liveness2d

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry

import br.com.oiti.certiface.facecaptcha.FaceCaptchaActivity
import br.com.oiti.certiface.facecaptcha.UserData
import br.com.oiti.certiface.documentscopy.DocumentscopyActivity
import br.com.oiti.certiface.documentscopy.DocumentscopyErrorCode


import com.example.oiti_liveness2d.utils.doccore.DocActivity
import com.example.oiti_liveness2d.utils.doccore.DocException

import com.example.oiti_liveness2d.utils.liveness2d.Liveness2dActivity
import com.example.oiti_liveness2d.utils.liveness2d.Liveness2dException


/** OitiLiveness2dPlugin */
class OitiLiveness2dPlugin: FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {
    companion object {
        private const val FACECAPTCHA_RESULT_REQUEST = 7386
        private const val DOCUMENTSCOPY_RESULT_REQUEST = 7486
    }
    private lateinit var context: Context
    private lateinit var result: Result
    private var activity: Activity? = null
    private lateinit var channel : MethodChannel
    private var manager: Liveness2dActivity? = null
    private var managerDoc: DocActivity? = null
    private val E_ACTIVITY_DOES_NOT_EXIST = "E_ACTIVITY_DOES_NOT_EXIST"
    private val E_FAILED_TO_SHOW_PICKER = "E_FAILED_TO_SHOW_PICKER"

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "oiti_liveness2d")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == FACECAPTCHA_RESULT_REQUEST) {
            when(resultCode) {
                Activity.RESULT_OK -> manager?.onLiveness2DResultSuccess(data)
                Activity.RESULT_CANCELED -> manager?.onLiveness2DResultSuccess(data)
            }
            return true
        }
        return false
    }

  override fun onMethodCall(call: MethodCall, result: Result) {
      this.result = result
      when (call.method) {
            "OITI.startLiveness2d" -> {
                val appKey = call.argument<String>("appKey").orEmpty()
                val baseUrl = call.argument<String>("baseUrl").orEmpty()
                startLiveness2d(
                    appKey,
                    baseUrl)
            }
          "OITI.startDocumentscopy" -> {
              val appKey = call.argument<String>("appKey").orEmpty()
              val ticket = call.argument<String>("ticket").orEmpty()
              val baseUrl = call.argument<String>("baseUrl").orEmpty()
              startDocumentscopy(
                  appKey,
                  ticket,
                  baseUrl)
            }
          "OITI.checkPermission" -> {
              checkPermission()
          }

          "OITI.askPermission" -> {
              askPermission()
          }
            else -> {
                result.notImplemented()
            }
        }
  }

    private fun checkPermission() {
        result.success(true)
    }

    private fun askPermission() {
        result.success(true)
    }
  private fun startLiveness2d(appKey: String, baseUrl: String) {
      try {
          manager = Liveness2dActivity(context, result, appKey)
          val intent = manager?.getIntent()
          activity?.startActivityForResult(intent, FACECAPTCHA_RESULT_REQUEST)
      } catch (e: Liveness2dException) {
          result.error(e.code, e.message, null)
      } catch (e: Exception) {
          result.error("UNKNOWN_ERROR", e.message, e.stackTrace)
      }
    }

    private fun startDocumentscopy(appKey: String, ticket: String?, baseUrl: String) {
        try {
            managerDoc = DocActivity(context, result, appKey, ticket)
            val intent = managerDoc?.getIntent()
            activity?.startActivityForResult(intent, DOCUMENTSCOPY_RESULT_REQUEST)
        } catch (e: Liveness2dException) {
            result.error(e.code, e.message, null)
        } catch (e: Exception) {
            result.error("UNKNOWN_ERROR", e.message, e.stackTrace)
        }
    }
}
