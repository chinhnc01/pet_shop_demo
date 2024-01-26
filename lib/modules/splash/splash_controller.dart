import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_shop/modules/auth/login/login_screen.dart';
import 'package:pet_shop/modules/home/home_screen.dart';

class SplashController extends GetxController
    with GetTickerProviderStateMixin, StateMixin {
  GetStorage box = GetStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
    changeUI();
  }

  Future<void> checkLogin() async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(
        const Duration(seconds: 5),
        () {
          Get.offAndToNamed(HomeScreen.routeName);
        },
      );
    } else {
      Timer(
        const Duration(seconds: 5),
        () {
          Get.toNamed(LoginScreen.routeName);
        },
      );
    }
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
