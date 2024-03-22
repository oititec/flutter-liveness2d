import 'package:oiti_liveness2d/common/doccore_success_result.dart';
import 'package:oiti_liveness2d/hooks/globals.dart' as globals;

class DocumentsCopyResult {
  final DocCoreSuccessResult? result;
  final Object? error;

  DocumentsCopyResult({
    this.result,
    this.error,
  });

  onDocSuccess() {
    globals.onDocSuccess = result;
  }

  onDocError() {
    globals.onDocError = error;
  }
}
