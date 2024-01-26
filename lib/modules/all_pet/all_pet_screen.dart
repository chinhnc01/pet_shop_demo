import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop/app_styles.dart';
import 'package:pet_shop/modules/all_pet/all_pet_controller.dart';
import 'package:pet_shop/modules/pet_detail/pet_detail_screen.dart';
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
  // CartController cartController = Get.put(CartController());

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
                searchBar(
                  controller: allPetController.searchTE,
                  onChange: (value) {
                    allPetController.searchListPet(search: value);
                  },
                ),
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
                    allPetController.listPetResult
                        .length, //this is the total number of cards
                    (index) {
                      return petItem(
                          image: allPetController.listPetResult[index]!.image,
                          name: allPetController.listPetResult[index]!.name,
                          price: allPetController.listPetResult[index]!.price
                              .toString(),
                          type:
                              allPetController.listPetResult[index]!.categorie,
                          onTap: () {
                            Get.toNamed(
                              PetDetailScreen.routeName,
                              arguments: allPetController.listPetResult[index],
                            );
                          },
                          onTapAddToCart: () {
                            // cartController.createCartList(
                            //   petId: petList[index]!.id,
                            //   petImage: petList[index]!.image,
                            //   quantity: 1,
                            //   petName: petList[index]!.name,
                            //   petPrice: petList[index]!.price,
                            // );
                          });
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
    required Function? onTap,
    required Function? onTapAddToCart,
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
      child: InkWell(
        onTap: () {
          if (onTap != null) onTap();
        },
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
            const SizedBox(
              height: 12,
            ),
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
                // IconButton(
                //   icon: const Icon(
                //     LucideIcons.shoppingCart,
                //     size: 14,
                //     color: kOrange,
                //   ),
                //   onPressed: onTapAddToCart!(),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
