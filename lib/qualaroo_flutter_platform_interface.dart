import 'dart:ffi';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'qualaroo_flutter_method_channel.dart';

abstract class QualarooFlutterPlatform extends PlatformInterface {
  /// Constructs a QualarooFlutterPlatform.
  QualarooFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static QualarooFlutterPlatform _instance = MethodChannelQualarooFlutter();

  /// The default instance of [QualarooFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelQualarooFlutter].
  static QualarooFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [QualarooFlutterPlatform] when
  /// they register themselves.
  static set instance(QualarooFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> initializeQualarooSdk(dynamic apiKey) {
    throw UnimplementedError(
        'initializeQualarooSdk() has not been implemented.');
  }

  Future<void> showSurvey(dynamic aliasName) {
    throw UnimplementedError('showSurvey() has not been implemented.');
  }

  Future<void> setUserId(dynamic userId) {
    throw UnimplementedError('setUserId() has not been implemented.');
  }

  Future<void> setUserProperty(dynamic key, dynamic value) {
    throw UnimplementedError('setUserProperty() has not been implemented.');
  }

  Future<void> removeUserProperty(dynamic key) {
    throw UnimplementedError('removeUserProperty() has not been implemented.');
  }

  Future<void> setPreferredLanguage(dynamic language) {
    throw UnimplementedError(
        'setPrefferedLanguage() has not been implemented.');
  }
}
