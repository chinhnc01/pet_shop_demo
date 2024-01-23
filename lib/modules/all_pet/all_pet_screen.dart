import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pet_shop/app_styles.dart';
import 'package:pet_shop/modules/all_pet/all_pet_controller.dart';
import 'package:pet_shop/widgets/base/base.dart';
import 'package:pet_shop/widgets/text_custom.dart';
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
                GridView.count(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(10),
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 16,
                  childAspectRatio: .62,
                  children: List.generate(
                    24, //this is the total number of cards
                    (index) {
                      return petItem(
                        image:
                            'https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                        name: 'Choichoi',
                        price: '1232',
                        type: 'Dog',
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget petItem({
    required String name,
    required String image,
    required String price,
    required String type,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            offset: const Offset(3, 2),
            blurRadius: 7,
          )
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              child: Image.network(
                image,
                width: Get.width,
                height: Get.height * 0.18,
                // height: double.infinity * 0.7,
                fit: BoxFit.cover,
              ),
            ),
          ),
          textBodyMedium(
            text: name,
            fontWeight: FontWeight.bold,
          ),
          textBodySmall(
            text: type,
            color: Colors.grey,
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: textBodySmall(
                  text: "\$$price",
                  color: kOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              IconButton(
                  icon: const Icon(
                    LucideIcons.shoppingCart,
                    size: 14,
                    color: kOrange,
                  ),
                  onPressed: () {
                    // cartController.addProductToCart(product);
                  })
            ],
          ),
        ],
      ),
    );
  }
}
