import 'package:get/get.dart';
import 'package:raizes/app/modules/informacoes_gerais/controller/informacoes_gerais_controller.dart';

class InformacoesGeraisBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      InformacoesGeraisController(),
    );
  }
}
