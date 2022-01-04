import 'package:flutter/material.dart';
import 'package:kost/screen/home_screen.dart';
import 'package:kost/screen/splash_screen.dart';
import 'core/utils/debug.dart';
import 'router_generator.dart';

import 'package:get/get.dart';

void main() {
  init().then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  debug('awalan');

  await Future.delayed(const Duration(seconds: 2));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hey Kost',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
  }
}
