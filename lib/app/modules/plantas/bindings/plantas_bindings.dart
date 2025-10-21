import 'package:get/get.dart';
import 'package:raizes/app/modules/plantas/controller/plantas_controller.dart';

class PlantasBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      PlantasController(),
    );
  }
}
