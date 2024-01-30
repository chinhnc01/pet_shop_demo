import 'package:get/get.dart';
import 'package:pet_shop/modules/order_list/order_list_controller.dart';

class OrderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderListController>(() => OrderListController());
  }
}
