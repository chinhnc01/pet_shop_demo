import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop/modules/account/account_controller.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);
  static const String routeName = '/Account';
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  AccountController accountController = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue);
  }
}
