import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pet_shop/app_styles.dart';
import 'package:pet_shop/modules/account/account_detail/account_detail_controller.dart';
import 'package:pet_shop/widgets/base/base.dart';
import 'package:pet_shop/widgets/text_custom.dart';
import 'package:pet_shop/widgets/theme_textinput.dart';
import 'package:pet_shop/widgets/widgets.dart';

class AccountDetailScreen extends StatefulWidget {
  const AccountDetailScreen({Key? key}) : super(key: key);
  static const String routeName = '/account_detail';
  @override
  State<AccountDetailScreen> createState() => _AccountDetailScreenState();
}

class _AccountDetailScreenState extends State<AccountDetailScreen> {
  AccountDetailController accountDetailController =
      Get.put(AccountDetailController());
  GlobalKey<FormState> keyForm1 = GlobalKey<FormState>(debugLabel: '_FormA1');

  String userName = Get.arguments['userName'];
  String userEmail = Get.arguments['userEmail'];

  @override
  void initState() {
    super.initState();
    accountDetailController.getDataUser(
      userEmail: userEmail,
      userName: userName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildBody(
      context: context,
      body: _buildBody(),
      appBar: appBarCustom(
        title: 'Chỉnh sửa thông tin',
        leadingAppBar: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        isBorder: false,
        isPadding: true,
        marginTop: 0,
        bigTitle: true,
        isCenterTitle: true,
      ),
    );
  }

  Widget _buildBody() {
    return accountDetailController.obx(
      (state) => SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: keyForm1,
            child: Container(
              margin: EdgeInsets.zero,
              padding: alignment_20_0(),
              color: Get.theme.colorScheme.background,
              child: Column(
                children: [
                  const SizedBox(
                    height: 4 * 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            TextFormField(
                              onTap: () {},
                              style: mulish(fontSize: 16),
                              controller: accountDetailController.userNameTE,
                              validator: accountDetailController.validateString,
                              decoration: textFieldInputStyle(label: 'Tên'),
                            ),
                            const SizedBox(
                              height: 4 * 5,
                            ),
                            TextFormField(
                              onTap: () {},
                              style: mulish(fontSize: 16),
                              controller: accountDetailController.userEmailTE,
                              // validator: accountDetailController.validateString,
                              decoration: textFieldInputStyle(label: 'Email'),
                              readOnly: true,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4 * 12,
                  ),
                  SizedBox(
                    width: Get.width * 0.5,
                    height: Get.height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        if (keyForm1.currentState?.validate() ?? false) {
                          debugPrint('ok');
                          accountDetailController.editUserInfo(userName);
                        }
                      },
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
                        text: 'Lưu',
                        color: kBoxShadowColor,
                      ),
                    ),
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
