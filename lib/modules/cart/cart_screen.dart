import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pet_shop/app_styles.dart';
import 'package:pet_shop/modules/cart/cart_controller.dart';
import 'package:pet_shop/widgets/base/base.dart';
import 'package:pet_shop/widgets/text_custom.dart';
import 'package:pet_shop/widgets/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/all_pet';
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return buildBody(
      context: context,
      body: _buildBody(),
      appBar: appBarCustom(
        title: 'My Cart',
        isPadding: true,
        marginTop: 0,
        bigTitle: true,
        isCenterTitle: true,
      ),
    );
  }

  Widget _buildBody() {
    return cartController.obx(
      (state) => (cartController.cartList.isEmpty)
          ? Center(
              child: Container(
                child: Lottie.asset(
                  'assets/animate/empty_cart.json',
                  width: Get.width * 0.6,
                  height: Get.width * 0.6,
                  fit: BoxFit.fill,
                ),
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20),
                      itemBuilder: (context, index) => CartTile(
                        // item: cartItems[index],
                        onRemove: () {
                          // if (cartItems[index].quantity != 1) {
                          //   setState(() {
                          //     cartItems[index].quantity--;
                          //   });
                          // }
                        },
                        onAdd: () {
                          // setState(() {
                          //   cartItems[index].quantity++;
                          // });
                        },
                        onDelete: () {
                          cartController.deleteItem(
                            emailUser: cartController.cartList[index]!.email
                                .toString(),
                            petIdDelete:
                                cartController.cartList[index]!.petId ?? 0,
                          );
                        },
                        name:
                            cartController.cartList[index]!.petName.toString(),
                        image:
                            cartController.cartList[index]!.petImage.toString(),
                        price:
                            cartController.cartList[index]!.petPrice.toString(),
                        weight: cartController.cartList[index]!.petWeight
                            .toString(),
                        age: cartController.cartList[index]!.petAge.toString(),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemCount: cartController.cartList.length,
                    ),
                    Container(
                      padding: const EdgeInsets.all(24),
                      child: SizedBox(
                        width: Get.width * 0.5,
                        height: Get.height * 0.07,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.bottomSheet(
                              _showDetailCheckout(
                                quantity: cartController.cartList.length,
                                priceTotal: cartController.cartList.fold<num>(
                                  0,
                                  (previousValue, element) =>
                                      previousValue + element!.petPrice!,
                                ),
                                onTap: () {
                                  cartController.checkOut();
                                  Get.back();
                                },
                              ),
                            );
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
                            text: 'Check out',
                            color: kBoxShadowColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CartTile extends StatelessWidget {
  // final CartItem item;
  final String name, price, image, weight, age;
  final Function() onRemove;
  final Function() onAdd;
  final Function() onDelete;
  const CartTile({
    super.key,
    // required this.item,
    required this.onRemove,
    required this.onAdd,
    required this.name,
    required this.price,
    required this.weight,
    required this.age,
    required this.image,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: const Offset(3, 2),
                blurRadius: 7,
              )
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  // color: kBlack,
                  borderRadius: BorderRadius.circular(20),
                ),
                // padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textBodyMedium(
                    text: name,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 5),
                  textBodySmall(
                    text: '$weight KG',
                    color: kGrey,
                  ),
                  textBodySmall(
                    text: '$age months',
                    color: kGrey,
                  ),
                  const SizedBox(height: 10),
                  textBodySmall(
                    text: "\$ $price",
                    fontWeight: FontWeight.w700,
                    color: kOrange,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  LucideIcons.trash2,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

Widget _showDetailCheckout({
  required num priceTotal,
  required num quantity,
  required Function() onTap,
}) {
  return Container(
    padding: const EdgeInsets.all(32),
    color: Get.theme.colorScheme.background,
    height: 300,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textBodyLarge(text: 'Quantity: '),
                textBodyLarge(
                  text: quantity.toString(),
                  color: kOrange,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textBodyLarge(text: 'Total: '),
                textBodyLarge(
                  text: '\$ ${priceTotal.toString()}',
                  color: kOrange,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            width: Get.width * 0.7,
            height: Get.height * 0.07,
            child: ElevatedButton(
              onPressed: onTap,
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(kBlack),
              ),
              child: textTitleSmall(
                text: 'Order',
                color: kBoxShadowColor,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
