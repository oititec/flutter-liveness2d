
import 'oiti_liveness2d_platform_interface.dart';

class OitiLiveness2d {
  Future<String?> getPlatformVersion() {
    return OitiLiveness2dPlatform.instance.getPlatformVersion();
  }
}
