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
    private val environment: String?,
) {

    fun getIntent(): Intent {
        if (appKey.isNullOrBlank() || appKey.length < 16) {
            throw InvalidAppKey()
        }
        val env: Environment = if (environment.equals("PRD")) Environment.PRD else Environment.HML

        return Intent(context, DocumentscopyActivity::class.java).apply {
            putExtra(DocumentscopyActivity.PARAM_APP_KEY, appKey)
            if(ticket?.isNotEmpty() == true) {
                putExtra(DocumentscopyActivity.PARAM_TICKET, ticket)
            }
            putExtra(DocumentscopyActivity.PARAM_THEME, getNewTheme())
            putExtra(DocumentscopyActivity.PARAM_HYBRID, true)
            putExtra(DocumentscopyActivity.PARAM_ENVIRONMENT, env)
            putExtra(DocumentscopyActivity.PARAM_CUSTOM_LOADING_BACKGROUND, themeBuilder?.get("setLoadingBackgroundColor") as? String ?: "#333333")
            putExtra(DocumentscopyActivity.PARAM_CUSTOM_LOADING_SPINNER_COLOR, themeBuilder?.get("setLoadingSpinnerColor") as? String ?: "#05D758")
            putExtra(DocumentscopyActivity.PARAM_CUSTOM_LOADING_SIZE, 100)
            putExtra(
                DocumentscopyActivity.PARAM_DEBUG_ON,
                false
            )
        }
    }

    private fun getNewTheme() = DocCopyTheme.Builder()
    .instructionTitleText(themeBuilder?.get("setInstructionTitleText") ?: "Envio de documento")
    .instructionTitleColor(themeBuilder?.get("setInstructionTitleColor") ?: "#52575D")
    .instructionCaptionColor(themeBuilder?.get("setInstructionCaptionColor") ?: "#666666")
    .instructionCaptionText(themeBuilder?.get("setInstructionCaptionText") ?: "Isso garante que seu documento é oficial.")
    .instructionBottomSheetBackgroundColor(themeBuilder?.get("setInstructionBottomSheetColor")  ?: "#FFFFFF")
    .setInstructionOptionDocumentBackgroundColor(themeBuilder?.get("setInstructionDocOptionBackgroundColor")  ?: "#F5F5F5")
    .setInstructionOptionDocumentText(themeBuilder?.get("setInstructionDocOptionTitleText")  ?: "Use RG, CNH, DNI ou CIN.")
    .setInstructionOptionDocumentTextColor(themeBuilder?.get("setInstructionDocOptionTitleColor")  ?: "#000000")
    .setInstructionOptionDocumentTextFont(themeBuilder?.get("setInstructionDocOptionTitleFont")  ?: "inter_bold")
    .setInstructionOptionDocumentBorderColor(themeBuilder?.get("setInstructionDocOptionBorderColor")  ?: "#E0E0E0")
    .setInstructionOptionLightingBackgroundColor(themeBuilder?.get("setInstructionEnvOptionBackgroundColor")  ?: "#F5F5F5")
    .setInstructionOptionLightingText(themeBuilder?.get("setInstructionEnvOptionTitleText")  ?: "Retire o documento do plástico de proteção.")
    .setInstructionOptionLightingTextColor(themeBuilder?.get("setInstructionEnvOptionTitleColor")  ?: "#000000")
    .setInstructionOptionLightingTextFont(themeBuilder?.get("setInstructionEnvOptionTitleFont")  ?: "inter_bold")
    .setInstructionOptionLightingBorderColor(themeBuilder?.get("setInstructionEnvOptionBorderColor")  ?: "#E0E0E0")
    .setInstructionContinueButtonBackgroundColor(themeBuilder?.get("setInstructionContinueButtonBackgroundColor")  ?: "#F5F5F5")
    .setInstructionContinueButtonTextColor(themeBuilder?.get("setInstructionContinueButtonTextColor")  ?: "#000000")
    .setInstructionContinueButtonTextFont(themeBuilder?.get("setInstructionContinueButtonFont")  ?: "ubuntu_regular")

    .setCaptureBackgroundColor(themeBuilder?.get("setCaptureBackgroundColor")  ?: "#1E1E1E")
    .setCaptureInstructionGuideTextFront(themeBuilder?.get("setCaptureInstructionGuideTextFront")  ?: "Posicione a frente do seu documento dentro da marcação em uma superfície plana e fotografe.")
    .setCaptureInstructionGuideTextBack(themeBuilder?.get("setCaptureInstructionGuideTextBack")  ?: "Posicione o verso do seu documento dentro da marcação em uma superfície plana e fotografe.")
    .setTextOk(themeBuilder?.get("setCaptureUsePictureButtonConfirmationText")  ?: "Sim")
    .setTextRedo(themeBuilder?.get("setCaptureTakeNewPictureButtonText")  ?: "Tentar Novamente")
    .setCaptureInstructionGuideTextColor(themeBuilder?.get("setCaptureInstructionGuideTextColor")  ?: "#FFFFFF")
    .setTextConfirmation(themeBuilder?.get("setTextConfirmation")  ?: "A foto do documento ficou boa?")
    .setBackgroundOkColor(themeBuilder?.get("setCaptureUsePictureButtonHighlightedStateColorsBackground")  ?: "#05D758")
    .setCaptureInstructionGuideReviewText(themeBuilder?.get("setCaptureInstructionGuideReviewText")  ?: "Confirme se os dados ficaram nítidos e os textos legíveis.")
    .setCapturePreviewBorderColorForCapture(themeBuilder?.get("setCapturePreviewBorderColorForCapture")  ?: "#05D758")
    .setCaptureBottomSheetShapeColor(themeBuilder?.get("setCaptureBottomSheetShapeColor")  ?: "#FFFFFF")
    .setCaptureBackButtonColorsIcon(themeBuilder?.get("setCaptureBackButtonColorsIcon")  ?: "#FFFFFF")
    .setCaptureCloseButtonColorsIcon(themeBuilder?.get("setCaptureBackButtonColorsIcon")  ?: "#FFFFFF")
    .setBackgroundDismissColor(themeBuilder?.get("setCaptureTakeNewPictureButtonNormalStateColorsBackground")  ?: "#F5F5F5")
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
