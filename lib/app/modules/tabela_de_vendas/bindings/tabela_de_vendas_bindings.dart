import 'package:get/get.dart';
import 'package:raizes/app/modules/tabela_de_vendas/controller/tabela_de_vendas_controller.dart';

class TabelaDeVendasBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      TabelaDeVendasController(),
    );
  }
}
