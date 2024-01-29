import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop/widgets/share_function/share_funciton.dart';

class AccountDetailController extends GetxController
    with GetTickerProviderStateMixin, StateMixin {
  int selectItemScreen = 0;

  late TextEditingController userEmailTE, userNameTE;

  @override
  Future<void> onInit() async {
    changeUI();
    super.onInit();
  }

  getDataUser({required String userName, required String userEmail}) async {
    userEmailTE = TextEditingController();
    userNameTE = TextEditingController();

    userEmailTE.text = userEmail;
    userNameTE.text = userName;
  }

  Future<void> editUserInfo(String userName) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.currentUser!.updateDisplayName(userName);

    buildToast(
        type: TypeToast.success,
        title: auth.currentUser!.displayName.toString());
  }

  String? validateString(String? text) {
    if (text == null || text.isEmpty) {
      return "Trường bắt buộc";
    }
    return null;
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
