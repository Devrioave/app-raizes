import 'package:get/get.dart';
import 'package:raizes/app/modules/disclaimer/controller/disclaimer_controller.dart';

class DisclaimerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DisclaimerController>(() => DisclaimerController());
  }
}

