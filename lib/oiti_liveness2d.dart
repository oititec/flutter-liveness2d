import 'package:flutter/material.dart';

import 'utils.dart';
import 'oiti_liveness2d_platform_interface.dart';

class OitiLiveness2d {
  Future<MethodResponse> openFaceCaptcha(
      String appKey, Environment environment) {
    return OitiLiveness2dPlatform.instance.openFaceCaptcha(appKey, environment);
  }

  Future<MethodResponse> openDocumentscopy(
      String appKey, Environment environment) {
    return OitiLiveness2dPlatform.instance
        .openDocumentscopy(appKey, environment);
  }
}
