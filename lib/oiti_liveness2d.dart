import 'package:flutter/material.dart';

import 'utils.dart';
import 'oiti_liveness2d_platform_interface.dart';

class OitiLiveness2d {
  Future<MethodResponse> openFaceCaptcha(
      String appKey, Environment environment) {
    return OitiLiveness2dPlatform.instance.openFaceCaptcha(appKey, environment);
  }

  Future<MethodResponse> openDocumentscopy(
      String? ticket, String appKey, Environment environment) {
    return OitiLiveness2dPlatform.instance
        .openDocumentscopy(ticket, appKey, environment);
  }

  Future<MethodResponse> recordEvent(String appKey, String event) {
    return OitiLiveness2dPlatform.instance.recordEvent(appKey, event);
  }
}

class DocumentscopyEvents {
  const DocumentscopyEvents();

  /* System events */
  static const systemhasTicket = "SYSTEM_DC_hasTicket";
  static const systemHasAppkey = "SYSTEM_DC_hasAppkey";

  /* State events */
  static const stateInstructionContinue = "STATE_DC_instructionContinue";
  static const statePermissionView = "STATE_DC_permissionView";

  /* Action events */
  static const actionBackBtnInstructionContinue =
      "ACTION_DC_backBtnInstructionContinue";
  static const actionInstructionContinueCNH =
      "ACTION_DC_instructionContinueCNH";
  static const actionInstructionContinueRG = "ACTION_DC_instructionContinueRG";
  static const actionBackBtnPermissionView = "ACTION_DC_backBtnPermissionView";
  static const actionBtnPermissionVerify = "ACTION_DC_btnPermissionVerify";
  static const actionBtnGoToSettingsCameraPermission =
      "ACTION_DC_btnGoToSettingsCameraPermission";
  static const actionBtnCloseDialogCameraPermission =
      "ACTION_DC_btnCloseDialogCameraPermission";
}

class DocumentscopyWidget extends StatelessWidget {
  DocumentscopyWidget({
    super.key, 
    required this.appKey
  });

  final channel = OitiLiveness2d();
  final String appKey;

  @override
  Widget build(BuildContext context) {
    channel.recordEvent(appKey, DocumentscopyEvents.stateInstructionContinue);
    channel.recordEvent(appKey, DocumentscopyEvents.systemHasAppkey);

    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    channel.recordEvent(appKey,
                        DocumentscopyEvents.actionBackBtnInstructionContinue);
                    Navigator.pop(context);
                  },
                  child: const Text("<"),
                )),
            const Spacer()
          ],
        ),
        const Spacer(),
        Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 30.0),
            child: ElevatedButton(
              onPressed: () {
                channel.recordEvent(
                    appKey, DocumentscopyEvents.actionInstructionContinueCNH);
                channel.openDocumentscopy(null, appKey, Environment.hml);
              },
              child: const Text("CNH"),
            )),
        Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 30.0),
            child: ElevatedButton(
              onPressed: () {
                channel.recordEvent(
                    appKey, DocumentscopyEvents.actionInstructionContinueRG);
                channel.openDocumentscopy(null, appKey, Environment.hml);
              },
              child: const Text("RG"),
            )),
      ],
    ));
  }
}
