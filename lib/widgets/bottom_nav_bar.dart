import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pet_shop/app_styles.dart';
import 'package:pet_shop/modules/account/account_screen.dart';
import 'package:pet_shop/modules/all_pet/all_pet_screen.dart';
import 'package:pet_shop/modules/cart/cart_screen.dart';
import 'package:pet_shop/modules/dashboard/dashboard_screen.dart';
import 'package:pet_shop/widgets/library/flashy_tab_bar2.dart';
import 'package:pet_shop/widgets/text_custom.dart';

Widget bottomNavigationBar({
  int selectedIndex = 0,
  required Function(int) onSelect,
}) {
  return FlashyTabBar(
    selectedIndex: selectedIndex,
    showElevation: true,
    animationCurve: Curves.elasticInOut,
    animationDuration: const Duration(milliseconds: 700),
    iconSize: 24,
    backgroundColor: Get.theme.colorScheme.background,
    onItemSelected: onSelect,
    items: items,
  );
}

List<FlashyTabBarItem> items = [
  FlashyTabBarItem(
    icon: const Icon(LucideIcons.home),
    title: Text(
      'Home',
      style: mulish(
        fontSize: 18,
        color: kOrange,
      ),
    ),
    activeColor: kOrange,
    inactiveColor: Colors.grey,
  ),
  FlashyTabBarItem(
    icon: const Icon(LucideIcons.dog),
    title: Text(
      'All Pet',
      style: mulish(
        fontSize: 18,
        color: kOrange,
      ),
    ),
    activeColor: kOrange,
    inactiveColor: Colors.grey,
  ),
  FlashyTabBarItem(
    icon: const Icon(LucideIcons.shoppingCart),
    title: Text(
      'Cart',
      style: mulish(
        fontSize: 18,
        color: kOrange,
      ),
    ),
    activeColor: kOrange,
    inactiveColor: Colors.grey,
  ),
  FlashyTabBarItem(
    icon: const Icon(LucideIcons.user2),
    title: Text(
      'Account',
      style: mulish(
        fontSize: 18,
        color: kOrange,
      ),
    ),
    activeColor: kOrange,
    inactiveColor: Colors.grey,
  ),
];

List<Widget> widgetOptions = <Widget>[
  const DashboardScreen(),
  const AllPetScreen(),
  const CartScreen(),
  const AccountScreen(),
];
