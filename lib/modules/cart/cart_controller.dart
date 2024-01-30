import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_shop/data/db_helper.dart';
import 'package:pet_shop/data/models/cart.dart';
import 'package:pet_shop/modules/account/account_controller.dart';
import 'package:pet_shop/widgets/share_function/share_funciton.dart';

class CartController extends GetxController
    with GetTickerProviderStateMixin, StateMixin {
  int selectItemScreen = 0;
  DBHelper dbHelper = DBHelper();
  List<Cart?> cartList = [];
  AccountController accountController = Get.put(AccountController());

  GetStorage box = GetStorage();

  CollectionReference bill = FirebaseFirestore.instance.collection('bill');

  final databaseRef = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL:
              'https://pet-shop-demo-48c60-default-rtdb.asia-southeast1.firebasedatabase.app')
      .ref('bill');

  @override
  Future<void> onInit() async {
    await getCartList();
    changeUI();
    updateUI();
    super.onInit();
  }

  Future<void> checkOut() async {
    final databaseRefLastId = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL:
                'https://pet-shop-demo-48c60-default-rtdb.asia-southeast1.firebasedatabase.app')
        .ref('idLast');

    var idLast = await databaseRefLastId.child('/idLast').get();
    var billId = int.parse(idLast.value.toString()) + 12;
    var userId = box.read('userId');

    // buildToast(type: TypeToast.success, title: jsonEncode(cartList));
    await databaseRef.child('/$userId/$billId').set({
      'billId': billId,
      'userEmail': accountController.userEmail,
      'quantity': cartList.length,
      'billTotal': cartList.fold<num>(
          0, (previousValue, element) => previousValue + element!.petPrice!),
      'list': jsonEncode(cartList),
      'checkoutTime': DateTime.now().millisecondsSinceEpoch,
      'status': 'processing',
    }).then((_) {
      databaseRefLastId.set({
        'idLast': billId,
      });
      buildToast(type: TypeToast.success, title: 'Checkout Success!!!');
      deleteAllItem(emailUser: accountController.userEmail);
    }).catchError(
      (error) => buildToast(
        type: TypeToast.failure,
        title: error.toString(),
      ),
    );
  }

  Future<List<Cart>> getCartList() async {
    // final prefs = await SharedPreferences.getInstance();
    cartList = await dbHelper.getDataCart(accountController.userEmail);

    return await dbHelper.getDataCart(accountController.userEmail);
  }

  Future<void> createCartList({
    required int quantity,
    required int petId,
    required String petImage,
    required String petName,
    required num petPrice,
    required num petAge,
    required num petWeight,
  }) async {
    Cart myCart1 = Cart(
      email: accountController.userEmail,
      petId: petId,
      quantity: quantity,
      petImage: petImage,
      petName: petName,
      petPrice: petPrice,
      petAge: petAge,
      petWeight: petWeight,
    );
    if (await dbHelper.checkPetInCart(
      accountController.userEmail,
      petId,
    )) {
      buildToast(
        type: TypeToast.failure,
        title: 'Pet already in the cart',
      );
    } else {
      dbHelper.save(myCart1);
      buildToast(
        type: TypeToast.transparent,
        title: 'Added to cart',
      );
    }

    await getCartList();

    updateUI();
  }

  Future<void> deleteItem({
    required String emailUser,
    required int petIdDelete,
  }) async {
    await dbHelper.deleteCartItem(
      emailUser: emailUser,
      petIdDelete: petIdDelete,
    );

    await getCartList();

    updateUI();
    changeUI();
  }

  Future<void> deleteAllItem({
    required String emailUser,
  }) async {
    await dbHelper.deleteAllCartItem(emailUser);

    await getCartList();

    updateUI();
    changeUI();
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
