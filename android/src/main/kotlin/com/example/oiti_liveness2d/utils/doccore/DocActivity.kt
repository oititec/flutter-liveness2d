package com.example.oiti_liveness2d.utils.doccore

import android.content.Context
import android.content.Intent
import android.util.Log
import br.com.oiti.certiface.DocCopyTheme
import br.com.oiti.certiface.data.util.Environment
import br.com.oiti.certiface.documentscopy.DocumentscopyActivity
import br.com.oiti.certiface.documentscopy.DocumentscopyErrorCode
import io.flutter.plugin.common.MethodChannel

class DocActivity(
    private var context: Context,
    private val result: MethodChannel.Result?,
    private val appKey: String?,
    private val ticket: String?,
    private val themeBuilder: Map<String, String?>?,
) {

    fun getIntent(): Intent {
        if (appKey.isNullOrBlank() || appKey.length < 16 || ticket?.length!! < 16) {
            throw InvalidAppKey()
        }

       // val loadingColor = (loadingAppearance?.get("foreground") ?: "#05D758") as String
       // val loadingBackgroundColor = (loadingAppearance?.get("background") ?: "#FFFFFF") as String
       // val loadingSize = (loadingAppearance?.get("size") ?: 1) as Int
       // val loadingType = getLoadingType((loadingAppearance?.get("type") ?: "") as String)

        return Intent(context, DocumentscopyActivity::class.java).apply {
            putExtra(DocumentscopyActivity.PARAM_ENDPOINT, "https://comercial.certiface.com.br")
            putExtra(DocumentscopyActivity.PARAM_APP_KEY, appKey)
            putExtra(DocumentscopyActivity.PARAM_TICKET,ticket )
            putExtra(DocumentscopyActivity.PARAM_THEME, getNewTheme())
            putExtra(DocumentscopyActivity.PARAM_HYBRID, true)
            putExtra(DocumentscopyActivity.PARAM_ENVIRONMENT, Environment.HML)
            putExtra(
                DocumentscopyActivity.PARAM_DEBUG_ON,
                false
            )
        }
    }


    fun onDocumentscopyResultSuccess() {
        result?.success("Doc - RESULT_OK")
    }

    fun onDocumentscopyCancelled(data: Intent?) {
        val errorMessage = data?.getStringExtra(DocumentscopyActivity.PARAM_RESULT_ERROR)
        val errorCode =
            data?.getSerializableExtra(DocumentscopyActivity.PARAM_RESULT_ERROR_CODE) as? DocumentscopyErrorCode

        errorCode?.let {
            result?.error(errorCode.toString(),errorMessage, null)
        }
    }

    private fun getNewTheme() = DocCopyTheme.Builder()
        //NewCustom Instruction
        .instructionTitleText("Aro aqui eu To")
        .instructionTitleColor("#A5CD39")
        .instructionCaptionColor("#A5CD39")
        .instructionCaptionText("123 mais um teste")
        .instructionBackgroundColor("#A5CD39")
        .instructionBottomSheetBackgroundColor("#333333")
        .rgTitleText("title RG")
        .rgTitleColor("#FFFFFF")
        .rgCaptionText("RG Subtext Lorem Ipsum")
        .rgCaptionColor("#FFFFFF")
        .cnhTitleText("title CNH")
        .cnhTitleColor("#FFFFFF")
        .cnhCaptionText("CNH Subtext Lorem Ipsum")
        .cnhCaptionColor("#FFFFFF")

        //NewCustom Capture
        .setCaptureBackgroundColor("#FFFFFF")
        .textOkColor("#FFFFFF")
        .setBackgroundDismissColor("#DD0101")
        .setTryAgainColor("#FFFFFF")
        .setBackgroundOkColor("#4bb75f")

        .setTextFront("textFront")
        .setTextBack("textBack")
        .setCaptureInstructionGuideText("textPicture")
        .setCaptureInstructionGuideBackgroundColor("#DD0101")
        .setCaptureInstructionGuideTextColor("#333333")
        .setTextOk("textOk")
        .setTextConfirmation("textConfirmation")
        .setTextRedo("textRedo")

        // caso seja hybrido
        /*.setBackgroundDismissColorHybrid("#73997d")
        .setBackgroundOkColorHybrid("#3b3bd4")
        .setTryAgainColorHybrid("#383531")
        .setBackgroundCameraColorHybrid("#70856e")*/

        .build()


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
