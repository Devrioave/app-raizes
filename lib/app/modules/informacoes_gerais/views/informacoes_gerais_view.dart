import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raizes/app/components/raizes_scaffold.dart';
import 'package:raizes/app/components/toggle_button.dart';
import 'package:raizes/app/modules/informacoes_gerais/controller/informacoes_gerais_controller.dart';
import 'package:raizes/app/modules/informacoes_gerais/pages/descritivo_page.dart';
import 'package:raizes/app/modules/informacoes_gerais/pages/o_bairro_page.dart';
import 'package:raizes/app/modules/informacoes_gerais/pages/projetistas_page.dart';
import 'package:raizes/app/themes/app_themes.dart';

class InformacoesGeraisView extends GetView<InformacoesGeraisController> {
  const InformacoesGeraisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaizesScaffold(
      title: const Text("Informações gerais"),
      actionsBuilder: () => [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.image_outlined),
        ),
      ],
      body: Container(
        color: AppColors.softWhite,
        child: SingleChildScrollView(
          child: Column(
            children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.pureWhite,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkGray.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Obx(
                () {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ToggleButton(
                          title: "DESCRITIVO",
                          toggled: controller.currentPage
                              .contains(SubPages.descritivo),
                          onTap: () {
                            controller.currentPage.value = [
                              SubPages.descritivo
                            ];
                          },
                        ),
                        ToggleButton(
                          title: "PROJETISTAS",
                          toggled: controller.currentPage
                              .contains(SubPages.projetistas),
                          onTap: () {
                            controller.currentPage.value = [
                              SubPages.projetistas
                            ];
                          },
                        ),
                        ToggleButton(
                          title: "O BAIRRO",
                          toggled:
                              controller.currentPage.contains(SubPages.oBairro),
                          onTap: () {
                            controller.currentPage.value = [SubPages.oBairro];
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Obx(
              () {
                return PageTransitionSwitcher(
                  duration: kThemeAnimationDuration * 2,
                  reverse: controller.currentPage.contains(SubPages.descritivo),
                  layoutBuilder: (List<Widget> entries) {
                    return Stack(
                      children: entries,
                      alignment: Alignment.topCenter,
                    );
                  },
                  transitionBuilder: (child, animation, secondaryAnimation) {
                    return SharedAxisTransition(
                      fillColor: Colors.transparent,
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      child: child,
                      transitionType: SharedAxisTransitionType.horizontal,
                    );
                  },
                  child: controller.currentPage.contains(SubPages.projetistas)
                      ? const ProjetistasPage()
                      : controller.currentPage.contains(SubPages.descritivo)
                          ? const DescritivoPage()
                          : const ObairroPage(),
                );
              },
            ),
            ],
          ),
        ),
      ),
    );
  }
}
