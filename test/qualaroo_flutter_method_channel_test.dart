import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qualaroo_flutter_sdk/qualaroo_flutter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MethodChannelQualarooFlutter platform;
  late List<MethodCall> methodCallLog;

  const MethodChannel channel = MethodChannel('qualaroo_flutter_sdk');

  setUp(() {
    platform = MethodChannelQualarooFlutter();
    methodCallLog = [];

    // Mock the method channel to capture calls
    final instance = TestDefaultBinaryMessengerBinding.instance;
    instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        methodCallLog.add(methodCall);
        return null;
      },
    );
  });

  tearDown(() {
    final instance = TestDefaultBinaryMessengerBinding.instance;
    instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
    methodCallLog.clear();
  });

  group('MethodChannelQualarooFlutter', () {
    test('uses the correct channel name', () {
      // When: Accessing the channel name
      final channelName = platform.methodChannel.name;

      // Then: It should be 'qualaroo_flutter_sdk'
      expect(channelName, 'qualaroo_flutter_sdk');
    });

    group('initializeQualarooSdk', () {
      test('invokes correct method on channel with string API key', () async {
        // Given: A string API key
        const apiKey = 'test-api-key';

        // When: Calling initializeQualarooSdk
        await platform.initializeQualarooSdk(apiKey);

        // Then: The correct method should be invoked with the API key
        expect(methodCallLog.length, 1);
        expect(methodCallLog.first.method, 'initializeQualarooSdk');
        expect(methodCallLog.first.arguments, apiKey);
      });

      test('handles integer API key', () async {
        // Given: An integer API key
        const apiKey = 12345;

        // When: Calling initializeQualarooSdk
        await platform.initializeQualarooSdk(apiKey);

        // Then: The integer should be passed correctly
        expect(methodCallLog.first.arguments, apiKey);
      });

      test('handles null API key', () async {
        // Given: A null API key

        // When: Calling initializeQualarooSdk with null
        await platform.initializeQualarooSdk(null);

        // Then: Null should be passed correctly
        expect(methodCallLog.first.arguments, null);
      });
    });

    group('showSurvey', () {
      test('invokes correct method on channel with survey alias', () async {
        // Given: A survey alias
        const aliasName = 'feedback-survey';

        // When: Calling showSurvey
        await platform.showSurvey(aliasName);

        // Then: The correct method should be invoked with the alias
        expect(methodCallLog.length, 1);
        expect(methodCallLog.first.method, 'showSurvey');
        expect(methodCallLog.first.arguments, aliasName);
      });

      test('handles empty string alias', () async {
        // Given: An empty string alias

        // When: Calling showSurvey with empty string
        await platform.showSurvey('');

        // Then: Empty string should be passed correctly
        expect(methodCallLog.first.arguments, '');
      });

      test('handles null alias', () async {
        // Given: A null alias

        // When: Calling showSurvey with null
        await platform.showSurvey(null);

        // Then: Null should be passed correctly
        expect(methodCallLog.first.arguments, null);
      });
    });

    group('setUserId', () {
      test('invokes correct method on channel with user ID', () async {
        // Given: A user ID
        const userId = 'user-123';

        // When: Calling setUserId
        await platform.setUserId(userId);

        // Then: The correct method should be invoked with the user ID
        expect(methodCallLog.length, 1);
        expect(methodCallLog.first.method, 'setUserId');
        expect(methodCallLog.first.arguments, userId);
      });

      test('handles email as user ID', () async {
        // Given: An email address as user ID
        const userId = 'john.doe@example.com';

        // When: Calling setUserId
        await platform.setUserId(userId);

        // Then: Email should be passed correctly
        expect(methodCallLog.first.arguments, userId);
      });

      test('handles integer user ID', () async {
        // Given: An integer user ID
        const userId = 98765;

        // When: Calling setUserId
        await platform.setUserId(userId);

        // Then: Integer should be passed correctly
        expect(methodCallLog.first.arguments, userId);
      });

      test('handles null user ID', () async {
        // Given: A null user ID

        // When: Calling setUserId with null
        await platform.setUserId(null);

        // Then: Null should be passed correctly
        expect(methodCallLog.first.arguments, null);
      });
    });

    group('setUserProperty', () {
      test('invokes correct method with key-value map', () async {
        // Given: A property key and value
        const key = 'subscription';
        const value = 'premium';

        // When: Calling setUserProperty
        await platform.setUserProperty(key, value);

        // Then: The correct method should be invoked with a map structure
        expect(methodCallLog.length, 1);
        expect(methodCallLog.first.method, 'setUserProperty');
        expect(methodCallLog.first.arguments, isA<Map>());

        final args = methodCallLog.first.arguments as Map;
        expect(args['key'], key);
        expect(args['value'], value);
      });

      test('handles string value', () async {
        // Given: A string property value

        // When: Setting a string property
        await platform.setUserProperty('name', 'John Doe');

        // Then: String value should be in the map
        final args = methodCallLog.first.arguments as Map;
        expect(args['value'], 'John Doe');
      });

      test('handles integer value', () async {
        // Given: An integer property value

        // When: Setting an integer property
        await platform.setUserProperty('age', 30);

        // Then: Integer value should be in the map
        final args = methodCallLog.first.arguments as Map;
        expect(args['value'], 30);
      });

      test('handles boolean value', () async {
        // Given: A boolean property value

        // When: Setting a boolean property
        await platform.setUserProperty('is_premium', true);

        // Then: Boolean value should be in the map
        final args = methodCallLog.first.arguments as Map;
        expect(args['value'], true);
      });

      test('handles double value', () async {
        // Given: A double property value

        // When: Setting a double property
        await platform.setUserProperty('rating', 4.5);

        // Then: Double value should be in the map
        final args = methodCallLog.first.arguments as Map;
        expect(args['value'], 4.5);
      });

      test('handles null key', () async {
        // Given: A null key

        // When: Setting a property with null key
        await platform.setUserProperty(null, 'value');

        // Then: Null key should be in the map
        final args = methodCallLog.first.arguments as Map;
        expect(args['key'], null);
      });

      test('handles null value', () async {
        // Given: A null value

        // When: Setting a property with null value
        await platform.setUserProperty('key', null);

        // Then: Null value should be in the map
        final args = methodCallLog.first.arguments as Map;
        expect(args['value'], null);
      });

      test('creates correct map structure', () async {
        // Given: A property key and value

        // When: Setting a user property
        await platform.setUserProperty('test_key', 'test_value');

        // Then: The map should contain exactly 'key' and 'value' fields
        final args = methodCallLog.first.arguments as Map;
        expect(args.keys, containsAll(['key', 'value']));
        expect(args.keys.length, 2);
      });
    });

    group('removeUserProperty', () {
      test('invokes correct method on channel with property key', () async {
        // Given: A property key to remove
        const key = 'old_property';

        // When: Calling removeUserProperty
        await platform.removeUserProperty(key);

        // Then: The correct method should be invoked with the key
        expect(methodCallLog.length, 1);
        expect(methodCallLog.first.method, 'removeProperty');
        expect(methodCallLog.first.arguments, key);
      });

      test('handles null key', () async {
        // Given: A null key

        // When: Calling removeUserProperty with null
        await platform.removeUserProperty(null);

        // Then: Null should be passed correctly
        expect(methodCallLog.first.arguments, null);
      });
    });

    group('setPreferredLanguage', () {
      test('invokes correct method on channel with language code', () async {
        // Given: A language code
        const language = 'en-US';

        // When: Calling setPreferredLanguage
        await platform.setPreferredLanguage(language);

        // Then: The correct method should be invoked with the language code
        expect(methodCallLog.length, 1);
        expect(methodCallLog.first.method, 'setPreferredLanguage');
        expect(methodCallLog.first.arguments, language);
      });

      test('handles various language codes', () async {
        // Given: Different language code formats
        final languages = ['en', 'en-US', 'fr-FR', 'es', 'de-DE', 'ja-JP'];

        for (final lang in languages) {
          // When: Setting each language
          methodCallLog.clear();
          await platform.setPreferredLanguage(lang);

          // Then: Each should be passed correctly
          expect(methodCallLog.first.arguments, lang);
        }
      });

      test('handles null language', () async {
        // Given: A null language

        // When: Calling setPreferredLanguage with null
        await platform.setPreferredLanguage(null);

        // Then: Null should be passed correctly
        expect(methodCallLog.first.arguments, null);
      });
    });

    group('error handling', () {
      test('propagates PlatformException from native', () async {
        // Given: A mock that throws PlatformException
        final instance = TestDefaultBinaryMessengerBinding.instance;
        instance.defaultBinaryMessenger.setMockMethodCallHandler(
          channel,
          (MethodCall methodCall) async {
            throw PlatformException(code: 'ERROR', message: 'Test error');
          },
        );

        // When: Calling a method
        // Then: The PlatformException should be propagated
        expect(
          () => platform.initializeQualarooSdk('key'),
          throwsA(isA<PlatformException>()),
        );
      });

      test('propagates MissingPluginException', () async {
        // Given: A mock that throws MissingPluginException
        final instance = TestDefaultBinaryMessengerBinding.instance;
        instance.defaultBinaryMessenger.setMockMethodCallHandler(
          channel,
          (MethodCall methodCall) async {
            throw MissingPluginException();
          },
        );

        // When: Calling a method
        // Then: The MissingPluginException should be propagated
        expect(
          () => platform.showSurvey('survey'),
          throwsA(isA<MissingPluginException>()),
        );
      });

      test('includes exception details from native', () async {
        // Given: A mock that throws detailed PlatformException
        final instance = TestDefaultBinaryMessengerBinding.instance;
        instance.defaultBinaryMessenger.setMockMethodCallHandler(
          channel,
          (MethodCall methodCall) async {
            throw PlatformException(
              code: 'INVALID_API_KEY',
              message: 'The provided API key is invalid',
              details: {'apiKey': methodCall.arguments},
            );
          },
        );

        // When: Calling initializeQualarooSdk
        // Then: The exception should contain all details
        try {
          await platform.initializeQualarooSdk('invalid-key');
          fail('Should have thrown PlatformException');
        } on PlatformException catch (e) {
          expect(e.code, 'INVALID_API_KEY');
          expect(e.message, 'The provided API key is invalid');
          expect(e.details, isA<Map>());
        }
      });
    });

    group('concurrent operations', () {
      test('handles multiple concurrent method calls', () async {
        // Given: Multiple concurrent method calls

        // When: Calling multiple methods at once
        final futures = [
          platform.initializeQualarooSdk('key'),
          platform.setUserId('user'),
          platform.setUserProperty('role', 'admin'),
          platform.showSurvey('survey'),
          platform.setPreferredLanguage('en'),
        ];

        await Future.wait(futures);

        // Then: All methods should be invoked
        expect(methodCallLog.length, 5);
        expect(methodCallLog[0].method, 'initializeQualarooSdk');
        expect(methodCallLog[1].method, 'setUserId');
        expect(methodCallLog[2].method, 'setUserProperty');
        expect(methodCallLog[3].method, 'showSurvey');
        expect(methodCallLog[4].method, 'setPreferredLanguage');
      });

      test('handles rapid sequential calls', () async {
        // Given: Many rapid sequential calls

        // When: Calling setUserProperty 10 times in sequence
        for (int i = 0; i < 10; i++) {
          await platform.setUserProperty('counter', i);
        }

        // Then: All calls should be tracked with correct values
        expect(methodCallLog.length, 10);
        for (int i = 0; i < 10; i++) {
          final args = methodCallLog[i].arguments as Map;
          expect(args['value'], i);
        }
      });
    });

    group('workflow scenarios', () {
      test('complete SDK initialization workflow', () async {
        // Given: A new SDK instance

        // When: Performing a complete initialization workflow
        await platform.initializeQualarooSdk('api-key-123');
        await platform.setUserId('user-456');
        await platform.setUserProperty('name', 'John');
        await platform.setUserProperty('role', 'admin');
        await platform.setPreferredLanguage('en-US');
        await platform.showSurvey('feedback');

        // Then: All methods should be called in the correct order
        expect(methodCallLog.length, 6);
        expect(methodCallLog[0].method, 'initializeQualarooSdk');
        expect(methodCallLog[1].method, 'setUserId');
        expect(methodCallLog[2].method, 'setUserProperty');
        expect(methodCallLog[3].method, 'setUserProperty');
        expect(methodCallLog[4].method, 'setPreferredLanguage');
        expect(methodCallLog[5].method, 'showSurvey');
      });

      test('property management workflow', () async {
        // Given: A user with properties

        // When: Setting and removing properties
        await platform.setUserProperty('age', 25);
        await platform.setUserProperty('city', 'New York');
        await platform.setUserProperty('premium', true);
        await platform.removeUserProperty('city');

        // Then: All operations should be tracked
        expect(methodCallLog.length, 4);
        expect(methodCallLog[0].method, 'setUserProperty');
        expect(methodCallLog[1].method, 'setUserProperty');
        expect(methodCallLog[2].method, 'setUserProperty');
        expect(methodCallLog[3].method, 'removeProperty');
        expect(methodCallLog[3].arguments, 'city');
      });
    });

    group('edge cases', () {
      test('handles empty strings', () async {
        // Given: Empty strings as parameters

        // When: Calling methods with empty strings
        await platform.initializeQualarooSdk('');
        await platform.showSurvey('');
        await platform.setUserId('');
        await platform.setUserProperty('', '');
        await platform.removeUserProperty('');
        await platform.setPreferredLanguage('');

        // Then: All empty strings should be passed correctly
        expect(methodCallLog.length, 6);
        expect(methodCallLog.every((call) => call.arguments != null), true);
      });

      test('handles special characters in strings', () async {
        // Given: Strings with special characters
        const specialStrings = [
          'test@example.com',
          'user-123_abc',
          'survey/feedback',
          'key.property.name',
          'value with spaces',
        ];

        // When: Using strings with special characters
        for (final str in specialStrings) {
          methodCallLog.clear();
          await platform.setUserId(str);

          // Then: Special characters should be preserved
          expect(methodCallLog.first.arguments, str);
        }
      });

      test('handles long strings', () async {
        // Given: A very long string
        final longString = 'x' * 1000;

        // When: Passing a long string
        await platform.setUserId(longString);

        // Then: The long string should be passed correctly
        expect(methodCallLog.first.arguments, longString);
      });

      test('handles unicode characters', () async {
        // Given: Strings with unicode characters
        const unicodeStrings = [
          '你好',
          'مرحبا',
          'こんにちは',
          '😀😃😄',
          'Zürich',
        ];

        // When: Using unicode strings
        for (final str in unicodeStrings) {
          methodCallLog.clear();
          await platform.setUserId(str);

          // Then: Unicode should be preserved
          expect(methodCallLog.first.arguments, str);
        }
      });
    });
  });
}
