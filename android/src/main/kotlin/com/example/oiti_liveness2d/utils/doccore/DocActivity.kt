package com.example.oiti_liveness2d.utils.doccore

import android.content.Context
import android.content.Intent
import android.util.Log
import br.com.oiti.certiface.documentscopy.DocumentscopyActivity
import br.com.oiti.certiface.documentscopy.DocumentscopyErrorCode
import io.flutter.plugin.common.MethodChannel

class DocActivity(
    private var context: Context,
    private val result: MethodChannel.Result?,
    private val appKey: String?,
    private val ticket: String?,
) {
    private val ENDPOINT = "https://comercial.certiface.com.br:8443"

    private val E_ACTIVITY_DOES_NOT_EXIST = "E_ACTIVITY_DOES_NOT_EXIST"
    private val E_FAILED_TO_SHOW_PICKER = "E_FAILED_TO_SHOW_PICKER"

    fun getIntent(): Intent {
        if (appKey.isNullOrBlank()) {
            throw InvalidAppKey()
        }

       // val loadingColor = (loadingAppearance?.get("foreground") ?: "#05D758") as String
       // val loadingBackgroundColor = (loadingAppearance?.get("background") ?: "#FFFFFF") as String
       // val loadingSize = (loadingAppearance?.get("size") ?: 1) as Int
       // val loadingType = getLoadingType((loadingAppearance?.get("type") ?: "") as String)

        return Intent(context, DocumentscopyActivity::class.java).apply {
            putExtra(DocumentscopyActivity.PARAM_ENDPOINT, ENDPOINT)
            putExtra(DocumentscopyActivity.PARAM_APP_KEY, appKey)
            putExtra(DocumentscopyActivity.PARAM_TICKET,ticket )
            putExtra(DocumentscopyActivity.PARAM_HYBRID, true)
            //  putExtra(DocumentscopyActivity.PARAM_CERTIFACE_ENV, CertifaceEnviroment.HML)
            putExtra(
                DocumentscopyActivity.PARAM_DEBUG_ON,
                false
            )
        }
    }

    /*
    fun onDocResultSuccess(data: Intent?) {
        val response = mapOf<String, Any?>(
            "valid" to data?.getBooleanExtra(DocumentscopyActivity.PARAM_RESULT_VALID, false),
            "cause" to data?.getStringExtra(DocumentscopyActivity.PARAM_RESULT_CAUSE),
            "codId" to data?.getStringExtra(DocumentscopyActivity.PARAM_RESULT_COD_ID),
            "protocol" to data?.getStringExtra(DocumentscopyActivity.PARAM_RESULT_PROTOCOL),
            "blob" to data?.getStringExtra(DocumentscopyActivity.PARAM_RESULT_SCAN),
        )

        result?.success(response)
    }

    fun onLiveness3DResultCancelled(data: Intent?) {
        val errorMessage: String = data?.getStringExtra(DocumentscopyActivity.PARAM_RESULT_ERROR) ?: ""
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
