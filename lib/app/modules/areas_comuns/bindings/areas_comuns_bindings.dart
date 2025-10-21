import 'package:get/get.dart';
import 'package:raizes/app/modules/areas_comuns/controller/areas_comuns_controller.dart';

class AreasComunsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      AreasComunsController(),
    );
  }
}
