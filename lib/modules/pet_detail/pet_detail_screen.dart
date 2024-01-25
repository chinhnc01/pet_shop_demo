import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pet_shop/app_styles.dart';
import 'package:pet_shop/data/models/pet.dart';
import 'package:pet_shop/modules/cart/cart_controller.dart';
import 'package:pet_shop/modules/pet_detail/pet_detail_controller.dart';
import 'package:pet_shop/size_config.dart';

class PetDetailScreen extends StatefulWidget {
  const PetDetailScreen({Key? key}) : super(key: key);
  static const String routeName = '/pet_detail';

  @override
  State<PetDetailScreen> createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {
  PetDetailController petDetailController = Get.put(PetDetailController());
  Pet? pet = Get.arguments;
  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kWhite,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          debugPrint('Add to cart button pressed!');
          cartController.createCartList(
            petId: pet!.id,
            petImage: pet!.image,
            quantity: 1,
            petName: pet!.name,
            petPrice: pet!.price,
          );
        },
        label: Text(
          'Add to cart',
          style: kSourceSansProSemibold.copyWith(
            color: kBoxShadowColor,
            fontSize: SizeConfig.blockSizeHorizontal! * 4,
          ),
        ),
        icon: SvgPicture.asset(
          'assets/add_to_cart_icon.svg',
        ),
        backgroundColor: kGrey,
        extendedPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: kPaddingHorizontal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 50,
              child: Stack(
                children: [
                  Image.network(
                    pet!.image,
                    height: SizeConfig.blockSizeVertical! * 60,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(42),
                          topRight: Radius.circular(42),
                        ),
                        color: kWhite,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical! * 8,
                        left: SizeConfig.blockSizeHorizontal! * 8,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(LucideIcons.arrowLeft),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
              transform: Matrix4.translationValues(0, -12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        pet!.name,
                        style: kSourceSansProBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 6,
                          color: kGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$ ${pet!.price.toString()}',
                            // 'Arizona, U.S.',
                            style: kSourceSansProregular.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: kOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('Favorite Button Tapped');
                      cartController.createCartList(
                        petId: pet!.id,
                        petImage: pet!.image,
                        quantity: 1,
                        petName: pet!.name,
                        petPrice: pet!.price,
                      );
                    },
                    child: const Icon(
                      LucideIcons.shoppingCart,
                      size: 32,
                      color: kBoxShadowColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kPaddingHorizontal,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kLighterOrange,
                    ),
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    child: Column(
                      children: [
                        Text(
                          // '6 Months',
                          ((DateTime.now()).difference(pet!.birth).inDays / 30)
                              .toStringAsFixed(0),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: kSourceSansProBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            color: kDarkOrange,
                          ),
                        ),
                        Text(
                          'Months',
                          style: kSourceSansProregular.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            color: kLighterGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kLighterOrange,
                    ),
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    child: Column(
                      children: [
                        Text(
                          pet!.color,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: kSourceSansProBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            color: kDarkOrange,
                          ),
                        ),
                        Text(
                          'Color',
                          style: kSourceSansProregular.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            color: kLighterGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kLighterOrange,
                    ),
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    child: Column(
                      children: [
                        Text(
                          '${pet!.weight} KG',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: kSourceSansProBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            color: kDarkOrange,
                          ),
                        ),
                        Text(
                          'Weight',
                          style: kSourceSansProregular.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            color: kLighterGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kPaddingHorizontal,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
              child: Text(
                'About me',
                style: kSourceSansProregular.copyWith(
                  color: kLighterGrey,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
              child: Text(
                pet!.des,
                style: kSourceSansProSemibold.copyWith(
                  color: kGrey,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                ),
              ),
            ),
            const SizedBox(
              height: kPaddingHorizontal,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: kPaddingHorizontal,
            //   ),
            //   child: Text(
            //     'Photo Album',
            //     style: kSourceSansProregular.copyWith(
            //       color: kLighterGrey,
            //       fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 12,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: kPaddingHorizontal,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         height: 55,
            //         width: SizeConfig.blockSizeHorizontal! * 25,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(6),
            //           image: const DecorationImage(
            //             fit: BoxFit.cover,
            //             image: AssetImage(
            //               'assets/images/dog_marly01.png',
            //             ),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         height: 55,
            //         width: SizeConfig.blockSizeHorizontal! * 25,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(
            //             6,
            //           ),
            //           image: const DecorationImage(
            //             fit: BoxFit.cover,
            //             image: AssetImage(
            //               'assets/images/dog_marly02.png',
            //             ),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         height: 55,
            //         width: SizeConfig.blockSizeHorizontal! * 25,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(6),
            //           image: const DecorationImage(
            //             fit: BoxFit.cover,
            //             image: AssetImage(
            //               'assets/images/dog_marly03.png',
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
