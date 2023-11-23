import 'package:oiti_liveness2d/hooks/globals.dart' as globals;
import 'package:oiti_liveness2d/oiti_liveness2d.dart';

class DocumentsCopyResult {
  final DocSuccessResult? result;
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
