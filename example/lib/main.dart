import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:qualaroo_flutter/qualaroo_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _qualarooFlutterPlugin = QualarooFlutter();

  @override
  void initState() {
    super.initState();
    _qualarooFlutterPlugin.initializeQualarooSdk("NzQ4MTQ6YTJkMzA3OTY4MWNjMWVmYWYzM2VjMDM0ZWY4Nzg2YzBlN2ExMjI2ZDo3Nzc3Mw==");
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _qualarooFlutterPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
  ),
  onPressed: () {
    _qualarooFlutterPlugin.setUserProperty("name", "AJAY");
     _qualarooFlutterPlugin.showSurvey("show_once_testing");},
  child: Text('TextButton'),
),
        ),
      ),
    );
  }
}
