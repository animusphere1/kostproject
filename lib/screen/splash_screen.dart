import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kost/router_generator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    init();
  }

  String nama(String namaSaya) {
    var hasil = namaSaya.split('');

    print(hasil);

    return hasil[4] != ' ' ? hasil[4] : hasil[4 + 2];
  }

  void init() async {
    var hasil = nama('Doni Gunawan');

    print(hasil);

    await Future.delayed(const Duration(seconds: 4));

    Get.toNamed(RouteGenerator.routeHome, arguments: hasil);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
