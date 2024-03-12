package com.example.oiti_liveness2d.utils.liveness2d

import android.content.Context
import android.content.Intent
import android.util.Log
import br.com.oiti.certiface.data.FaceCaptchaErrorCode
import br.com.oiti.certiface.data.util.Environment
import br.com.oiti.certiface.facecaptcha.FaceCaptchaActivity
import br.com.oiti.certiface.facecaptcha.UserData
import br.com.oiti.certiface.documentscopy.DocumentscopyActivity
import br.com.oiti.certiface.documentscopy.DocumentscopyErrorCode

import io.flutter.plugin.common.MethodChannel

class Liveness2dActivity(
    private var context: Context,
    private val result: MethodChannel.Result?,
    private val appKey: String?,
    private val environment: String?,
) {

    fun getIntent(): Intent {
        if (appKey.isNullOrBlank()) {
            throw InvalidAppKey()
        }

        val userData = UserData(appKey = appKey)
        val env: Environment = if (environment.equals("PRD")) Environment.PRD else Environment.HML

        return Intent(context, FaceCaptchaActivity::class.java).apply {
            putExtra(FaceCaptchaActivity.PARAM_SHOW_INSTRUCTIONS, false)
            putExtra(FaceCaptchaActivity.PARAM_ENVIRONMENT, env)
            putExtra(FaceCaptchaActivity.PARAM_USER_DATA, userData)
            putExtra(FaceCaptchaActivity.PARAM_DEBUG_ON, false)
        }
    }


    fun onFaceCaptchaResultSuccess(data: Intent?) {
        val codID = data?.getDoubleExtra(FaceCaptchaActivity.PARAM_RESULT_COD_ID, 0.0)
        val response = mapOf<String, Any?>(
            "valid" to data?.getBooleanExtra(FaceCaptchaActivity.PARAM_RESULT, false),
            "cause" to data?.getStringExtra(FaceCaptchaActivity.PARAM_RESULT_CAUSE),
            "cod_id" to codID.toString(),
            "uid_protocol" to data?.getStringExtra(FaceCaptchaActivity.PARAM_RESULT_PROTOCOL),
        )

        result?.success(response)
    }

    fun onFaceCaptchaResultCancelled(data: Intent?) {
        val errorMessage = data?.getStringExtra(FaceCaptchaActivity.PARAM_RESULT_ERROR)
        val errorCode =
            data?.getSerializableExtra(FaceCaptchaActivity.PARAM_RESULT_ERROR_CODE) as? FaceCaptchaErrorCode

        errorCode?.let {
            result?.error(errorCode.toString(),errorMessage, null)
        }
    }

}
