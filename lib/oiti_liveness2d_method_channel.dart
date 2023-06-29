import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'utils.dart';
import 'oiti_liveness2d_platform_interface.dart';

/// An implementation of [OitiLiveness2dPlatform] that uses method channels.
class MethodChannelOitiLiveness2d extends OitiLiveness2dPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('oiti_liveness2d');

  @override
  Future<MethodResponse> openFaceCaptcha(
      String appKey, Environment environment) async {
    final response = await methodChannel.invokeMethod<String>(
        'oiti.request.open_facecaptcha',
        {'appkey': appKey, 'env': environment.string});

    return MethodResponse.getResponse(response);
  }

  @override
  Future<MethodResponse> openDocumentscopy(
      String appKey, Environment environment) async {
    Map<String, String> arguments = {
      'appkey': appKey,
      'env': environment.string
    };
    final response = await methodChannel.invokeMethod<String>(
      'oiti.request.open_documentscopy', arguments
    );

    return MethodResponse.getResponse(response);
  }
}
