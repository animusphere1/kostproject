import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kost/screen/map/maps_screen.dart';
import 'package:kost/screen/screen.dart';

class CoreScreenController extends GetxController {
  late PageController _pageController;
  PageController get pageController => _pageController;

  RxInt bottomNavigationIndexActive = 0.obs;
  RxList<Widget> listScreen = const [
    HomeScreen(),
    MapsScreen(),
    HomeScreen(),
    HomeScreen(),
  ].obs;

  RxList<IconData> listIcon = [
    Icons.home,
    Icons.manage_search_outlined,
    Icons.bookmarks_outlined,
    Icons.person,
  ].obs;

  @override
  void onInit() {
    super.onInit();

    _pageController = PageController(
      initialPage: 0,
    );
  }

  void changevalueWithTap(int i) {
    if (i != bottomNavigationIndexActive.value) {
      bottomNavigationIndexActive.value = i;
    }

    _pageController.animateToPage(i,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void changeValueWithSwap(int i) {
    if (i != bottomNavigationIndexActive.value) {
      bottomNavigationIndexActive.value = i;
    }
  }
}
