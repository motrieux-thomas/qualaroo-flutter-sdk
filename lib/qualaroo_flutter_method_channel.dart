import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'qualaroo_flutter_platform_interface.dart';

/// An implementation of [QualarooFlutterPlatform] that uses method channels.
class MethodChannelQualarooFlutter extends QualarooFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('qualaroo_flutter');

  @override
  Future<void> initializeQualarooSdk(dynamic apiKey) async {
    await methodChannel.invokeMethod<String>('initializeQualarooSdk', apiKey);
  }

  @override
  Future<void> showSurvey(dynamic aliasName) async {
    await methodChannel.invokeMethod<String>('showSurvey', aliasName);
  }

  @override
  Future<void> setUserId(dynamic userId) async {
    await methodChannel.invokeMethod<String>('setUserId', userId);
  }

  @override
  Future<void> setUserProperty(dynamic key, dynamic value) async {
    await methodChannel.invokeMethod<String>(
        'setUserProperty', <String, dynamic>{'key': key, 'value': value});
  }

  @override
  Future<void> removeUserProperty(dynamic key) async {
    await methodChannel.invokeMethod<String>('removeProperty', key);
  }

  @override
  Future<void> setPreferredLanguage(dynamic language) async {
    await methodChannel.invokeMethod<String>('setPrefferedLanguage', language);
  }
}
