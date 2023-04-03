import 'package:flutter_test/flutter_test.dart';
import 'package:qualaroo_flutter/qualaroo_flutter.dart';
import 'package:qualaroo_flutter/qualaroo_flutter_platform_interface.dart';
import 'package:qualaroo_flutter/qualaroo_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQualarooFlutterPlatform
    with MockPlatformInterfaceMixin
    implements QualarooFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final QualarooFlutterPlatform initialPlatform = QualarooFlutterPlatform.instance;

  test('$MethodChannelQualarooFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQualarooFlutter>());
  });

  test('getPlatformVersion', () async {
    QualarooFlutter qualarooFlutterPlugin = QualarooFlutter();
    MockQualarooFlutterPlatform fakePlatform = MockQualarooFlutterPlatform();
    QualarooFlutterPlatform.instance = fakePlatform;

    expect(await qualarooFlutterPlugin.getPlatformVersion(), '42');
  });
}
