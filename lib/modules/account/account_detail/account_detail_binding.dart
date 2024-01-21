import 'package:get/get.dart';
import 'package:pet_shop/modules/account/account_detail/account_detail_controller.dart';

class AccountDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountDetailController>(() => AccountDetailController());
  }
}
