import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raizes/app/components/raizes_scaffold.dart';
import 'package:raizes/app/modules/tabela_de_vendas/controller/tabela_de_vendas_controller.dart';
import 'package:raizes/app/themes/app_themes.dart';

class TabelaDeVendasView extends GetView<TabelaDeVendasController> {
  const TabelaDeVendasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaizesScaffold(
      title: const Text("Tabela de Vendas"),
      body: Container(
        color: AppColors.softWhite,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.iconColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Icon(
                    Icons.table_chart,
                    size: 60,
                    color: AppColors.darkGreen,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  "Tabela de Vendas",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGray,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  "Valores atualizados mensalmente",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.darkGreen,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                const Text(
                  "Consulte os valores e condições de pagamento das unidades disponíveis no Empreendimento Raízes.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                Obx(() {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.openTabelaDeVendas,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.iconColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: controller.isLoading.value
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.open_in_new, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  "ACESSAR TABELA DE VENDAS",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  );
                }),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.appBarBackground.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppColors.darkGreen,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          "A tabela é atualizada mensalmente com os valores e disponibilidade das unidades.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
