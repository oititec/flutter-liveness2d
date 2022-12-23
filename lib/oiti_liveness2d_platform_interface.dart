import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'oiti_liveness2d_method_channel.dart';

abstract class OitiLiveness2dPlatform extends PlatformInterface {
  /// Constructs a OitiLiveness2dPlatform.
  OitiLiveness2dPlatform() : super(token: _token);

  static final Object _token = Object();

  static OitiLiveness2dPlatform _instance = MethodChannelOitiLiveness2d();

  /// The default instance of [OitiLiveness2dPlatform] to use.
  ///
  /// Defaults to [MethodChannelOitiLiveness2d].
  static OitiLiveness2dPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OitiLiveness2dPlatform] when
  /// they register themselves.
  static set instance(OitiLiveness2dPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
