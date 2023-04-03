import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qualaroo_flutter/qualaroo_flutter_method_channel.dart';

void main() {
  MethodChannelQualarooFlutter platform = MethodChannelQualarooFlutter();
  const MethodChannel channel = MethodChannel('qualaroo_flutter');

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
