import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:qualaroo_flutter_sdk/qualaroo_flutter_platform_interface.dart';

/// Mock implementation of QualarooFlutterPlatform for testing
class MockQualarooFlutterPlatform
    with MockPlatformInterfaceMixin
    implements QualarooFlutterPlatform {
  // Track method calls for verification
  final List<MethodCall> methodCalls = [];

  @override
  Future<void> initializeQualarooSdk(apiKey) async {
    methodCalls.add(MethodCall('initializeQualarooSdk', apiKey));
  }

  @override
  Future<void> showSurvey(aliasName) async {
    methodCalls.add(MethodCall('showSurvey', aliasName));
  }

  @override
  Future<void> setUserId(userId) async {
    methodCalls.add(MethodCall('setUserId', userId));
  }

  @override
  Future<void> setUserProperty(key, value) async {
    methodCalls.add(
      MethodCall('setUserProperty', {'key': key, 'value': value}),
    );
  }

  @override
  Future<void> removeUserProperty(key) async {
    methodCalls.add(MethodCall('removeUserProperty', key));
  }

  @override
  Future<void> setPreferredLanguage(language) async {
    methodCalls.add(MethodCall('setPreferredLanguage', language));
  }

  void reset() {
    methodCalls.clear();
  }
}

/// Helper class to track method calls
class MethodCall {
  final String method;
  final dynamic arguments;

  MethodCall(this.method, this.arguments);

  @override
  String toString() => 'MethodCall($method, $arguments)';
}

/// Invalid platform implementation without MockPlatformInterfaceMixin
/// Used to test token verification
class InvalidQualarooFlutterPlatform extends QualarooFlutterPlatform {
  @override
  Future<void> initializeQualarooSdk(apiKey) async {}

  @override
  Future<void> showSurvey(aliasName) async {}

  @override
  Future<void> setUserId(userId) async {}

  @override
  Future<void> setUserProperty(key, value) async {}

  @override
  Future<void> removeUserProperty(key) async {}

  @override
  Future<void> setPreferredLanguage(language) async {}
}
