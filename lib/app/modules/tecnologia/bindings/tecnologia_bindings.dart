import 'package:get/get.dart';
import 'package:raizes/app/modules/tecnologia/controller/home_controller.dart';

class TecnologiaBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      TecnologiaController(),
    );
  }
}
