import 'package:flutter/material.dart';
import 'package:oiti_liveness2d/actions/documestscopy_result.dart';

class GlobalActions {
  onBackInstruction(BuildContext context) {
    print("User cancelled the journey");
    DocumentsCopyResult(error: null).onDocError();
  }
}
