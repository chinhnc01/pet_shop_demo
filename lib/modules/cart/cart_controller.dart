import 'dart:async';

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

  @override
  Future<void> onInit() async {
    await getCartList();
    changeUI();
    updateUI();
    super.onInit();
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
  }) async {
    Cart myCart1 = Cart(
      email: accountController.userEmail,
      petId: petId,
      quantity: quantity,
      petImage: petImage,
      petName: petName,
      petPrice: petPrice,
    );
    // if(await dbHelper.checkPlantInMyCart(authController.user!, id)){
    //   Get.snackbar('Sản phẩm có sẵn trong giỏ hàng', 'vào giỏ hàng để cập nhật số lượng');
    // }else{
    //   dbHelper.save(myCart1);
    //   Get.snackbar('Đã thêm vào giỏ hàng', 'Vào giỏ hàng để kiểm tra');
    // }

    dbHelper.save(myCart1);

    buildToast(type: TypeToast.transparent, title: 'Added to cart');

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
