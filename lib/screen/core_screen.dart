import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kost/core/controller/corescreen_controller.dart';
import 'package:kost/core/utils/color.dart';
import 'package:kost/core/utils/height_and_width.dart';
import 'package:kost/screen/home/home_screen.dart';

class CoreScreen extends StatefulWidget {
  const CoreScreen({Key? key}) : super(key: key);

  @override
  _CoreScreenState createState() => _CoreScreenState();
}

class _CoreScreenState extends State<CoreScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<CoreScreenController>(
      init: CoreScreenController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) => controller.changevalueWithTap(index),
            items: List.generate(
              controller.listIcon.length,
              (index) => BottomNavigationBarItem(
                icon: Icon(
                  controller.listIcon[index],
                  color: controller.bottomNavigationIndexActive.value == index
                      ? HexColor.fontsColorsBlue
                      : HexColor.fontsColorsBlue.withOpacity(0.4),
                ),
                label: '',
              ),
            ),
          ),
          body: PageView(
            controller: controller.pageController,
            onPageChanged: (index) => controller.changeValueWithSwap(index),
            children: const [
              HomeScreen(),
              HomeScreen(),
              HomeScreen(),
              HomeScreen(),
            ],
          ),
        );
      },
    );
  }
}
