import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop/modules/all_pet/all_pet_controller.dart';

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
    return Container(color: Colors.blueAccent);
  }
}
