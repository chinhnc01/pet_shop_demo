import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pet_shop/modules/account/account_controller.dart';
import 'package:pet_shop/modules/order_list/order_list_screen.dart';
import 'package:pet_shop/widgets/base/base.dart';
import 'package:pet_shop/widgets/text_custom.dart';
import 'package:pet_shop/widgets/widgets.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);
  static const String routeName = '/account';
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  AccountController accountController = Get.put(AccountController());
  GlobalKey<FormState> keyForm1 = GlobalKey<FormState>(debugLabel: '_FormA1');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildBody(
      context: context,
      body: _buildBody(),
      appBar: appBarCustom(
        title: 'Profile',
        isPadding: true,
        marginTop: 0,
        bigTitle: true,
        isCenterTitle: true,
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      // child: SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 4 * 5),
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://cdn.icon-icons.com/icons2/2468/PNG/512/user_kids_avatar_icon_149311.png',
                ),
                radius: 60,
              ),
              const SizedBox(height: 4 * 5),
              textBodyLarge(
                text: accountController.userName,
                fontWeight: FontWeight.bold,
              ),
              textBodyMedium(text: accountController.userEmail),
              const SizedBox(height: 4 * 5),
              // SizedBox(
              //   width: Get.width * 0.5,
              //   height: Get.height * 0.07,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Get.toNamed(AccountDetailScreen.routeName, arguments: {
              //         'userName': accountController.userName,
              //         'userEmail': accountController.userEmail,
              //       });
              //     },
              //     style: ButtonStyle(
              //       shape: MaterialStateProperty.all(
              //         RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(12),
              //         ),
              //       ),
              //       backgroundColor: MaterialStateProperty.all<Color>(kBlack),
              //     ),
              //     child: textTitleSmall(
              //       text: 'Edit Information',
              //       color: kBoxShadowColor,
              //     ),
              //   ),
              // ),

              const SizedBox(
                height: 12,
              ),
              Container(
                //height: 370,
                width: Get.width,
                color: Get.theme.colorScheme.background,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 4 * 5,
                    ),
                    const SizedBox(
                      height: 4 * 5,
                    ),
                    buttonSetting(
                      onTap: () {
                        Get.toNamed(OrderListScreen.routeName);
                        debugPrint(accountController.userId);
                      },
                      iconStart: LucideIcons.scrollText,
                      iconEnd: LucideIcons.chevronRight,
                      isHasIconEnd: true,
                      title: 'Order list',
                    ),
                    buttonSetting(
                      iconStart: LucideIcons.info,
                      iconEnd: LucideIcons.chevronRight,
                      isHasIconEnd: true,
                      title: 'App Information',
                    ),
                    buttonSetting(
                        iconStart: LucideIcons.logOut,
                        iconEnd: LucideIcons.listVideo,
                        title: 'Logout',
                        isToggle: true,
                        onTap: () {
                          accountController.logOut();
                        }),
                    const SizedBox(
                      height: 4 * 5,
                    ),
                  ],
                ),
              ),
            ],
            // ),
          ),
        ),
      ),
    );
  }
}
