import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pet_shop/data/models/pet.dart';
import 'package:pet_shop/data/pet_data.dart';

class AllPetController extends GetxController
    with GetTickerProviderStateMixin, StateMixin {
  int selectItemScreen = 0;
  late TextEditingController searchTE;

  List<Pet?> listPet = [];
  List<Pet?> listPetResult = [];

  @override
  Future<void> onInit() async {
    changeUI();
    initData();
    getDataPet();
    super.onInit();
  }

  initData() {
    searchTE = TextEditingController();
  }

  Future<void> getDataPet() async {
    clearData();
    for (var item in petList) {
      listPet.add(item);
    }
    listPetResult.addAll(listPet);
  }

  void searchListPet({required String search}) {
    listPetResult = listPet
        .where((element) =>
            element?.name.toLowerCase().contains(search.toLowerCase()) ?? false)
        .toList();
    updateUI();
  }

  void clearData() {
    listPet.clear();
    listPetResult.clear();
  }

  changeUI() {
    change(null, status: RxStatus.success());
  }

  updateUI() {
    update();
  }

  loadingUI() {
    change(null, status: RxStatus.loading());
  }
}
