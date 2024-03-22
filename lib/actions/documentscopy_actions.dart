import 'package:flutter/material.dart';
import 'package:oiti_liveness2d/actions/documestscopy_result.dart';
import 'package:oiti_liveness2d/common/doccore_success_result.dart';
import 'package:oiti_liveness2d/hooks/globals.dart' as globals;
import 'package:oiti_liveness2d/oiti_liveness2d.dart';
import 'package:oiti_liveness2d/widgets/screens/camera_permission.dart';

class DocumentsCopyActions {
  final OitiLiveness2d _channel = OitiLiveness2d();
  final Function(DocCoreSuccessResult result)? onSuccess;
  final Function(Object? error)? onError;

  DocumentsCopyActions({
    this.onSuccess,
    this.onError,
  });

  onContinue(BuildContext context) {
    _channel.checkPermission().then((authorized) => {
          if (authorized)
            {
              _channel
                  .openDocumentscopy(
                    appKey: globals.appKey,
                    ticket: globals.ticket,
                    themeBuilder: globals.themeBuilder,
                    baseUrl: "",
                    environment: globals.environment,
                  )
                  .then((result) async => {
                        await DocumentsCopyResult(result: result)
                            .onDocSuccess(),
                        onSuccess!(globals.onDocSuccess ?? result)
                      })
                  .onError((error, stackTrace) async => {
                        await DocumentsCopyResult(error: error).onDocError(),
                        onError!(globals.onDocError ?? error)
                      })
                  .catchError((error) async => {
                        await DocumentsCopyResult(error: error).onDocError(),
                        onError!(globals.onDocError ?? error)
                      })
                  .whenComplete(() => Navigator.pop(context))
            }
          else
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => verifyPermissionScreen(),
                ),
              )
            }
        });
  }

  verifyPermissionScreen() {
    if (globals.permissionWidget != null) {
      return globals.permissionWidget;
    } else {
      return CameraPermissionWidget();
    }
  }
}
