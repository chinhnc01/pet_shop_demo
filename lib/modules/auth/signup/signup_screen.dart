import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pet_shop/app_styles.dart';
import 'package:pet_shop/modules/auth/login/login_screen.dart';
import 'package:pet_shop/modules/auth/signup/signup_controller.dart';
import 'package:pet_shop/widgets/base/base.dart';
import 'package:pet_shop/widgets/text_custom.dart';
import 'package:pet_shop/widgets/theme_textinput.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const String routeName = '/signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupController signupController = Get.put(SignupController());

  GlobalKey<FormState> keyForm1 = GlobalKey<FormState>(debugLabel: '_FormL1');
  int selectedIndex = 0;
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return buildBody(
      context: context,
      body: _buildBody(),
      appBar: null,
    );
  }

  Widget _buildBody() {
    return signupController.obx(
      (state) => SafeArea(
        child: Form(
          key: keyForm1,
          child: Container(
            height: Get.height,
            margin: alignment_20_0(),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4 * 20,
                      ),
                      textHeadlineLarge(
                        text: 'Đăng ký',
                        fontWeight: FontWeight.w700,
                        color: kGrey,
                      ),
                      const SizedBox(
                        height: 4 * 1,
                      ),
                      textBodySmall(
                        text: 'Đăng ký để bắt đầu sử dụng ứng dụng',
                        color: kGrey.withOpacity(0.7),
                      ),
                      const SizedBox(
                        height: 4 * 16,
                      ),
                      TextFormField(
                        onTap: () {},
                        controller: signupController.nameTE,
                        style: mulish(fontSize: 16),
                        // keyboardType: TextInputType.emailAddress,
                        decoration: textFieldInputStyle(
                          label: 'Họ tên',
                        ),
                        maxLines: 1,
                        validator: signupController.validateEmail,
                      ),
                      const SizedBox(
                        height: 4 * 6,
                      ),
                      TextFormField(
                        onTap: () {},
                        controller: signupController.emailTE,
                        style: mulish(fontSize: 16),
                        keyboardType: TextInputType.emailAddress,
                        decoration: textFieldInputStyle(
                          label: 'Email',
                        ),
                        maxLines: 1,
                        validator: signupController.validateEmail,
                      ),
                      const SizedBox(
                        height: 4 * 6,
                      ),
                      TextFormField(
                        onTap: () {},
                        controller: signupController.passWTE,
                        obscureText: passwordVisible,
                        style: mulish(fontSize: 16),
                        decoration: textFieldInputStyle(
                          label: 'Mật khẩu',
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(
                                () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                            child: Ink(
                              child: Icon(
                                passwordVisible
                                    ? LucideIcons.eye
                                    : LucideIcons.eyeOff,
                              ),
                            ),
                          ),
                        ),
                        validator: signupController.validateString,
                      ),
                      const SizedBox(
                        height: 4 * 6,
                      ),
                      TextFormField(
                        onTap: () {},
                        controller: signupController.passWTE,
                        obscureText: passwordVisible,
                        style: mulish(fontSize: 16),
                        decoration: textFieldInputStyle(
                          label: 'Nhập lại mật khẩu',
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(
                                () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                            child: Ink(
                              child: Icon(
                                passwordVisible
                                    ? LucideIcons.eye
                                    : LucideIcons.eyeOff,
                              ),
                            ),
                          ),
                        ),
                        validator: signupController.validateString,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Get.width * 0.5,
                        height: Get.height * 0.07,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(kBlack),
                          ),
                          child: textTitleSmall(
                            text: 'Đăng ký',
                            color: kBoxShadowColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4 * 6,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(LoginScreen.routeName);
                        },
                        child: Row(
                          children: [
                            textBodyMedium(
                              text: 'Đã có tài khoản? ',
                              color: kLightGrey,
                              fontWeight: FontWeight.w600,
                            ),
                            textBodyMedium(
                              text: 'Đăng nhập ',
                              color: kOrange,
                              fontWeight: FontWeight.w600,
                            ),
                            textBodyMedium(
                              text: 'ngay',
                              color: kLightGrey,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4 * 6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
