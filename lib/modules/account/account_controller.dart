import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountController extends GetxController
    with GetTickerProviderStateMixin, StateMixin {
  int selectItemScreen = 0;
  late String userEmail, userName;
  GetStorage box = GetStorage();

  @override
  Future<void> onInit() async {
    changeUI();
    getDataUser();
    super.onInit();
  }

  getDataUser() async {
    userEmail = box.read('userEmail');
    userName = box.read('userName');
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
