import 'oiti_liveness2d_platform_interface.dart';

class OitiLiveness2d {
  Future<String?> getPlatformVersion() {
    return OitiLiveness2dPlatform.instance.getPlatformVersion();
  }

  static Future startliveness2d(String? baseUrl, String? appKey) async {
    return await OitiLiveness2dPlatform.instance
        .startliveness2d(baseUrl, appKey);
  }

  static Future startdocumentscopy(String? baseUrl, String? appKey) async {
    return await OitiLiveness2dPlatform.instance
        .startdocumentscopy(baseUrl, appKey);
  }
}
