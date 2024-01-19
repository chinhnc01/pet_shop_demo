import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_shop/modules/home/home_screen.dart';

class SplashController extends GetxController
    with GetTickerProviderStateMixin, StateMixin {
  GetStorage box = GetStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
    changeUI();
  }

  Future<void> check() async {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAndToNamed(HomeScreen.routeName);
    });
  }

  Future<void> direct() async {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.offAndToNamed(HomeScreen.routeName);
      },
    );
  }

  changeUI() {
    change(null, status: RxStatus.success());
  }

  updateUI() {
    update();
  }

  loadingUI() {
    change(null, status: RxStatus.loading());
  }
}
