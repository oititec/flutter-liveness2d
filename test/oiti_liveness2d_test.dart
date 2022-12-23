import 'package:flutter_test/flutter_test.dart';
import 'package:oiti_liveness2d/oiti_liveness2d.dart';
import 'package:oiti_liveness2d/oiti_liveness2d_platform_interface.dart';
import 'package:oiti_liveness2d/oiti_liveness2d_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOitiLiveness2dPlatform
    with MockPlatformInterfaceMixin
    implements OitiLiveness2dPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final OitiLiveness2dPlatform initialPlatform = OitiLiveness2dPlatform.instance;

  test('$MethodChannelOitiLiveness2d is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOitiLiveness2d>());
  });

  test('getPlatformVersion', () async {
    OitiLiveness2d oitiLiveness2dPlugin = OitiLiveness2d();
    MockOitiLiveness2dPlatform fakePlatform = MockOitiLiveness2dPlatform();
    OitiLiveness2dPlatform.instance = fakePlatform;

    expect(await oitiLiveness2dPlugin.getPlatformVersion(), '42');
  });
}
