import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop/modules/all_pet/all_pet_controller.dart';
import 'package:pet_shop/widgets/base/base.dart';
import 'package:pet_shop/widgets/widgets.dart';

class AllPetScreen extends StatefulWidget {
  const AllPetScreen({Key? key}) : super(key: key);
  static const String routeName = '/all_pet';
  @override
  State<AllPetScreen> createState() => _AllPetScreenState();
}

class _AllPetScreenState extends State<AllPetScreen> {
  AllPetController allPetController = Get.put(AllPetController());

  @override
  Widget build(BuildContext context) {
    return buildBody(
      context: context,
      body: _buildBody(),
      appBar: appBarCustom(
        title: 'All Pet',
        isPadding: true,
        marginTop: 0,
        bigTitle: true,
        isCenterTitle: true,
      ),
    );
  }

  Widget _buildBody() {
    return allPetController.obx(
      (state) => SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.zero,
            padding: alignment_20_0(),
            color: Get.theme.colorScheme.background,
            child: Column(
              children: [
                const SizedBox(
                  height: 4 * 5,
                ),
                searchBar(controller: allPetController.searchTE),
                const SizedBox(
                  height: 4 * 5,
                ),
                SizedBox(
                  width: Get.width * 0.5,
                  height: Get.height * 0.07,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
