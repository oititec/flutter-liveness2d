class ThemeBuilder {
  String? setInstructionBackgroundColor;
  String? setInstructionBackButtonColorsIcon;
  String? setInstructionBackButtonColorsBackground;
  String? setInstructionBackButtonColorsBorder;
  String? setInstructionLoadingColor;
  String? setInstructionBottomSheetColor;
  int? setInstructionBottomSheetRadius;
  String? setInstructionTitleText;
  String? setInstructionTitleColor;
  String? setInstructionTitleFont;
  String? setInstructionCaptionText;
  String? setInstructionCaptionColor;
  String? setInstructionCaptionFont;
  String? setInstructionDocOptionBackgroundColor;
  String? setInstructionDocOptionTitleText;
  String? setInstructionDocOptionTitleColor;
  String? setInstructionDocOptionTitleFont;
  String? setInstructionDocOptionBorderColor;
  int? setInstructionDocOptionBorderWidth;
  int? setInstructionDocOptionBorderRadius;
  String? setInstructionEnvOptionBackgroundColor;
  String? setInstructionEnvOptionTitleText;
  String? setInstructionEnvOptionTitleColor;
  String? setInstructionEnvOptionTitleFont;
  String? setInstructionEnvOptionBorderColor;
  int? setInstructionEnvOptionBorderWidth;
  int? setInstructionEnvOptionBorderRadius;
  String? setInstructionContinueButtonBackgroundColor;
  String? setInstructionContinueButtonHighlightedBackgroundColor;
  String? setInstructionContinueButtonBorderColor;
  String? setInstructionContinueButtonHighlightedBorderColor;
  String? setInstructionContinueButtonContentColor;
  String? setInstructionContinueButtonHighlightedContentColor;
  String? setInstructionContinueButtonTextColor;
  String? setInstructionContinueButtonFont;
  String? instructionTitleText;
  String? instructionTitleColor;
  String? instructionCaptionColor;
  String? instructionCaptionText;
  String? instructionBackgroundColor;
  String? instructionBottomSheetBackgroundColor;
  String? setCaptureBottomSheetBackground;
  String? rgTitleText;
  String? rgTitleColor;
  String? rgCaptionText;
  String? rgCaptionColor;
  String? cnhTitleText;
  String? cnhTitleColor;
  String? cnhCaptionText;
  String? cnhCaptionColor;
  String? setCaptureBackgroundColor;
  String? setCaptureInstructionGuideReviewText;
  String? textOkColor;
  String? setBackgroundDismissColor;
  String? setTryAgainColor;
  String? setBackgroundOkColor;
  String? setTextFront;
  String? setTextBack;
  String? setCaptureInstructionGuideTextFront;
  String? setCaptureInstructionGuideTextBack;
  String? setCaptureInstructionGuideBackgroundColor;
  String? setCaptureInstructionGuideTextColor;
  String? setTextOk;
  String? setTextConfirmation;
  String? setTextRedo;
  String? setCaptureTakeNewPictureButtonText;

  String? setCaptureBackButtonIcon;
  String? setCaptureBackButtonColorsIcon;
  String? setCaptureBackButtonColorsBackground;
  String? setCaptureBackButtonColorsBorder;

  String? setCaptureCloseButtonColorsIcon;
  String? setCaptureCloseButtonColorsBackground;
  String? setCaptureCloseButtonColorsBorder;

  String? setCaptureFrontIndicatorColor;
  String? setCaptureFrontIndicatorFocusedStateColor;

  String? setCaptureFrontIndicatorFocusedStateTextColor;
  String? setCaptureFrontIndicatorUnfocusedStateColor;

  String? setCaptureBackIndicatorColor;

  String? setCaptureBackIndicatorFocusedStateTextColor;
  String? setCaptureBackIndicatorUnfocusedStateTextColor;

  String? setCaptureInstructionTextColor;
  String? setCapturePreviewBorderColorForCapture;
  String? setCapturePreviewBorderColorForUncapturedState;

  String? setCaptureCaptureButtonHighlightedStateColorsIcon;
  String? setCaptureCaptureButtonHighlightedStateColorsBackground;
  String? setCaptureCaptureButtonHighlightedStateColorsBorder;

  String? setCaptureCaptureButtonNormalStateColorsIcon;
  String? setCaptureCaptureButtonNormalStateColorsBackground;
  String? setCaptureCaptureButtonNormalStateColorsBorder;

  String? setCaptureCaptureButtonDisabledStateColorsIcon;
  String? setCaptureCaptureButtonDisabledStateColorsBackground;
  String? setCaptureCaptureButtonDisabledStateColorsBorder;

  String? setCaptureBottomSheetShapeColor;
  int? setCaptureBottomSheetShapeCornerRadius;

  String? setCaptureTakeNewPictureButtonHighlightedStateColorsText;
  String? setCaptureTakeNewPictureButtonHighlightedStateColorsBackground;
  String? setCaptureTakeNewPictureButtonHighlightedStateColorsBorder;

  String? setCaptureTakeNewPictureButtonNormalStateColorsText;
  String? setCaptureTakeNewPictureButtonNormalStateColorsBackground;
  String? setCaptureTakeNewPictureButtonNormalStateColorsBorder;

  String? setCaptureTakeNewPictureButtonDisabledStateColorsText;
  String? setCaptureTakeNewPictureButtonDisabledStateColorsBackground;
  String? setCaptureTakeNewPictureButtonDisabledStateColorsBorder;

  String? setCaptureUsePictureButtonText;
  String? setCaptureUsePictureButtonConfirmationText;

  String? setCaptureUsePictureButtonHighlightedStateColorsText;
  String? setCaptureUsePictureButtonHighlightedStateColorsBackground;
  String? setCaptureUsePictureButtonHighlightedStateColorsBorder;

  String? setCaptureUsePictureButtonNormalStateColorsText;
  String? setCaptureUsePictureButtonNormalStateColorsBackground;
  String? setCaptureUsePictureButtonNormalStateColorsBorder;

  String? setCaptureUsePictureButtonDisabledStateColorsText;
  String? setCaptureUsePictureButtonDisabledStateColorsBackground;
  String? setCaptureUsePictureButtonDisabledStateColorsBorder;

  String? setResultBackgroundColorSuccess;
  String? setResultBackgroundColorError;
  String? setResultBackgroundColorTryAgain;

  String? setResultMessageSuccess;
  String? setResultMessageError;
  String? setResultMessageTryAgain;

  String? setResultMessageColorSuccess;
  String? setResultMessageColorError;
  String? setResultMessageColorTryAgain;

  String? setResultTryAgainButtonHighlightedStateColorsText;
  String? setResultTryAgainButtonHighlightedStateColorsBackground;
  String? setResultTryAgainButtonHighlightedStateColorsBorder;

  String? setResultTryAgainButtonNormalStateColorsText;
  String? setResultTryAgainButtonNormalStateColorsBackground;
  String? setResultTryAgainButtonNormalStateColorsBorder;

  String? setResultTryAgainButtonText;
  String? setLoadingBackgroundColor;
  String? setLoadingSpinnerColor;
  int? setLoadingSpinnerWidth;
  int? setLoadingSpinnerScale;

  Map toJson() => {
        'instructionTitleText': instructionTitleText ?? "",
        'instructionTitleColor': instructionTitleColor ?? "",
        'instructionCaptionColor': instructionCaptionColor ?? "",
        'instructionCaptionText': instructionCaptionText ?? "",
        'instructionBackgroundColor': instructionBackgroundColor ?? "",
        'instructionBottomSheetBackgroundColor':
            instructionBottomSheetBackgroundColor ?? "",
        'setCaptureBottomSheetBackground':
            setCaptureBottomSheetBackground ?? "",
        'rgTitleText': rgTitleText ?? "",
        'rgTitleColor': rgTitleColor ?? "",
        'rgCaptionText': rgCaptionText ?? "",
        'rgCaptionColor': rgCaptionColor ?? "",
        'cnhTitleText': cnhTitleText ?? "",
        'cnhTitleColor': cnhTitleColor ?? "",
        'cnhCaptionText': cnhCaptionText ?? "",
        'cnhCaptionColor': cnhCaptionColor ?? "",
        'setCaptureBackgroundColor': setCaptureBackgroundColor ?? "#1E1E1E",
        'textOkColor': textOkColor ?? "",
        'setBackgroundDismissColor': setBackgroundDismissColor ?? "",
        'setTryAgainColor': setTryAgainColor ?? "",
        'setBackgroundOkColor': setBackgroundOkColor ?? "#0DAE4B",
        'setTextFront': setTextFront ?? "Frente",
        'setTextBack': setTextBack ?? "Verso",
        'setCaptureInstructionGuideTextFront':
            setCaptureInstructionGuideTextFront ??
                "Posicione a frente do seu documento dentro da marcação em uma superfície plana e fotografe.",
        'setCaptureInstructionGuideTextBack': setCaptureInstructionGuideTextBack ??
            "Posicione o verso do seu documento dentro da marcação em uma superfície plana e fotografe.",
        'setCaptureInstructionGuideBackgroundColor':
            setCaptureInstructionGuideBackgroundColor ?? "#1E1E1E",
        'setCaptureInstructionGuideTextColor':
            setCaptureInstructionGuideTextColor ?? "#FFFFFF",
        'setTextOk': setTextOk ?? "",
        'setTextConfirmation':
            setTextConfirmation ?? "A foto do documento ficou boa?",
        'setTextRedo': setTextRedo ?? "",
        'setCaptureTakeNewPictureButtonText':
            setCaptureTakeNewPictureButtonText ?? "Não, refazer",
        'setCaptureBackButtonColorsIcon':
            setCaptureBackButtonColorsIcon ?? "#FFFFFF",
        'setCaptureBackButtonColorsBackground':
            setCaptureBackButtonColorsBackground ?? "#1E1E1E",
        'setCaptureBackButtonColorsBorder':
            setCaptureBackButtonColorsBorder ?? "#1E1E1E",
        'setCaptureCloseButtonColorsIcon':
            setCaptureCloseButtonColorsIcon ?? "#FFFFFF",
        'setCaptureCloseButtonColorsBackground':
            setCaptureCloseButtonColorsBackground ?? "#1E1E1E",
        'setCaptureCloseButtonColorsBorder':
            setCaptureCloseButtonColorsBorder ?? "#1E1E1E",
        'setCaptureFrontIndicatorColor':
            setCaptureFrontIndicatorColor ?? "#FFFFFF",
        'setCaptureFrontIndicatorFocusedStateTextColor':
            setCaptureFrontIndicatorFocusedStateTextColor ?? "#FFFFFF",
        'setCaptureFrontIndicatorUnfocusedStateColor':
            setCaptureFrontIndicatorUnfocusedStateColor ?? "#666666",
        'setCaptureBackIndicatorColor':
            setCaptureBackIndicatorColor ?? "#FFFFFF",
        'setCaptureBackIndicatorFocusedStateTextColor':
            setCaptureBackIndicatorFocusedStateTextColor ?? "#FFFFFF",
        'setCaptureBackIndicatorUnfocusedStateTextColor':
            setCaptureBackIndicatorUnfocusedStateTextColor ?? "#666666",
        'setCaptureInstructionTextColor':
            setCaptureInstructionTextColor ?? "#FFFFFF",
        'setCapturePreviewBorderColorForCapture':
            setCapturePreviewBorderColorForCapture ?? "#0DAE4B",
        'setCapturePreviewBorderColorForUncapturedState':
            setCapturePreviewBorderColorForUncapturedState ?? "#0DAE4B",
        'setCaptureCaptureButtonHighlightedStateColorsIcon':
            setCaptureCaptureButtonHighlightedStateColorsIcon ?? "#000000",
        'setCaptureCaptureButtonHighlightedStateColorsBackground':
            setCaptureCaptureButtonHighlightedStateColorsBackground ??
                "#0DAE4B",
        'setCaptureCaptureButtonHighlightedStateColorsBorder':
            setCaptureCaptureButtonHighlightedStateColorsBorder ?? "#FFFFFF",
        'setCaptureCaptureButtonNormalStateColorsIcon':
            setCaptureCaptureButtonNormalStateColorsIcon ?? "#000000",
        'setCaptureCaptureButtonNormalStateColorsBackground':
            setCaptureCaptureButtonNormalStateColorsBackground ?? "#0DAE4B",
        'setCaptureCaptureButtonNormalStateColorsBorder':
            setCaptureCaptureButtonNormalStateColorsBorder ?? "#FFFFFF",
        'setCaptureCaptureButtonDisabledStateColorsIcon':
            setCaptureCaptureButtonDisabledStateColorsIcon ?? "#000000",
        'setCaptureCaptureButtonDisabledStateColorsBackground':
            setCaptureCaptureButtonDisabledStateColorsBackground ?? "#666666",
        'setCaptureCaptureButtonDisabledStateColorsBorder':
            setCaptureCaptureButtonDisabledStateColorsBorder ?? "#666666",
        'setCaptureBottomSheetShapeColor':
            setCaptureBottomSheetShapeColor ?? "#FFFFFF",
        'setCaptureBottomSheetShapeCornerRadius':
            setCaptureBottomSheetShapeCornerRadius,
        'setCaptureTakeNewPictureButtonHighlightedStateColorsText':
            setCaptureTakeNewPictureButtonHighlightedStateColorsText ??
                "#1E1E1E",
        'setCaptureTakeNewPictureButtonHighlightedStateColorsBackground':
            setCaptureTakeNewPictureButtonHighlightedStateColorsBackground ??
                "#F5F5F5",
        'setCaptureTakeNewPictureButtonHighlightedStateColorsBorder':
            setCaptureTakeNewPictureButtonHighlightedStateColorsBorder ??
                "#F5F5F5",
        'setCaptureTakeNewPictureButtonNormalStateColorsText':
            setCaptureTakeNewPictureButtonNormalStateColorsText ?? "#1E1E1E",
        'setCaptureTakeNewPictureButtonNormalStateColorsBackground':
            setCaptureTakeNewPictureButtonNormalStateColorsBackground ??
                "#F5F5F5",
        'setCaptureTakeNewPictureButtonNormalStateColorsBorder':
            setCaptureTakeNewPictureButtonNormalStateColorsBorder ?? "#F5F5F5",
        'setCaptureTakeNewPictureButtonDisabledStateColorsText':
            setCaptureTakeNewPictureButtonDisabledStateColorsText ?? "#1E1E1E",
        'setCaptureTakeNewPictureButtonDisabledStateColorsBackground':
            setCaptureTakeNewPictureButtonDisabledStateColorsBackground ??
                "#F5F5F5",
        'setCaptureTakeNewPictureButtonDisabledStateColorsBorder':
            setCaptureTakeNewPictureButtonDisabledStateColorsBorder ??
                "#F5F5F5",
        'setCaptureUsePictureButtonText':
            setCaptureUsePictureButtonText ?? "Sim",
        'setCaptureUsePictureButtonConfirmationText':
            setCaptureUsePictureButtonConfirmationText ?? "Sim",
        'setCaptureUsePictureButtonHighlightedStateColorsText':
            setCaptureUsePictureButtonHighlightedStateColorsText ?? "#1E1E1E",
        'setCaptureUsePictureButtonHighlightedStateColorsBackground':
            setCaptureUsePictureButtonHighlightedStateColorsBackground ??
                "#4BB75F",
        'setCaptureUsePictureButtonHighlightedStateColorsBorder':
            setCaptureUsePictureButtonHighlightedStateColorsBorder ?? "#4BB75F",
        'setCaptureUsePictureButtonNormalStateColorsText':
            setCaptureUsePictureButtonNormalStateColorsText ?? "#1E1E1E",
        'setCaptureUsePictureButtonNormalStateColorsBackground':
            setCaptureUsePictureButtonNormalStateColorsBackground ?? "#4BB75F",
        'setCaptureUsePictureButtonNormalStateColorsBorder':
            setCaptureUsePictureButtonNormalStateColorsBorder ?? "#4BB75F",
        'setCaptureUsePictureButtonDisabledStateColorsText':
            setCaptureUsePictureButtonDisabledStateColorsText ?? "#333333",
        'setCaptureUsePictureButtonDisabledStateColorsBackground':
            setCaptureUsePictureButtonDisabledStateColorsBackground ??
                "#666666",
        'setCaptureUsePictureButtonDisabledStateColorsBorder':
            setCaptureUsePictureButtonDisabledStateColorsBorder ?? "#666666",
        'setResultBackgroundColorSuccess':
            setResultBackgroundColorSuccess ?? "#4BB75F",
        'setResultBackgroundColorError':
            setResultBackgroundColorError ?? "#DD0101",
        'setResultBackgroundColorTryAgain':
            setResultBackgroundColorTryAgain ?? "#DD0101",
        'setResultMessageSuccess': setResultMessageSuccess ?? "Tudo certo!",
        'setResultMessageError': setResultMessageError ??
            "Não foi possível verificar seu documento.",
        'setResultMessageTryAgain': setResultMessageTryAgain ??
            "Não foi possível verificar seu documento.",
        'setResultMessageColorSuccess':
            setResultMessageColorSuccess ?? "#FFFFFF",
        'setResultMessageColorError': setResultMessageColorError ?? "#FFFFFF",
        'setResultMessageColorTryAgain':
            setResultMessageColorTryAgain ?? "#FFFFFF",
        'setResultTryAgainButtonText':
            setResultTryAgainButtonText ?? "Tentar novamente",
        'setResultTryAgainButtonHighlightedStateColorsText':
            setResultTryAgainButtonHighlightedStateColorsText ?? "#1E1E1E",
        'setResultTryAgainButtonHighlightedStateColorsBackground':
            setResultTryAgainButtonHighlightedStateColorsBackground ??
                "#FFFFFF",
        'setResultTryAgainButtonHighlightedStateColorsBorder':
            setResultTryAgainButtonHighlightedStateColorsBorder ?? "#FFFFFF",
        'setResultTryAgainButtonNormalStateColorsText':
            setResultTryAgainButtonNormalStateColorsText ?? "#1E1E1E",
        'setResultTryAgainButtonNormalStateColorsBackground':
            setResultTryAgainButtonNormalStateColorsBackground ?? "#FFFFFF",
        'setResultTryAgainButtonNormalStateColorsBorder':
            setResultTryAgainButtonNormalStateColorsBorder ?? "#FFFFFF",
        'setLoadingBackgroundColor': setLoadingBackgroundColor ?? "#1E1E1E",
        'setLoadingSpinnerColor': setLoadingSpinnerColor ?? "#0DAE4B",
        'setLoadingSpinnerWidth': setLoadingSpinnerWidth ?? 1,
        'setLoadingSpinnerScale': setLoadingSpinnerScale ?? 1,
        'setCaptureInstructionGuideReviewText':
            setCaptureInstructionGuideReviewText ??
                "Confirme se os dados ficaram nítidos e os textos legíveis.",
        'setInstructionBackgroundColor': setInstructionBackgroundColor ?? "",
        'setInstructionBackButtonColorsIcon':
            setInstructionBackButtonColorsIcon ?? "",
        'setInstructionBackButtonColorsBackground':
            setInstructionBackButtonColorsBackground ?? "",
        'setInstructionBackButtonColorsBorder':
            setInstructionBackButtonColorsBorder ?? "",
        'setInstructionLoadingColor': setInstructionLoadingColor ?? "",
        'setInstructionBottomSheetColor': setInstructionBottomSheetColor ?? "",
        'setInstructionBottomSheetRadius':
            setInstructionBottomSheetRadius ?? "",
        'setInstructionTitleText': setInstructionTitleText ?? "",
        'setInstructionTitleColor': setInstructionTitleColor ?? "",
        'setInstructionTitleFont': setInstructionTitleFont ?? "",
        'setInstructionCaptionText': setInstructionCaptionText ?? "",
        'setInstructionCaptionColor': setInstructionCaptionColor ?? "",
        'setInstructionCaptionFont': setInstructionCaptionFont ?? "",
        'setInstructionDocOptionBackgroundColor':
            setInstructionDocOptionBackgroundColor ?? "",
        'setInstructionDocOptionTitleText':
            setInstructionDocOptionTitleText ?? "",
        'setInstructionDocOptionTitleColor':
            setInstructionDocOptionTitleColor ?? "",
        'setInstructionDocOptionTitleFont':
            setInstructionDocOptionTitleFont ?? "",
        'setInstructionDocOptionBorderColor':
            setInstructionDocOptionBorderColor ?? "",
        'setInstructionDocOptionBorderWidth':
            setInstructionDocOptionBorderWidth ?? "",
        'setInstructionDocOptionBorderRadius':
            setInstructionDocOptionBorderRadius ?? "",
        'setInstructionEnvOptionBackgroundColor':
            setInstructionEnvOptionBackgroundColor ?? "",
        'setInstructionEnvOptionTitleText':
            setInstructionEnvOptionTitleText ?? "",
        'setInstructionEnvOptionTitleColor':
            setInstructionEnvOptionTitleColor ?? "",
        'setInstructionEnvOptionTitleFont':
            setInstructionEnvOptionTitleFont ?? "",
        'setInstructionEnvOptionBorderColor':
            setInstructionEnvOptionBorderColor ?? "",
        'setInstructionEnvOptionBorderWidth':
            setInstructionEnvOptionBorderWidth ?? "",
        'setInstructionEnvOptionBorderRadius':
            setInstructionEnvOptionBorderRadius ?? "",
        'setInstructionContinueButtonBackgroundColor':
            setInstructionContinueButtonBackgroundColor ?? "",
        'setInstructionContinueButtonHighlightedBackgroundColor':
            setInstructionContinueButtonHighlightedBackgroundColor ?? "",
        'setInstructionContinueButtonBorderColor':
            setInstructionContinueButtonBorderColor ?? "",
        'setInstructionContinueButtonHighlightedBorderColor':
            setInstructionContinueButtonHighlightedBorderColor ?? "",
        'setInstructionContinueButtonContentColor':
            setInstructionContinueButtonContentColor ?? "",
        'setInstructionContinueButtonHighlightedContentColor':
            setInstructionContinueButtonHighlightedContentColor ?? "",
        'setInstructionContinueButtonTextColor':
            setInstructionContinueButtonTextColor ?? "",
        'setInstructionContinueButtonFont':
            setInstructionContinueButtonFont ?? "",
      };
}
