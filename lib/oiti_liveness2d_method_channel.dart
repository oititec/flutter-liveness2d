import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'oiti_liveness2d_platform_interface.dart';

/// An implementation of [OitiLiveness2dPlatform] that uses method channels.
class MethodChannelOitiLiveness2d extends OitiLiveness2dPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('oiti_liveness2d');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future startliveness2d(String? baseUrl, String? appKey) async {
    final result = await methodChannel.invokeMapMethod(
      'OITI.startliveness2d',
      {'appKey': appKey, 'baseUrl': baseUrl},
    );

    return result;
  }

  @override
  Future startdocumentscopy(String? baseUrl, String? appKey) async {
    final result = await methodChannel.invokeMapMethod(
      'OITI.startdocumentscopy',
      {'appKey': appKey, 'baseUrl': baseUrl},
    );

    return result;
  }
}
