import 'qualaroo_flutter_platform_interface.dart';

class QualarooFlutter {
  Future<String?> getPlatformVersion() {
    return QualarooFlutterPlatform.instance.getPlatformVersion();
  }

  Future<void> initializeQualarooSdk(dynamic apiKey) async {
    QualarooFlutterPlatform.instance.initializeQualarooSdk(apiKey);
  }

  Future<void> showSurvey(dynamic aliasName) async {
    QualarooFlutterPlatform.instance.showSurvey(aliasName);
  }

  Future<void> setUserId(dynamic userId) async {
    QualarooFlutterPlatform.instance.setUserId(userId);
  }

  Future<void> setUserProperty(dynamic key, dynamic value) async {
    QualarooFlutterPlatform.instance.setUserProperty(key, value);
  }

  Future<void> removeUserProperty(dynamic key) async {
    QualarooFlutterPlatform.instance.removeUserProperty(key);
  }

  Future<void> setPreferredLanguage(dynamic language) async {
    QualarooFlutterPlatform.instance.setPreferredLanguage(language);
  }
}
