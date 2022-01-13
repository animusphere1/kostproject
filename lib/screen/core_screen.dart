import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kost/core/controller/corescreen_controller.dart';
import 'package:kost/core/utils/color.dart';
import 'package:kost/core/utils/height_and_width.dart';

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
          body: Stack(
            children: [
              PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                // onPageChanged: (index) => controller.changeValueWithSwap(index),
                children: controller.listScreen,
              ),
              //bottomNavigation
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: 15,
                  ),
                  child: bottomNavigation(context, controller),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Container bottomNavigation(
      BuildContext context, CoreScreenController controller) {
    return Container(
      height: heightMediaQuery(context) * 0.09,
      decoration: BoxDecoration(
        color: HexColor.containerItemsLight,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: controller.listScreen.length == controller.listIcon.length
            ? List.generate(
                controller.listScreen.length,
                (index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => controller.changevalueWithTap(index),
                      child: Icon(
                        controller.listIcon[index],
                        color: controller.bottomNavigationIndexActive.value ==
                                index
                            ? HexColor.containerItemsColorsPurple
                            : Colors.grey.shade400,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    controller.bottomNavigationIndexActive.value == index
                        ? CircleAvatar(
                            radius: 2,
                            backgroundColor:
                                HexColor.containerItemsColorsPurple,
                          )
                        : const CircleAvatar(
                            radius: 2,
                            backgroundColor: Colors.transparent,
                          ),
                  ],
                ),
              )
            : [
                SizedBox(
                  height: heightMediaQuery(context) * 0.1,
                ),
              ],
      ),
    );
  }
}
