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
    private val ticket: String? = null,
    private val themeBuilder: Map<String, String?>?,
) {

    fun getIntent(): Intent {
        if (appKey.isNullOrBlank() || appKey.length < 16 || ticket?.length!! < 16) {
            throw InvalidAppKey()
        }

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
        .setTextOk("OK CUSTOM")
        .setTextConfirmation("textConfirmation")
        .setTextRedo("NOVA FOTO")

        // caso seja hybrido
        /*.setBackgroundDismissColorHybrid("#73997d")
        .setBackgroundOkColorHybrid("#3b3bd4")
        .setTryAgainColorHybrid("#383531")
        .setBackgroundCameraColorHybrid("#70856e")*/

        .build()

    fun onDocumentscopyCancelled(data: Intent?) {
        val errorMessage = data?.getStringExtra(DocumentscopyActivity.PARAM_RESULT_ERROR)
        val errorCode =
            data?.getSerializableExtra(DocumentscopyActivity.PARAM_RESULT_ERROR_CODE) as? DocumentscopyErrorCode

        errorCode?.let {
            result?.error(errorCode.toString(),errorMessage, null)
        }
    }

    fun onDocumentscopyResultSuccess(data: Intent?) {
        val response = mapOf<String, Any?>(
            "valid" to "true",
            "cause" to "0",
            "codId" to "0",
            "protocol" to "0",
            "blob" to "0",
        )

        result?.success(response)
    }


}
