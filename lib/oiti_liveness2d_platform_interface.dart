import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'oiti_liveness2d_method_channel.dart';

abstract class OitiLiveness2dPlatform extends PlatformInterface {
  /// Constructs a OitiLiveness2dPlatform.
  OitiLiveness2dPlatform() : super(token: _token);

  static final Object _token = Object();

  static OitiLiveness2dPlatform _instance = MethodChannelOitiLiveness2d();

  static OitiLiveness2dPlatform get instance => _instance;

  static set instance(OitiLiveness2dPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future startliveness2d(String? baseUrl, String? appKey, String environment) {
    throw UnimplementedError('startLiveness2d() has not been implemented.');
  }

  Future startDocumentscopy(String? baseUrl, String? appKey, String? ticket,
      Object? themeBuilder, String environment) {
    throw UnimplementedError('startDocumentscopy() has not been implemented.');
  }

  Future checkPermission() {
    throw UnimplementedError('checkPermission() has not been implemented.');
  }

  Future askPermission() {
    throw UnimplementedError('askPermission() has not been implemented.');
  }

  Future<void> openSettings() {
    throw UnimplementedError('openSettings() has not been implemented.');
  }
}
