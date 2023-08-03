package com.example.oiti_liveness2d.utils.liveness2d

import android.content.Context
import android.content.Intent
import android.util.Log
import br.com.oiti.certiface.facecaptcha.FaceCaptchaActivity
import br.com.oiti.certiface.facecaptcha.UserData

import io.flutter.plugin.common.MethodChannel

class Liveness2dActivity(
    private var context: Context,
    private val result: MethodChannel.Result?,
    private val appKey: String?,
) {

    private val ENDPOINT = "https://comercial.certiface.com.br:8443"

    fun getIntent(): Intent {
        if (appKey.isNullOrBlank()) {
            throw InvalidAppKey()
        }

        val userData = UserData(appKey = appKey)

       // val loadingColor = (loadingAppearance?.get("foreground") ?: "#05D758") as String
       // val loadingBackgroundColor = (loadingAppearance?.get("background") ?: "#FFFFFF") as String
       // val loadingSize = (loadingAppearance?.get("size") ?: 1) as Int

        return Intent(context, FaceCaptchaActivity::class.java).apply {
            putExtra(FaceCaptchaActivity.PARAM_ENDPOINT, ENDPOINT)
            putExtra(FaceCaptchaActivity.PARAM_USER_DATA, userData)
            putExtra(FaceCaptchaActivity.PARAM_SHOW_INSTRUCTIONS, false)
        }
    }

   fun onLiveness2DResultSuccess(data: Intent?) {
        val response = mapOf<String, Any?>(
            "cause" to data?.getStringExtra(FaceCaptchaActivity.PARAM_RESULT_CAUSE),
            "codId" to data?.getStringExtra(FaceCaptchaActivity.PARAM_RESULT_COD_ID),
            "protocol" to data?.getStringExtra(FaceCaptchaActivity.PARAM_RESULT_PROTOCOL),
        )

        result?.success(response)
    }

    /*

    fun onLiveness3DResultCancelled(data: Intent?) {
        val errorMessage: String = data?.getStringExtra(HybridLiveness3DActivity.PARAM_RESULT_ERROR) ?: ""
        Log.d("TAG", errorMessage)
        result?.error(errorMessage, errorMessage, null)
    }

    private fun getLoadingType(typeString: String): LoadingType3D {
        return when(typeString) {
            "spinner" -> LoadingType3D.SPINNER
            "activity" -> LoadingType3D.ACTIVITY_INDICATOR
            else -> LoadingType3D.ACTIVITY_INDICATOR
        }
    }
    */
}
