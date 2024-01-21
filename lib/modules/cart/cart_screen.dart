import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop/modules/cart/cart_controller.dart';

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
    return Container(color: Colors.greenAccent);
  }
}
