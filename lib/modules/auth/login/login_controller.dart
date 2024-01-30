import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_shop/modules/home/home_screen.dart';
import 'package:pet_shop/widgets/share_function/share_funciton.dart';

class LoginController extends GetxController
    with GetTickerProviderStateMixin, StateMixin {
  GetStorage box = GetStorage();
  late TextEditingController emailTE, passTE;
  @override
  Future<void> onInit() async {
    super.onInit();
    initData();
    changeUI();
    checkLogin();
  }

  initData() {
    emailTE = TextEditingController();
    passTE = TextEditingController();
  }

  Future<void> checkLogin() async {
    // FirebaseAuth auth = FirebaseAuth.instance;

    // if (auth.currentUser != null) {
    //   // Get.offAllNamed(HomeScreen.routeName);
    //   await buildToast(type: TypeToast.success, title: 'not null');
    // }
  }

  Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;

      await box.write('userEmail', user!.email);
      await box.write('userName', user.displayName);
      await box.write('userId', user.uid);
      // await box.write('userPhone', user.phoneNumber);

      buildToast(
        type: TypeToast.success,
        title: 'Welcome: ${user.displayName.toString()}',
      );
      Get.offAllNamed(HomeScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        buildToast(
          type: TypeToast.failure,
          title: 'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        buildToast(
          type: TypeToast.failure,
          title: 'Wrong password provided.',
        );
      }
    }

    return user;
  }

  Future<void> login() async {
    // User? user;
    // !isLoginBiometric
    //     ? user = await userRepo.loginWithEmail(
    //         email: emailTE.text, passW: passWTE.text)
    //     : user = await userRepo.loginWithBiometric();
    // user != null ? Get.offAllNamed(SplashScreen.routeName) : null;
    // changeUI();
  }

  String? validateEmail(String? value) {
    bool emailValid = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value ?? '');
    return emailValid ? null : "Không đúng định dạng email";
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
