package br.com.oiti.flutter.oiti_liveness2d

import android.app.Activity
import android.content.Intent
import android.content.Context
import android.util.Log
import br.com.oiti.certiface.data.util.CertifaceEnviroment
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import br.com.oiti.flutter.oiti_liveness2d.utils.NativeMethod
import br.com.oiti.flutter.oiti_liveness2d.utils.Environment
import br.com.oiti.certiface.documentscopy.DocumentscopyActivity
import br.com.oiti.certiface.facecaptcha.FaceCaptchaActivity
import br.com.oiti.certiface.facecaptcha.UserData
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import java.util.Optional

/** OitiLiveness2dPlugin */
class OitiLiveness2dPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private val errorResponseMessage = "oiti.response.error"
    private val successResponseMessage = "oiti.response.success"

    private lateinit var context: Context
    private lateinit var activity: Activity

    private val FACECAPTCHA_RESULT_REQUEST = 1
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
                NativeMethod.OPEN_FACECAPTCHA -> {
                    val appKey = call.argument<String>("appkey")
                    val environmentString = call.argument<String>("env")

                    if (appKey != null && environmentString != null) {
                        try {
                            val environment = Environment.getEnvironment(environmentString)
                            openFaceCaptcha(appKey, environment)
                            result.success(successResponseMessage)
                        } catch (e: IllegalArgumentException) {
                            result.success(errorResponseMessage)
                        }
                    } else {
                        result.success(errorResponseMessage)
                    }
                }

                NativeMethod.OPEN_DOCUMENTSCOPY -> {
                    val appKey = call.argument<String>("appkey")
                    val environmentString = call.argument<String>("env")

                    if (appKey != null && environmentString != null) {
                        try {
                            val environment = Environment.getEnvironment(environmentString)
                            openDocumentscopy(appKey, environment)
                            result.success(successResponseMessage)
                        } catch (e: IllegalArgumentException) {
                            result.success(errorResponseMessage)
                        }
                    } else {
                        result.success(errorResponseMessage)
                    }
                }
            }
        } else {
            result.notImplemented()
        }
    }

    private fun openFaceCaptcha(appKey: String, environment: Environment) {
        val endpoint = when (environment) {
            Environment.HML -> "https://comercial.certiface.com.br"
            Environment.PRD -> "https://certiface.com.br"
        }
        val userData = UserData(
            user = "",
            nome = "",
            cpf = "",
            nascimento = "",
            pass = "",
            appKey = appKey
        )

        val intent = Intent(context, FaceCaptchaActivity::class.java).apply {
            putExtra(FaceCaptchaActivity.PARAM_ENDPOINT, endpoint)
            putExtra(FaceCaptchaActivity.PARAM_USER_DATA, userData)
            putExtra(FaceCaptchaActivity.PARAM_DEBUG_ON, false)
        }

        activity.startActivityForResult(intent, FACECAPTCHA_RESULT_REQUEST)
    }

    private fun openDocumentscopy(appKey: String, environment: Environment) {
        val endpoint = when (environment) {
            Environment.HML -> "https://comercial.certiface.com.br"
            Environment.PRD -> "https://certiface.com.br"
        }

        val intent = Intent(context, DocumentscopyActivity::class.java).apply {
            putExtra(DocumentscopyActivity.PARAM_ENDPOINT, endpoint)
            putExtra(DocumentscopyActivity.PARAM_APP_KEY, appKey)
            putExtra(DocumentscopyActivity.PARAM_DEBUG_ON, false)
        }

        activity.startActivityForResult(intent, DOCUMENTSCOPY_RESULT_REQUEST)
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
    }

    override fun onDetachedFromActivityForConfigChanges() {
        TODO("Not yet implemented")
    }
}
