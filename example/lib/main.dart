import 'package:flutter/material.dart';
import 'dart:async';

import 'package:oiti_liveness2d/oiti_liveness2d.dart';
import 'package:oiti_liveness2d_example/widgets/camera_permission.dart';
import 'package:oiti_liveness2d_example/widgets/documentscopy.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;
  late TextEditingController _controllerT;

  String _platformVersion = 'Unknown';
  var appKey = '';
  var ticket = '';
  var resultTitle = '';
  var resultContent = '';
  final environment = Environment.hml;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String? platformVersion = "10";
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _controller = TextEditingController();
    _controllerT = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerT.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Liveness + Doc - Flutter'),
        ),
        body: ListView(
          children: [
            _liveness2DWidgetOption(
              context,
              'Livneness2D',
            ),
            _documentscopyWidgetOption(
              context,
              'Doc Core',
            ),
            _documentscopyWidgetOption(
              context,
              'Doc Core Custom',
              themeBuilder: _themeCustomization(),
              instructionWidget: instructionScreen(),
              permissionWidget: CameraPermissionWidget(),
            ),
            _documentscopyWidgetOption(
              context,
              'Doc Intrução & Permissão Custom',
              instructionWidget: instructionScreen(),
              permissionWidget: CameraPermissionWidget(),
            ),
            _documentscopyWidgetOption(
              context,
              'Doc Core Intrução Custom',
              instructionWidget: instructionScreen(),
            ),
            _documentscopyWidgetOption(
              context,
              'Doc Core Permissão Custom',
              permissionWidget: CameraPermissionWidget(),
            ),
            _hideInstructionWidgetOption(
              context,
              'Doc Core - Pular Telas',
              themeBuilder: _themeCustomization(),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(resultContent),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child:
                  Text(ticket.isEmpty ? 'Ticket vazio' : 'Ticket disponivel'),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child:
                  Text(appKey.isEmpty ? 'AppKey vazia' : 'AppKey disponivel'),
            ),
            ticketSection(),
            appKeySection()
          ],
        ),
      ),
    );
  }

  hideInstructions(
    BuildContext context,
    String appKey,
    String ticket,
    Environment environment,
    ThemeBuilder? themeBuilder,
  ) {
    OitiLiveness2d().checkPermission().then((authorized) => {
          if (authorized)
            {
              OitiLiveness2d()
                  .openDocumentscopy(
                    appKey: appKey,
                    ticket: ticket,
                    themeBuilder: themeBuilder,
                    environment: environment,
                  )
                  .then((result) async => {_onDocSuccess(result)})
                  .onError((error, stackTrace) async => {_onDocError(error)})
                  .catchError((error) async => {_onDocError(error)})
                  .whenComplete(() => _showAlertDialog(
                        context,
                        resultTitle,
                        resultContent,
                      ))
            }
        });
  }

  Widget _liveness2DWidgetOption(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OitiLiveness2d.createLiveness2DWidget(
              appKey: appKey,
              environment: environment,
              onSuccess: (result) => _onLiveness2DSuccess(result),
              onError: (error) => _onLiveness2DError(error),
            ),
          ),
        ).whenComplete(
          () => _showAlertDialog(
            context,
            resultTitle,
            resultContent,
          ),
        ),
        child: Text(title),
      ),
    );
  }

  Widget _hideInstructionWidgetOption(
    BuildContext context,
    String title, {
    ThemeBuilder? themeBuilder,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () => hideInstructions(
          context,
          appKey,
          ticket,
          environment,
          themeBuilder,
        ),
        child: Text(title),
      ),
    );
  }

  Widget _documentscopyWidgetOption(
    BuildContext context,
    String title, {
    ThemeBuilder? themeBuilder,
    Widget? instructionWidget,
    Widget? permissionWidget,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OitiLiveness2d.createDocumentscopyWidget(
              appKey: appKey,
              ticket: ticket,
              environment: environment,
              themeBuilder: themeBuilder,
              onSuccess: (result) => _onDocSuccess(result),
              onError: (error) => _onDocError(error),
              instructionWidget: instructionWidget,
              permissionWidget: permissionWidget,
            ),
          ),
        ).whenComplete(
          () => _showAlertDialog(
            context,
            resultTitle,
            resultContent,
          ),
        ),
        child: Text(title),
      ),
    );
  }

  Widget appKeySection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 45),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'App Key',
        ),
        obscureText: false,
        controller: _controller,
        onSubmitted: (value) => _pasteAppKey(),
      ),
    );
  }

  _pasteAppKey() {
    setState(() => appKey = _controller.text);
    _controller.text = appKey;
  }

  Widget instructionScreen() {
    return DocumentscopyWidget(
      onError: (error) => _onDocError(error),
      onSuccess: (result) => _onDocSuccess(result),
    );
  }

  Widget ticketSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Ticket',
        ),
        obscureText: false,
        controller: _controllerT,
        onSubmitted: (value) => _pasteTicket(),
      ),
    );
  }

  _pasteTicket() {
    setState(() => ticket = _controllerT.text);
    _controllerT.text = ticket;
  }

  Future<void> _showAlertDialog(
      BuildContext context, String resultType, String content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado: $resultType'),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  /// Liveness 3D Callbacks
  _onLiveness2DSuccess(LivenessSuccessResult result) {
    resultTitle = 'Sucesso';
    resultContent =
        'Valid: ${result.valid}\nCodID: ${result.codId}\nCause: ${result.cause}\nProtocol: ${result.protocol}\nScan Result Blob: ${result.scanResultBlob}\n';
  }

  _onLiveness2DError(Object? error) {
    resultTitle = 'Error';
    resultContent = 'Cause: ${error.toString()}';
  }

  _onDocSuccess(String result) {
    resultTitle = 'Sucesso';
    resultContent = result;
  }

  _onDocError(Object? error) {
    resultTitle = 'Error';
    resultContent = 'Cause: ${error.toString()}';
  }

  ThemeBuilder _themeCustomization() {
    return ThemeBuilder()
      ..setCaptureBackgroundColor = "#ff1d0d"
      ..setInstructionBackgroundColor = "#123456"
      ..setInstructionBackButtonColorsIcon = "#789abc"
      ..setInstructionBackButtonColorsBackground = "#def123"
      ..setInstructionBackButtonColorsBorder = "#456789"
      ..setInstructionLoadingColor = "#abc789"
      ..setInstructionBottomSheetColor = "#345678"
      ..setInstructionBottomSheetRadius = 8
      ..setInstructionTitleText = "Your Title"
      ..setInstructionTitleColor = "#234567"
      ..setInstructionTitleFont = "Roboto"
      ..setInstructionCaptionText = "Your Caption"
      ..setInstructionCaptionColor = "#345678"
      ..setInstructionCaptionFont = "Arial"
      ..setInstructionDocOptionBackgroundColor = "#456789"
      ..setInstructionDocOptionTitleText = "Document Option"
      ..setInstructionDocOptionTitleColor = "#567890"
      ..setInstructionDocOptionTitleFont = "Courier New"
      ..setInstructionDocOptionBorderColor = "#678901"
      ..setInstructionDocOptionBorderWidth = 2
      ..setInstructionDocOptionBorderRadius = 4
      ..setInstructionDocOptionBackgroundColor = "#456789"
      ..setInstructionDocOptionTitleText = "Document Option"
      ..setInstructionDocOptionTitleColor = "#567890"
      ..setInstructionDocOptionTitleFont = "Courier New"
      ..setInstructionDocOptionBorderColor = "#678901"
      ..setInstructionDocOptionBorderWidth = 2
      ..setInstructionDocOptionBorderRadius = 4
      ..setInstructionEnvOptionBackgroundColor = "#789012"
      ..setInstructionEnvOptionTitleText = "Environment Option"
      ..setInstructionEnvOptionTitleColor = "#890123"
      ..setInstructionEnvOptionTitleFont = "Helvetica"
      ..setInstructionEnvOptionBorderColor = "#901234"
      ..setInstructionEnvOptionBorderWidth = 3
      ..setInstructionEnvOptionBorderRadius = 6
      ..setInstructionContinueButtonBackgroundColor = "#234567"
      ..setInstructionContinueButtonHighlightedBackgroundColor = "#345678"
      ..setInstructionContinueButtonBorderColor = "#456789"
      ..setInstructionContinueButtonHighlightedBorderColor = "#567890"
      ..setInstructionContinueButtonContentColor = "#678901"
      ..setInstructionContinueButtonHighlightedContentColor = "#789012"
      ..setInstructionContinueButtonTextColor = "#890123"
      ..setInstructionContinueButtonFont = "Arial"
      ..setCaptureInstructionGuideReviewText = "Review"
      ..setLoadingBackgroundColor = "#901234"
      ..setLoadingSpinnerColor = "#012345"
      ..setLoadingSpinnerWidth = 2
      ..setLoadingSpinnerScale = 1
      ..setCaptureBackgroundColor = "#123456"
      ..setTextFront = "Front Text"
      ..setTextBack = "Back Text"
      ..setCaptureInstructionGuideTextFront = "Front Guide Text"
      ..setCaptureInstructionGuideTextBack = "Back Guide Text"
      ..setTextOk = "OK Text"
      ..setCaptureTakeNewPictureButtonText = "Take New Picture"
      ..setCaptureInstructionGuideTextColor = "#345678"
      ..setTextConfirmation = "Confirmation Text"
      ..setBackgroundOkColor = "#456789"
      ..setCaptureBackButtonIcon = "back_icon.png"
      ..setCaptureBackButtonColorsIcon = "#567890"
      ..setCaptureBackButtonColorsBackground = "#678901"
      ..setCaptureBackButtonColorsBorder = "#789012"
      ..setCaptureCloseButtonColorsIcon = "#890123"
      ..setCaptureCloseButtonColorsBackground = "#901234"
      ..setCaptureCloseButtonColorsBorder = "#012345"
      ..setCaptureFrontIndicatorColor = "#123456"
      ..setCaptureFrontIndicatorFocusedStateColor = "#234567"
      ..setCaptureFrontIndicatorUnfocusedStateColor = "#345678"
      ..setCaptureBackIndicatorColor = "#456789"
      ..setCaptureBackIndicatorFocusedStateTextColor = "#567890"
      ..setCaptureBackIndicatorUnfocusedStateTextColor = "#678901"
      ..setCaptureInstructionTextColor = "#789012"
      ..setCapturePreviewBorderColorForCapture = "#234567"
      ..setCapturePreviewBorderColorForUncapturedState = "#345678"
      ..setCaptureCaptureButtonHighlightedStateColorsIcon = "#456789"
      ..setCaptureCaptureButtonHighlightedStateColorsBackground = "#567890"
      ..setCaptureCaptureButtonHighlightedStateColorsBorder = "#678901"
      ..setCaptureCaptureButtonNormalStateColorsIcon = "#789012"
      ..setCaptureCaptureButtonNormalStateColorsBackground = "#890123"
      ..setCaptureCaptureButtonNormalStateColorsBorder = "#901234"
      ..setCaptureCaptureButtonDisabledStateColorsIcon = "#012345"
      ..setCaptureCaptureButtonDisabledStateColorsBackground = "#123456"
      ..setCaptureCaptureButtonDisabledStateColorsBorder = "#234567"
      ..setCaptureBottomSheetShapeColor = "#345678"
      ..setCaptureBottomSheetShapeCornerRadius = 10
      ..setCaptureTakeNewPictureButtonHighlightedStateColorsText = "#456789"
      ..setCaptureTakeNewPictureButtonHighlightedStateColorsBackground =
          "#567890"
      ..setCaptureTakeNewPictureButtonHighlightedStateColorsBorder = "#678901"
      ..setCaptureTakeNewPictureButtonNormalStateColorsText = "#789012"
      ..setCaptureTakeNewPictureButtonNormalStateColorsBackground = "#890123"
      ..setCaptureTakeNewPictureButtonNormalStateColorsBorder = "#901234"
      ..setCaptureTakeNewPictureButtonDisabledStateColorsText = "#012345"
      ..setCaptureTakeNewPictureButtonDisabledStateColorsBackground = "#123456"
      ..setCaptureTakeNewPictureButtonDisabledStateColorsBorder = "#234567"
      ..setCaptureUsePictureButtonText = "Use Picture"
      ..setCaptureUsePictureButtonConfirmationText = "Confirm"
      ..setCaptureUsePictureButtonHighlightedStateColorsText = "#345678"
      ..setCaptureUsePictureButtonHighlightedStateColorsBackground = "#456789"
      ..setCaptureUsePictureButtonHighlightedStateColorsBorder = "#567890"
      ..setCaptureUsePictureButtonNormalStateColorsText = "#678901"
      ..setCaptureUsePictureButtonNormalStateColorsBackground = "#789012"
      ..setCaptureUsePictureButtonNormalStateColorsBorder = "#890123"
      ..setCaptureUsePictureButtonDisabledStateColorsText = "#901234"
      ..setCaptureUsePictureButtonDisabledStateColorsBackground = "#012345"
      ..setCaptureUsePictureButtonDisabledStateColorsBorder = "#123456"
      ..setResultBackgroundColorSuccess = "#234567"
      ..setResultBackgroundColorError = "#345678"
      ..setResultBackgroundColorTryAgain = "#456789"
      ..setResultMessageSuccess = "Success Message"
      ..setResultMessageError = "Error Message"
      ..setResultMessageTryAgain = "Try Again Message"
      ..setResultMessageColorSuccess = "#567890"
      ..setResultMessageColorError = "#678901"
      ..setResultMessageColorTryAgain = "#789012"
      ..setResultTryAgainButtonText = "Try Again"
      ..setResultTryAgainButtonHighlightedStateColorsText = "#890123"
      ..setResultTryAgainButtonHighlightedStateColorsBackground = "#901234"
      ..setResultTryAgainButtonHighlightedStateColorsBorder = "#012345"
      ..setResultTryAgainButtonNormalStateColorsText = "#123456"
      ..setResultTryAgainButtonNormalStateColorsBackground = "#234567"
      ..setResultTryAgainButtonNormalStateColorsBorder = "#345678";
  }
}
