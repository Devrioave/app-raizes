import 'package:get/get.dart';
import 'package:raizes/app/modules/localizacao/localizacao_controller.dart';

class LocalizacaoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LocalizacaoController());
  }
}
