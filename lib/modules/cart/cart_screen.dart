import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
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
      (state) => SafeArea(
        child: ListView.separated(
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
                emailUser: cartController.cartList[index]!.email.toString(),
                petIdDelete: cartController.cartList[index]!.petId ?? 0,
              );
            },
            name: cartController.cartList[index]!.petName.toString(),
            image: cartController.cartList[index]!.petImage.toString(),
            price: cartController.cartList[index]!.petPrice.toString(),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: cartController.cartList.length,
        ),
      ),
    );
  }
}

class CartTile extends StatelessWidget {
  // final CartItem item;
  final String name, price, image;
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
                height: 85,
                width: 85,
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
                    text: name,
                  ),
                  const SizedBox(height: 10),
                  textBodySmall(
                    text: "\$ $price",
                    fontWeight: FontWeight.bold,
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
