import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pet_shop/app_styles.dart';
import 'package:pet_shop/modules/auth/login/login_controller.dart';
import 'package:pet_shop/modules/auth/signup/signup_screen.dart';
import 'package:pet_shop/widgets/base/base.dart';
import 'package:pet_shop/widgets/text_custom.dart';
import 'package:pet_shop/widgets/theme_textinput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());

  GlobalKey<FormState> keyForm1 = GlobalKey<FormState>(debugLabel: '_FormL1');
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
    return loginController.obx(
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
                        text: 'Login',
                        fontWeight: FontWeight.w700,
                        color: kGrey,
                      ),
                      const SizedBox(
                        height: 4 * 1,
                      ),
                      textBodySmall(
                        text: 'Login to start using the app',
                        color: kGrey.withOpacity(0.7),
                      ),
                      const SizedBox(
                        height: 4 * 16,
                      ),
                      TextFormField(
                        onTap: () {},
                        controller: loginController.emailTE,
                        style: mulish(fontSize: 16),
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        validator: loginController.validateEmail,
                        decoration: textFieldInputStyle(
                          label: 'Email',
                        ),
                      ),
                      const SizedBox(
                        height: 4 * 6,
                      ),
                      TextFormField(
                        onTap: () {},
                        controller: loginController.passTE,
                        obscureText: passwordVisible,
                        style: mulish(fontSize: 16),
                        validator: loginController.validateString,
                        decoration: textFieldInputStyle(
                          label: 'Password',
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
                            text: 'Login',
                            color: kBoxShadowColor,
                          ),
                          onPressed: () {
                            if (keyForm1.currentState?.validate() ?? false) {
                              loginController.signInUsingEmailPassword(
                                email: loginController.emailTE.text,
                                password: loginController.passTE.text,
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 4 * 6,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(SignupScreen.routeName);
                        },
                        child: Row(
                          children: [
                            textBodyMedium(
                              text: 'Don\'t have account? ',
                              color: kLightGrey,
                              fontWeight: FontWeight.w600,
                            ),
                            textBodyMedium(
                              text: 'Sign up ',
                              color: kOrange,
                              fontWeight: FontWeight.w600,
                            ),
                            textBodyMedium(
                              text: 'now',
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
