import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late RxList<dynamic> list;
  late Rx<ScrollController> scrollController;

  RxList<int> nama = [1, 2, 3, 4].obs;

  RxBool isLoad = false.obs;

  @override
  void onInit() {
    super.onInit();

    init();
  }

  @override
  void onReady() {
    super.onReady();

    ready();
  }

  Future<void> refreshIndicator() async {
    list.value = [];

    isLoad.value = true;

    await Future.delayed(Duration(seconds: 2));

    await ready();
  }

  Future<void> ready() async {
    isLoad.value = true;

    // list.value = await ambil();

    if (list.isEmpty) {
      await Future.delayed(const Duration(seconds: 2));
    }

    isLoad.value = false;

    scrollController.value.addListener(() {});
  }

  init() {
    scrollController = ScrollController(
      keepScrollOffset: true,
    ).obs;

    list = [].obs;
  }

  void change() {
    nama.shuffle();

    nama[0] = 144;

    list[0] = {'name': list[0]['name'], 'isBookmark': !list[0]['isBookmark']};

    // update();
  }

  Future<List<Map<String, dynamic>>> ambil() async {
    await Future.delayed(const Duration(seconds: 4));

    return [
      {'name': null, 'isBookmark': false},
      {'name': 'Doni', 'isBookmark': true},
    ];
  }
}
