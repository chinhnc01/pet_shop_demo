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
          child: SingleChildScrollView(
            child: Container(
              height: Get.height,
              margin: alignment_20_0(),
              child: Column(
                // alignment: Alignment.topCenter,
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4 * 20,
                        ),
                        textHeadlineLarge(
                          text: 'Create Account',
                          fontWeight: FontWeight.w700,
                          color: kGrey,
                        ),
                        const SizedBox(
                          height: 4 * 1,
                        ),
                        textBodySmall(
                          text: 'Sign up to start using the app',
                          color: kGrey.withOpacity(0.7),
                        ),
                        const SizedBox(
                          height: 4 * 16,
                        ),
                        TextFormField(
                          controller: signupController.nameTE,
                          style: mulish(fontSize: 16),
                          decoration: textFieldInputStyle(
                            label: 'Full name',
                          ),
                          maxLines: 1,
                          validator: signupController.validateString,
                          onTap: () {},
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
                          controller: signupController.passTE,
                          obscureText: passwordVisible,
                          style: mulish(fontSize: 16),
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
                          validator: signupController.validatePass,
                        ),
                        const SizedBox(
                          height: 4 * 6,
                        ),
                        TextFormField(
                          onTap: () {},
                          controller: signupController.repassTE,
                          obscureText: passwordVisible,
                          style: mulish(fontSize: 16),
                          decoration: textFieldInputStyle(
                            label: 'Confirm password',
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
                          validator: signupController.validateConfirmPass,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            text: 'Sign up',
                            color: kBoxShadowColor,
                          ),
                          onPressed: () {
                            if (keyForm1.currentState?.validate() ?? false) {
                              signupController.registerUsingEmailPassword(
                                email: signupController.emailTE.text,
                                name: signupController.nameTE.text,
                                password: signupController.passTE.text,
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
                          Get.toNamed(LoginScreen.routeName);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textBodyMedium(
                              text: 'Already have an account ',
                              color: kLightGrey,
                              fontWeight: FontWeight.w600,
                            ),
                            textBodyMedium(
                              text: 'Login ',
                              color: kOrange,
                              fontWeight: FontWeight.w600,
                            ),
                            textBodyMedium(
                              text: 'now.',
                              color: kLightGrey,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
