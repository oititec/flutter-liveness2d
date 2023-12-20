import 'package:flutter/material.dart';
import 'package:oiti_liveness2d/hooks/globals.dart' as globals;
import 'package:oiti_liveness2d/oiti_liveness2d.dart';
import 'package:oiti_liveness2d/widgets/screens/documentscopy_screen.dart';

class DocumentscopyWidget extends StatelessWidget {
  final String appKey;
  final String ticket;
  final Environment environment;
  final ThemeBuilder? themeBuilder;
  final Function(DocSuccessResult result) onSuccess;
  final Function(Object? error) onError;
  final Widget? instructionWidget;
  final Widget? permissionWidget;

  const DocumentscopyWidget({
    Key? key,
    required this.appKey,
    required this.ticket,
    required this.environment,
    this.themeBuilder,
    required this.onSuccess,
    required this.onError,
    this.instructionWidget,
    this.permissionWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    startGlobal();
    return verifyInstructionScreen();
  }

  verifyInstructionScreen() {
    if (globals.instructionWidget != null) {
      return globals.instructionWidget;
    } else {
      return DocumentscopyWidgetScreen(continueAction: continueAction);
    }
  }

  startGlobal() async {
    await setVariables();
  }

  setVariables() async {
    globals.appKey = appKey;
    globals.ticket = ticket;
    globals.themeBuilder = themeBuilder;
    globals.instructionWidget = instructionWidget;
    globals.permissionWidget = permissionWidget;
  }

  void continueAction(BuildContext context) {
    DocumentsCopyActions(
      onSuccess: (result) => _onDocSuccess(result),
      onError: (error) => _onDocError(error),
    ).onContinue(context);
  }

  _onDocSuccess(DocSuccessResult result) {
    onSuccess(result);
  }

  _onDocError(Object? error) {
    onError(error);
  }
}
