import 'package:flutter_test/flutter_test.dart';
import 'package:qualaroo_flutter/qualaroo_flutter_platform_interface.dart';
import 'package:qualaroo_flutter/qualaroo_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQualarooFlutterPlatform
    with MockPlatformInterfaceMixin
    implements QualarooFlutterPlatform {
  @override
  Future<void> initializeQualarooSdk(apiKey) {
    // ignore: todo
    // TODO: implement initializeQualarooSdk
    throw UnimplementedError();
  }

  @override
  Future<void> removeUserProperty(key) {
    // ignore: todo
    // TODO: implement removeUserProperty
    throw UnimplementedError();
  }

  @override
  Future<void> setPreferredLanguage(language) {
    // ignore: todo
    // TODO: implement setPreferredLanguage
    throw UnimplementedError();
  }

  @override
  Future<void> setUserId(userId) {
    // ignore: todo
    // TODO: implement setUserId
    throw UnimplementedError();
  }

  @override
  Future<void> setUserProperty(key, value) {
    // ignore: todo
    // TODO: implement setUserProperty
    throw UnimplementedError();
  }

  @override
  Future<void> showSurvey(aliasName) {
    // ignore: todo
    // TODO: implement showSurvey
    throw UnimplementedError();
  }
}

void main() {
  final QualarooFlutterPlatform initialPlatform =
      QualarooFlutterPlatform.instance;

  test('$MethodChannelQualarooFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQualarooFlutter>());
  });
}
