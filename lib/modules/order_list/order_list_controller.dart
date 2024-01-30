import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_shop/data/models/bill.dart';

class OrderListController extends GetxController
    with GetTickerProviderStateMixin, StateMixin {
  int selectItemScreen = 0;

  late TextEditingController userEmailTE, userNameTE;
  late FirebaseDatabase database;
  GetStorage box = GetStorage();

  List<Bill?> billList = [];

  @override
  Future<void> onInit() async {
    changeUI();
    getListOrer();
    super.onInit();
  }

  Future<void> getListOrer() async {
    database = FirebaseDatabase.instanceFor(
      app: await Firebase.initializeApp(),
      databaseURL:
          'https://pet-shop-demo-48c60-default-rtdb.asia-southeast1.firebasedatabase.app',
    );

    //database= FirebaseDatabase.instanceFor(app: await Firebase.initializeApp());
    DatabaseReference ref = database.ref('bill');
    var userId = box.read('userId');

    final snapshot = await ref.child('/$userId').get();

    debugPrint(snapshot.value.toString());

    final map = snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      billList.add(Bill.fromJson(value));
    });

    changeUI();
    updateUI();
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
