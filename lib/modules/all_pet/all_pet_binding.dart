import 'package:get/get.dart';
import 'package:pet_shop/modules/all_pet/all_pet_controller.dart';

class AllPetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllPetController>(() => AllPetController());
  }
}
