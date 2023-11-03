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
  String? setCaptureInstructionGuideText;
  String? setCaptureInstructionGuideBackgroundColor;
  String? setCaptureInstructionGuideTextColor;
  String? setTextOk;
  String? setTextConfirmation;
  String? setTextRedo;

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
        'setCaptureInstructionGuideText': setCaptureInstructionGuideText ?? "",
        'setCaptureInstructionGuideBackgroundColor':
            setCaptureInstructionGuideBackgroundColor ?? "",
        'setCaptureInstructionGuideTextColor':
            setCaptureInstructionGuideTextColor ?? "",
        'setTextOk': setTextOk ?? "",
        'setTextConfirmation': setTextConfirmation ?? "",
        'setTextRedo': setTextRedo ?? "",
      };
}
