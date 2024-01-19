import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pet_shop/modules/dashboard/dashboard_screen.dart';
import 'package:pet_shop/modules/pet_detail/pet_detail_screen.dart';
import 'package:pet_shop/widgets/library/flashy_tab_bar2.dart';

Widget bottomNavigationBar(
    {int selectedIndex = 0, required Function(int) onSelect}) {
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
    title: const Text('a'),
    inactiveColor: Colors.grey,
  ),
  FlashyTabBarItem(
    icon: const Icon(LucideIcons.personStanding),
    title: const Text('b'),
    inactiveColor: Colors.grey,
  ),
];

List<Widget> widgetOptions = <Widget>[
  const DashboardScreen(),
  const PetDetailScreen(),
];
