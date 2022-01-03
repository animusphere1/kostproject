import 'package:flutter/material.dart';
import 'package:kost/screen/home_screen.dart';
import 'package:kost/screen/splash_screen.dart';
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
    return const GetMaterialApp(
      title: 'Hey Kost',
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      home: SplashScreen(),
    );
  }
}
