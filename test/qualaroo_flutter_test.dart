import 'package:flutter_test/flutter_test.dart';
import 'package:qualaroo_flutter_sdk/qualaroo_flutter.dart';
import 'package:qualaroo_flutter_sdk/qualaroo_flutter_platform_interface.dart';
import 'package:qualaroo_flutter_sdk/qualaroo_flutter_method_channel.dart';

import 'mocks/mock_qualaroo_platform.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('QualarooFlutterPlatform', () {
    test('default instance is MethodChannelQualarooFlutter', () {
      // When: Accessing the default platform instance
      final instance = QualarooFlutterPlatform.instance;

      // Then: It should be the method channel implementation
      expect(instance, isInstanceOf<MethodChannelQualarooFlutter>());
    });

    test('can be overridden with mock for testing', () {
      // Given: A mock platform
      final mock = MockQualarooFlutterPlatform();

      // When: Setting the platform instance
      QualarooFlutterPlatform.instance = mock;

      // Then: The instance should be the mock
      expect(QualarooFlutterPlatform.instance, same(mock));

      // Cleanup
      QualarooFlutterPlatform.instance = MethodChannelQualarooFlutter();
    });
  });

  group('QualarooFlutter', () {
    late QualarooFlutter plugin;
    late MockQualarooFlutterPlatform mockPlatform;

    setUp(() {
      plugin = QualarooFlutter();
      mockPlatform = MockQualarooFlutterPlatform();
      QualarooFlutterPlatform.instance = mockPlatform;
    });

    tearDown(() {
      mockPlatform.reset();
      QualarooFlutterPlatform.instance = MethodChannelQualarooFlutter();
    });

    test('delegates initializeQualarooSdk to platform', () async {
      // Given: A plugin instance with a mock platform

      // When: Calling initializeQualarooSdk
      await plugin.initializeQualarooSdk('test-api-key');

      // Then: The platform method should be called with correct arguments
      expect(mockPlatform.methodCalls.length, 1);
      expect(mockPlatform.methodCalls.first.method, 'initializeQualarooSdk');
      expect(mockPlatform.methodCalls.first.arguments, 'test-api-key');
    });

    test('delegates showSurvey to platform', () async {
      // Given: A plugin instance with a mock platform

      // When: Calling showSurvey
      await plugin.showSurvey('survey-alias');

      // Then: The platform method should be called with correct arguments
      expect(mockPlatform.methodCalls.length, 1);
      expect(mockPlatform.methodCalls.first.method, 'showSurvey');
      expect(mockPlatform.methodCalls.first.arguments, 'survey-alias');
    });

    test('delegates setUserId to platform', () async {
      // Given: A plugin instance with a mock platform

      // When: Calling setUserId
      await plugin.setUserId('user-123');

      // Then: The platform method should be called with correct arguments
      expect(mockPlatform.methodCalls.length, 1);
      expect(mockPlatform.methodCalls.first.method, 'setUserId');
      expect(mockPlatform.methodCalls.first.arguments, 'user-123');
    });

    test('delegates setUserProperty to platform', () async {
      // Given: A plugin instance with a mock platform

      // When: Calling setUserProperty
      await plugin.setUserProperty('key', 'value');

      // Then: The platform method should be called with correct arguments
      expect(mockPlatform.methodCalls.length, 1);
      expect(mockPlatform.methodCalls.first.method, 'setUserProperty');
      final args = mockPlatform.methodCalls.first.arguments;
      expect(args['key'], 'key');
      expect(args['value'], 'value');
    });

    test('delegates removeUserProperty to platform', () async {
      // Given: A plugin instance with a mock platform

      // When: Calling removeUserProperty
      await plugin.removeUserProperty('key');

      // Then: The platform method should be called with correct arguments
      expect(mockPlatform.methodCalls.length, 1);
      expect(mockPlatform.methodCalls.first.method, 'removeUserProperty');
      expect(mockPlatform.methodCalls.first.arguments, 'key');
    });

    test('delegates setPreferredLanguage to platform', () async {
      // Given: A plugin instance with a mock platform

      // When: Calling setPreferredLanguage
      await plugin.setPreferredLanguage('en-US');

      // Then: The platform method should be called with correct arguments
      expect(mockPlatform.methodCalls.length, 1);
      expect(mockPlatform.methodCalls.first.method, 'setPreferredLanguage');
      expect(mockPlatform.methodCalls.first.arguments, 'en-US');
    });

    test('typical usage workflow', () async {
      // Given: A plugin instance with a mock platform

      // When: Performing a typical SDK workflow
      await plugin.initializeQualarooSdk('api-key');
      await plugin.setUserId('user-456');
      await plugin.setUserProperty('subscription', 'premium');
      await plugin.setPreferredLanguage('en');
      await plugin.showSurvey('feedback-survey');

      // Then: All platform methods should be called in the correct order
      expect(mockPlatform.methodCalls.length, 5);
      expect(mockPlatform.methodCalls[0].method, 'initializeQualarooSdk');
      expect(mockPlatform.methodCalls[1].method, 'setUserId');
      expect(mockPlatform.methodCalls[2].method, 'setUserProperty');
      expect(mockPlatform.methodCalls[3].method, 'setPreferredLanguage');
      expect(mockPlatform.methodCalls[4].method, 'showSurvey');
    });
  });
}
