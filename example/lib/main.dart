import 'package:flutter/material.dart';
import 'package:qualaroo_flutter/qualaroo_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _qualarooFlutterPlugin = QualarooFlutter();

  @override
  void initState() {
    super.initState();
    _qualarooFlutterPlugin.initializeQualarooSdk("NzQ4MTQ6YTJkMzA3OTY4MWNjMWVmYWYzM2VjMDM0ZWY4Nzg2YzBlN2ExMjI2ZDo3Nzc3Mw==");
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  

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
  child: const Text('TextButton'),
),
        ),
      ),
    );
  }
}
