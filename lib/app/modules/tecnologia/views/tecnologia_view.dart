import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raizes/app/components/raizes_scaffold.dart';
import 'package:raizes/app/components/toggle_button.dart';
import 'package:raizes/app/components/vertical_appear.dart';
import 'package:raizes/app/themes/app_themes.dart';
import 'package:raizes/app/modules/tecnologia/controller/home_controller.dart';

enum TecnologiaTab { seguranca, sustentabilidade, tecnologia }

class TecnologiaView extends GetView<TecnologiaController> {
  const TecnologiaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RxList<TecnologiaTab> currentTab = <TecnologiaTab>[TecnologiaTab.seguranca].obs;

    return RaizesScaffold(
      title: const Text("Tecnologia"),
      body: SingleChildScrollView(
        child: Column(
        children: [
            // Título principal
            AppearAnimation(
              duration: kThemeAnimationDuration * 2,
              child: const Padding(
                padding: EdgeInsets.all(24),
            child: Text(
                  "DIFERENCIAIS DE TECNOLOGIA E INOVAÇÃO",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: AppColors.darkGreen,
                  ),
                ),
          ),
            ),

            // Botões de navegação das abas
            AppearAnimation(
              duration: kThemeAnimationDuration * 2,
              delay: kThemeAnimationDuration,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Obx(() {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ToggleButton(
                          title: "SEGURANÇA E CONFORTO",
                          toggled: currentTab.contains(TecnologiaTab.seguranca),
                          onTap: () {
                            currentTab.value = [TecnologiaTab.seguranca];
                          },
                              ),
                        ToggleButton(
                          title: "SUSTENTABILIDADE",
                          toggled: currentTab.contains(TecnologiaTab.sustentabilidade),
                          onTap: () {
                            currentTab.value = [TecnologiaTab.sustentabilidade];
                          },
                              ),
                        ToggleButton(
                          title: "TECNOLOGIA",
                          toggled: currentTab.contains(TecnologiaTab.tecnologia),
                          onTap: () {
                            currentTab.value = [TecnologiaTab.tecnologia];
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            // Conteúdo das abas
            Obx(() {
              return AppearAnimation(
                duration: kThemeAnimationDuration * 2,
                child: _buildTabContent(currentTab.value.first),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(TecnologiaTab tab) {
    switch (tab) {
      case TecnologiaTab.seguranca:
        return _buildSegurancaTab();
      case TecnologiaTab.sustentabilidade:
        return _buildSustentabilidadeTab();
      case TecnologiaTab.tecnologia:
        return _buildTecnologiaTab();
    }
  }

  Widget _buildSegurancaTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Imagem de Segurança e Conforto
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/seguranca_e_conforto.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Lista de itens
          _buildItemList([
            'Eclusa de passagem de pedestres: moradores do residencial tem acesso interno e exclusivo para o Colégio Salesiano e para o empresarial',
            'Acesso para prestadores de serviço com cadastro biométrico e controle de fluxo',
            'Local de entrega de encomendas e comida resguardado e protegido',
            'Vagas largas com 2,30m',
            'Guarita blindada com clausura de segurança',
            'Padaria com operação diária',
          ]),
        ],
      ),
    );
  }

  Widget _buildSustentabilidadeTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Imagem de Sustentabilidade
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/sustentabilidade.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Lista de itens
          _buildItemList([
            'Mais de 10.000 metros quadrados de área de verde',
            'Plantio de árvores frutíferas e nativas',
            'Reuso de água pluvial para irrigação',
            'Sistema de irrigação automatizado nas áreas comuns',
            'Espaço para coleta seletiva',
          ]),
        ],
      ),
    );
  }

  Widget _buildTecnologiaTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
        child: Column(
        children: [
          // Imagem de Tecnologia
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/tecnologia.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Lista de itens
          _buildItemList([
            'Preparação para CFTV nas áreas comuns',
            'Infraestrutura para eletrificação de 30% das vagas',
            'Reconhecimento facial nos acessos externos',
            'Reconhecimento de placa de carros de moradores',
          ]),
        ],
      ),
    );
  }

  Widget _buildItemList(List<String> items) {
    return Column(
      children: items.map((item) => _buildListItem(item)).toList(),
    );
  }

  Widget _buildListItem(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 6, right: 12),
            decoration: const BoxDecoration(
              color: AppColors.iconColor,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.darkGray,
                height: 1.4,
              ),
            ),
        ),
        ],
      ),
    );
  }
}
