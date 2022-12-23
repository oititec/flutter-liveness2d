import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oiti_liveness2d/oiti_liveness2d_method_channel.dart';

void main() {
  MethodChannelOitiLiveness2d platform = MethodChannelOitiLiveness2d();
  const MethodChannel channel = MethodChannel('oiti_liveness2d');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
