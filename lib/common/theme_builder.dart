class ThemeBuilder {
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

  String? setCaptureBackButtonColorsIcon;
  String? setCaptureBackButtonColorsBackground;
  String? setCaptureBackButtonColorsBorder;

  String? setCaptureCloseButtonColorsIcon;
  String? setCaptureCloseButtonColorsBackground;
  String? setCaptureCloseButtonColorsBorder;

  String? setCaptureFrontIndicatorColor;

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
        'setCaptureBackgroundColor': setCaptureBackgroundColor ?? "",
        'textOkColor': textOkColor ?? "",
        'setBackgroundDismissColor': setBackgroundDismissColor ?? "",
        'setTryAgainColor': setTryAgainColor ?? "",
        'setBackgroundOkColor': setBackgroundOkColor ?? "",
        'setTextFront': setTextFront ?? "",
        'setTextBack': setTextBack ?? "",
        'setCaptureInstructionGuideTextFront':
            setCaptureInstructionGuideTextFront ?? "",
        'setCaptureInstructionGuideTextBack':
            setCaptureInstructionGuideTextBack ?? "",
        'setCaptureInstructionGuideBackgroundColor':
            setCaptureInstructionGuideBackgroundColor ?? "",
        'setCaptureInstructionGuideTextColor':
            setCaptureInstructionGuideTextColor ?? "",
        'setTextOk': setTextOk ?? "",
        'setTextConfirmation': setTextConfirmation ?? "",
        'setTextRedo': setTextRedo ?? "",
        'setCaptureBackButtonColorsIcon': setCaptureBackButtonColorsIcon ?? "",
        'setCaptureBackButtonColorsBackground':
            setCaptureBackButtonColorsBackground ?? "",
        'setCaptureBackButtonColorsBorder':
            setCaptureBackButtonColorsBorder ?? "",
        'setCaptureCloseButtonColorsIcon':
            setCaptureCloseButtonColorsIcon ?? "",
        'setCaptureCloseButtonColorsBackground':
            setCaptureCloseButtonColorsBackground ?? "",
        'setCaptureCloseButtonColorsBorder':
            setCaptureCloseButtonColorsBorder ?? "",
        'setCaptureFrontIndicatorColor': setCaptureFrontIndicatorColor ?? "",
        'setCaptureFrontIndicatorFocusedStateTextColor':
            setCaptureFrontIndicatorFocusedStateTextColor ?? "",
        'setCaptureFrontIndicatorUnfocusedStateColor':
            setCaptureFrontIndicatorUnfocusedStateColor ?? "",
        'setCaptureBackIndicatorColor': setCaptureBackIndicatorColor ?? "",
        'setCaptureBackIndicatorFocusedStateTextColor':
            setCaptureBackIndicatorFocusedStateTextColor ?? "",
        'setCaptureBackIndicatorUnfocusedStateTextColor':
            setCaptureBackIndicatorUnfocusedStateTextColor ?? "",
        'setCaptureInstructionTextColor': setCaptureInstructionTextColor ?? "",
        'setCapturePreviewBorderColorForCapture':
            setCapturePreviewBorderColorForCapture ?? "",
        'setCapturePreviewBorderColorForUncapturedState':
            setCapturePreviewBorderColorForUncapturedState ?? "",
        'setCaptureCaptureButtonHighlightedStateColorsIcon':
            setCaptureCaptureButtonHighlightedStateColorsIcon ?? "",
        'setCaptureCaptureButtonHighlightedStateColorsBackground':
            setCaptureCaptureButtonHighlightedStateColorsBackground ?? "",
        'setCaptureCaptureButtonHighlightedStateColorsBorder':
            setCaptureCaptureButtonHighlightedStateColorsBorder ?? "",
        'setCaptureCaptureButtonNormalStateColorsIcon':
            setCaptureCaptureButtonNormalStateColorsIcon ?? "",
        'setCaptureCaptureButtonNormalStateColorsBackground':
            setCaptureCaptureButtonNormalStateColorsBackground ?? "",
        'setCaptureCaptureButtonNormalStateColorsBorder':
            setCaptureCaptureButtonNormalStateColorsBorder ?? "",
        'setCaptureCaptureButtonDisabledStateColorsIcon':
            setCaptureCaptureButtonDisabledStateColorsIcon ?? "",
        'setCaptureCaptureButtonDisabledStateColorsBackground':
            setCaptureCaptureButtonDisabledStateColorsBackground ?? "",
        'setCaptureCaptureButtonDisabledStateColorsBorder':
            setCaptureCaptureButtonDisabledStateColorsBorder ?? "",
        'setCaptureBottomSheetShapeColor':
            setCaptureBottomSheetShapeColor ?? "",
        'setCaptureBottomSheetShapeCornerRadius':
            setCaptureBottomSheetShapeCornerRadius,
        'setCaptureTakeNewPictureButtonHighlightedStateColorsText':
            setCaptureTakeNewPictureButtonHighlightedStateColorsText ?? "",
        'setCaptureTakeNewPictureButtonHighlightedStateColorsBackground':
            setCaptureTakeNewPictureButtonHighlightedStateColorsBackground ??
                "",
        'setCaptureTakeNewPictureButtonHighlightedStateColorsBorder':
            setCaptureTakeNewPictureButtonHighlightedStateColorsBorder ?? "",
        'setCaptureTakeNewPictureButtonNormalStateColorsText':
            setCaptureTakeNewPictureButtonNormalStateColorsText ?? "",
        'setCaptureTakeNewPictureButtonNormalStateColorsBackground':
            setCaptureTakeNewPictureButtonNormalStateColorsBackground ?? "",
        'setCaptureTakeNewPictureButtonNormalStateColorsBorder':
            setCaptureTakeNewPictureButtonNormalStateColorsBorder ?? "",
        'setCaptureTakeNewPictureButtonDisabledStateColorsText':
            setCaptureTakeNewPictureButtonDisabledStateColorsText ?? "",
        'setCaptureTakeNewPictureButtonDisabledStateColorsBackground':
            setCaptureTakeNewPictureButtonDisabledStateColorsBackground ?? "",
        'setCaptureTakeNewPictureButtonDisabledStateColorsBorder':
            setCaptureTakeNewPictureButtonDisabledStateColorsBorder ?? "",
        'setCaptureUsePictureButtonText': setCaptureUsePictureButtonText ?? "",
        'setCaptureUsePictureButtonConfirmationText':
            setCaptureUsePictureButtonConfirmationText ?? "",
        'setCaptureUsePictureButtonHighlightedStateColorsText':
            setCaptureUsePictureButtonHighlightedStateColorsText ?? "",
        'setCaptureUsePictureButtonHighlightedStateColorsBackground':
            setCaptureUsePictureButtonHighlightedStateColorsBackground ?? "",
        'setCaptureUsePictureButtonHighlightedStateColorsBorder':
            setCaptureUsePictureButtonHighlightedStateColorsBorder ?? "",
        'setCaptureUsePictureButtonNormalStateColorsText':
            setCaptureUsePictureButtonNormalStateColorsText ?? "",
        'setCaptureUsePictureButtonNormalStateColorsBackground':
            setCaptureUsePictureButtonNormalStateColorsBackground ?? "",
        'setCaptureUsePictureButtonNormalStateColorsBorder':
            setCaptureUsePictureButtonNormalStateColorsBorder ?? "",
        'setCaptureUsePictureButtonDisabledStateColorsText':
            setCaptureUsePictureButtonDisabledStateColorsText ?? "",
        'setCaptureUsePictureButtonDisabledStateColorsBackground':
            setCaptureUsePictureButtonDisabledStateColorsBackground ?? "",
        'setCaptureUsePictureButtonDisabledStateColorsBorder':
            setCaptureUsePictureButtonDisabledStateColorsBorder ?? "",
        'setResultBackgroundColorSuccess':
            setResultBackgroundColorSuccess ?? "",
        'setResultBackgroundColorError': setResultBackgroundColorError ?? "",
        'setResultBackgroundColorTryAgain':
            setResultBackgroundColorTryAgain ?? "",
        'setResultMessageSuccess': setResultMessageSuccess ?? "",
        'setResultMessageError': setResultMessageError ?? "",
        'setResultMessageTryAgain': setResultMessageTryAgain ?? "",
        'setResultMessageColorSuccess': setResultMessageColorSuccess ?? "",
        'setResultMessageColorError': setResultMessageColorError ?? "",
        'setResultMessageColorTryAgain': setResultMessageColorTryAgain ?? "",
        'setResultTryAgainButtonText': setResultTryAgainButtonText ?? "",
        'setResultTryAgainButtonHighlightedStateColorsText':
            setResultTryAgainButtonHighlightedStateColorsText ?? "",
        'setResultTryAgainButtonHighlightedStateColorsBackground':
            setResultTryAgainButtonHighlightedStateColorsBackground ?? "",
        'setResultTryAgainButtonHighlightedStateColorsBorder':
            setResultTryAgainButtonHighlightedStateColorsBorder ?? "",
        'setResultTryAgainButtonNormalStateColorsText':
            setResultTryAgainButtonNormalStateColorsText ?? "",
        'setResultTryAgainButtonNormalStateColorsBackground':
            setResultTryAgainButtonNormalStateColorsBackground ?? "",
        'setResultTryAgainButtonNormalStateColorsBorder':
            setResultTryAgainButtonNormalStateColorsBorder ?? "",
      };
}
