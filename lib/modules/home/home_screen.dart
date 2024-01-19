import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop/modules/home/home_controller.dart';
import 'package:pet_shop/widgets/base/base.dart';
import 'package:pet_shop/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return homeController.obx(
      (state) => buildBody(
        context: context,
        body: _buildBody(),
        appBar: null,
        bottomNavigationBar: bottomNavigationBar(
          onSelect: (index) => setState(
            () {
              homeController.selectItemScreen = index;
              homeController.changeUI();
            },
          ),
          selectedIndex: homeController.selectItemScreen,
        ),
      ),
      // onLoading: const LoadingCustom(),
    );
  }

  Widget _buildBody() {
    return widgetOptions.elementAt(homeController.selectItemScreen);
  }
}
