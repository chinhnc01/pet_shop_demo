import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_shop/modules/splash/splash_screen.dart';

class AccountController extends GetxController
    with GetTickerProviderStateMixin, StateMixin {
  int selectItemScreen = 0;
  late String userEmail, userName, userId;
  GetStorage box = GetStorage();
  final auth = FirebaseAuth.instance;

  @override
  Future<void> onInit() async {
    changeUI();
    getDataUser();
    super.onInit();
  }

  getDataUser() async {
    userEmail = box.read('userEmail');
    userName = box.read('userName');
    userId = box.read('userId');
  }

  Future<void> logOut() async {
    await auth.signOut();
    Get.offAndToNamed(SplashScreen.routeName);
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
