import 'package:flutter_test/flutter_test.dart';
import 'package:oiti_liveness2d/oiti_liveness2d.dart';
import 'package:oiti_liveness2d/oiti_liveness2d_platform_interface.dart';
import 'package:oiti_liveness2d/oiti_liveness2d_method_channel.dart';
import 'package:oiti_liveness2d/utils.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOitiLiveness2dPlatform
    with MockPlatformInterfaceMixin
    implements OitiLiveness2dPlatform {
  @override
  Future<MethodResponse> openDocumentscopy(
          String appKey, Environment environment) =>
      Future.value(MethodResponse.success);

  @override
  Future<MethodResponse> openFaceCaptcha(
          String appKey, Environment environment) =>
      Future.value(MethodResponse.success);
}

void main() {
  final OitiLiveness2dPlatform initialPlatform =
      OitiLiveness2dPlatform.instance;

  test('$MethodChannelOitiLiveness2d is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOitiLiveness2d>());
  });

  test('openFaceCaptcha', () async {
    OitiLiveness2d oitiLiveness2dPlugin = OitiLiveness2d();
    MockOitiLiveness2dPlatform fakePlatform = MockOitiLiveness2dPlatform();
    OitiLiveness2dPlatform.instance = fakePlatform;

    expect(await oitiLiveness2dPlugin.openFaceCaptcha('appkey-123', Environment.hml), MethodResponse.success);
  });

  test('openDocumentscopy', () async {
    OitiLiveness2d oitiLiveness2dPlugin = OitiLiveness2d();
    MockOitiLiveness2dPlatform fakePlatform = MockOitiLiveness2dPlatform();
    OitiLiveness2dPlatform.instance = fakePlatform;

    expect(await oitiLiveness2dPlugin.openDocumentscopy('appkey-123', Environment.hml), MethodResponse.success);
  });
}
