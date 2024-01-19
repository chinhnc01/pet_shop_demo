import 'package:get/get.dart';
import 'package:pet_shop/modules/pet_detail/pet_detail_controller.dart';

class PetDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetDetailController>(() => PetDetailController());
  }
}
