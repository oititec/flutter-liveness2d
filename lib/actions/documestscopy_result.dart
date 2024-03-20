import 'package:oiti_liveness2d/hooks/globals.dart' as globals;

class DocumentsCopyResult {
  final String? result;
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
