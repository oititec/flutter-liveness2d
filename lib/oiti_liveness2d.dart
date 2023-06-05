import 'package:flutter/material.dart';

import 'utils.dart';
import 'oiti_liveness2d_platform_interface.dart';

class OitiLiveness2d {
  Future<MethodResponse> openFaceCaptcha(String appKey, Environment environment) {
    return OitiLiveness2dPlatform.instance.openFaceCaptcha(appKey, environment);
  }

  Future<MethodResponse> openDocumentscopy(String appKey, Environment environment) {
    return OitiLiveness2dPlatform.instance.openDocumentscopy(appKey, environment);
  }

  Future<MethodResponse> recordEvent(String event) {
    return OitiLiveness2dPlatform.instance.recordEvent(event);
  }
}

class DocumentscopyWidget extends StatelessWidget {
  const DocumentscopyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('DocumentscopyWidget'),
      ),
    );
  }
}
