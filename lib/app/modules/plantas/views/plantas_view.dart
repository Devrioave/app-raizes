import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raizes/app/components/raizes_scaffold.dart';
import 'package:raizes/app/components/toggle_button.dart';
import 'package:raizes/app/components/vertical_appear.dart';
import 'package:raizes/app/themes/app_themes.dart';
import 'package:raizes/app/modules/plantas/controller/plantas_controller.dart';
import 'package:raizes/app/modules/plantas/views/components/ambientes_carousel_view.dart';
import 'package:raizes/app/modules/plantas/views/components/ambiente_tile.dart';

class AmbienteInfo {
  final String titulo;
  final String imagem;
  final double px; // posição X relativa (0.0 a 1.0)
  final double py; // posição Y relativa (0.0 a 1.0)

  AmbienteInfo({
    required this.titulo,
    required this.imagem,
    required this.px,
    required this.py,
  });
}

enum BlocoTab { blocoE, blocoF, blocoI }

class PlantaInfo {
  final String titulo;
  final String imagem;
  final String? area;

  PlantaInfo({required this.titulo, required this.imagem, this.area});
}

class PlantasView extends GetView<PlantasController> {
  const PlantasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RxList<BlocoTab> currentTab = <BlocoTab>[BlocoTab.blocoE].obs;

    return RaizesScaffold(
      title: const Text("Plantas"),
      body: Column(
        children: [
          // Título principal
          AppearAnimation(
            duration: kThemeAnimationDuration * 2,
            child: const Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                "PLANTAS HUMANIZADAS POR TORRE",
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Obx(() {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                ToggleButton(
                        title: "Gilvan Samico",
                        toggled: currentTab.contains(BlocoTab.blocoE),
                  onTap: () {
                          currentTab.value = [BlocoTab.blocoE];
                  },
                ),
                ToggleButton(
                        title: "Lula Cardoso",
                        toggled: currentTab.contains(BlocoTab.blocoF),
                  onTap: () {
                          currentTab.value = [BlocoTab.blocoF];
                        },
                      ),
                      ToggleButton(
                        title: "BLOCO I",
                        toggled: currentTab.contains(BlocoTab.blocoI),
                        onTap: () {
                          currentTab.value = [BlocoTab.blocoI];
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),

          // Conteúdo das abas com PageView
          Expanded(
                  child: Obx(() {
              return AppearAnimation(
                      duration: kThemeAnimationDuration * 2,
                child: _buildTabContentWithPageView(currentTab.first),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContentWithPageView(BlocoTab tab) {
    final plantas = _getPlantasForTab(tab);

    return PageView.builder(
                        scrollDirection: Axis.vertical,
      itemCount: plantas.length,
                        itemBuilder: (context, index) {
        final planta = plantas[index];
        final isLast = index == plantas.length - 1;

                          return Column(
          children: [
                         Expanded(
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                 child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    // Título da planta
                    Text(
                      planta.titulo,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGreen,
                      ),
                    ),
                    if (planta.area != null) ...[
                      const SizedBox(height: 4),
                                        Text(
                        planta.area!,
                                          style: TextStyle(
                          fontSize: 16,
                          color: AppColors.darkGray.withValues(alpha: 0.8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                                         ],
                                                               const SizedBox(height: 8),

                     // Lista de ambientes (se disponível)
                     if (_hasAreasPrivativas(planta.titulo, tab)) ...[
                       const Padding(
                         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                         child: Text(
                           'Ambientes disponíveis:',
                           style: TextStyle(
                             fontSize: 16,
                             fontWeight: FontWeight.bold,
                             color: AppColors.iconColor,
                           ),
                         ),
                       ),
                       ..._buildAmbientesList(planta.titulo, tab),
                       const SizedBox(height: 12),
                     ],

                     // Imagem da planta com números sobrepostos
                     Expanded(
                       child: Container(
                         width: double.infinity,
                         decoration: BoxDecoration(
                           color: AppColors.softWhite,
                           borderRadius: BorderRadius.circular(12),
                           boxShadow: [
                             BoxShadow(
                               color: Colors.black.withValues(alpha: 0.1),
                               blurRadius: 8,
                               offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(12),
                           child: Container(
                             color: AppColors.softWhite,
                             child: Stack(
                               children: [
                                 // Imagem da planta
                                 GestureDetector(
                                   onTap: () => _showFullScreenImage(planta.imagem, planta.titulo),
                                      child: Image.asset(
                                     planta.imagem,
                                     fit: BoxFit.contain,
                                     width: double.infinity,
                                     height: double.infinity,
                                     errorBuilder: (context, error, stackTrace) {
                                       return Container(
                                         color: AppColors.softWhite,
                                         child: Center(
                                           child: Column(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               Icon(
                                                 Icons.image_not_supported,
                                                 size: 48,
                                                 color: AppColors.iconColor.withValues(alpha: 0.5),
                                               ),
                                               const SizedBox(height: 8),
                                               Text(
                                                 'Imagem não encontrada',
                                                 style: TextStyle(
                                                   color: AppColors.iconColor.withValues(alpha: 0.7),
                                                   fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                                       );
                                     },
                                   ),
                                 ),

                                 // Números clicáveis sobrepostos (desabilitado temporariamente)
                                 // ..._buildAmbientesOverlay(planta.titulo, tab),
                               ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                  ],
                                    ),
                                  ),
                                ),

            // Indicador de próxima página
            if (!isLast)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.iconColor,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.keyboard_arrow_up,
                    size: 20,
                    color: AppColors.softWhite,
                                                    ),
                                                  ),
                                                ),
                                              ],
        );
      },
    );
  }

    List<PlantaInfo> _getPlantasForTab(BlocoTab tab) {
    switch (tab) {
      case BlocoTab.blocoE:
        return [
          PlantaInfo(
            titulo: "Pavimento Tipo",
            imagem: "assets/images/plantas/BLOCO E/RAIZ_IMG_PH_BE_0009_PAV. TIPO.jpg",
          ),
          PlantaInfo(
            titulo: "Apartamento 01",
            imagem: "assets/images/plantas/BLOCO E/RAIZ_IMG_PH_BE_TIPO_APTO 01 97m².jpg",
            area: "97m²",
          ),
          PlantaInfo(
            titulo: "Apartamento 02",
            imagem: "assets/images/plantas/BLOCO E/RAIZ_IMG_PH_BE_TIPO_APTO 02 95m².jpg",
            area: "95m²",
          ),
          PlantaInfo(
            titulo: "Cobertura Duplex 2901 - Térreo",
            imagem: "assets/images/plantas/BLOCO E/RAIZ_IMG_PH_BE_2901_COBERTURA DUPLEX TÉRREO 194m².jpg",
            area: "194m²",
          ),
          PlantaInfo(
            titulo: "Cobertura Duplex 2901 - 1°PAV",
            imagem: "assets/images/plantas/BLOCO E/RAIZ_IMG_PH_BE_2901_COBERTURA DUPLEX 1°PAV 194m².jpg",
            area: "194m²",
          ),
          PlantaInfo(
            titulo: "Cobertura Duplex 2902 - Térreo",
            imagem: "assets/images/plantas/BLOCO E/RAIZ_IMG_PH_BE_2902_COBERTURA DUPLEX TÉRREO 190m².jpg",
            area: "190m²",
          ),
          PlantaInfo(
            titulo: "Cobertura Duplex 2902 - 1°PAV",
            imagem: "assets/images/plantas/BLOCO E/RAIZ_IMG_PH_BE_2902_COBERTURA DUPLEX 1°PAV 190m².jpg",
            area: "190m²",
          ),
        ];

      case BlocoTab.blocoF:
        return [
          PlantaInfo(
            titulo: "Pavimento Tipo",
            imagem: "assets/images/plantas/BLOCO F/RAIZ_IMG_PH_BF_0012_PAV. TIPO.jpg",
          ),
          PlantaInfo(
            titulo: "Apartamento 02",
            imagem: "assets/images/plantas/BLOCO F/RAIZ_IMG_PH_BF_TIPO_APTO 02 58m².jpg",
            area: "58m²",
          ),
          PlantaInfo(
            titulo: "Apartamento 05",
            imagem: "assets/images/plantas/BLOCO F/RAIZ_IMG_PH_BF_TIPO_APTO 05 51,9m².jpg",
            area: "51,9m²",
          ),
        ];


      case BlocoTab.blocoI:
        return [
          PlantaInfo(
            titulo: "Pavimento Tipo",
            imagem: "assets/images/plantas/BLOCO I/RAIZ_IMG_PH_BI_0018_PAV. TIPO.jpg",
          ),
        ];
    }
  }

  bool _hasAreasPrivativas(String plantaTitulo, BlocoTab tab) {
    // Verifica se existe áreas privativas para esta planta específica
    final areasPrivativas = _getAreasPrivativasForPlanta(plantaTitulo, tab);
    return areasPrivativas.isNotEmpty;
  }

      List<Widget> _buildAmbientesList(String plantaTitulo, BlocoTab tab) {
    final areasPrivativas = _getAreasPrivativasForPlanta(plantaTitulo, tab);

    return areasPrivativas.asMap().entries.map((entry) {
      final index = entry.key;
      final ambiente = entry.value;

      return AmbienteTile(
        number: (index + 1).toString(),
        title: ambiente.titulo,
        onTap: () => _showAmbientesCarousel(plantaTitulo, tab, index),
      );
    }).toList();
  }


    void _showAmbientesCarousel(String plantaTitulo, BlocoTab tab, int initialIndex) {
    final areasPrivativas = _getAreasPrivativasForPlanta(plantaTitulo, tab);

    // Converter AmbienteInfo para Map para o carrossel
    final ambientesMap = areasPrivativas.map((ambiente) => {
      'titulo': ambiente.titulo,
      'imagem': ambiente.imagem,
    }).toList();

    Get.to(
      () => AmbientesCarouselView(
        ambientes: ambientesMap,
        plantaTitulo: plantaTitulo,
        initialIndex: initialIndex,
      ),
      transition: Transition.fadeIn,
    );
  }

  List<AmbienteInfo> _getAreasPrivativasForPlanta(String plantaTitulo, BlocoTab tab) {
    switch (tab) {
      case BlocoTab.blocoE:
        if (plantaTitulo.contains('Apartamento 01') || plantaTitulo.contains('97m²')) {
          return [
            AmbienteInfo(
              titulo: 'Sala, Cozinha e Terraço',
              imagem: 'assets/images/areas_privativa/BLOCO E - 92m²/RAIZ_IMG_AP_BE_0601_SALA, COZINHA E TERRAÇO.jpg',
              px: 0.25, // área social esquerda
              py: 0.55, // centro-inferior
            ),
          ];
        } else if (plantaTitulo.contains('Apartamento 02') || plantaTitulo.contains('95m²')) {
          return [
            AmbienteInfo(
              titulo: 'Jantar, Estar e Terraço',
              imagem: 'assets/images/areas_privativa/BLOCO E - 92m² (DECORADO)/RAIZ_IMG_AP_BE_0602_JANTAR, ESTAR E TERRAÇO.jpg',
              px: 0.25, // área social esquerda
              py: 0.55, // centro-inferior
            ),
            AmbienteInfo(
              titulo: 'Suíte Master',
              imagem: 'assets/images/areas_privativa/BLOCO E - 92m² (DECORADO)/RAIZ_IMG_AP_BE_0602_SUÍTE MASTER.jpg',
              px: 0.75, // lado direito
              py: 0.25, // parte superior
            ),
            AmbienteInfo(
              titulo: 'Demi-suíte 02 (Quarto Menino)',
              imagem: 'assets/images/areas_privativa/BLOCO E - 92m² (DECORADO)/RAIZ_IMG_AP_BE_0602_DEMI-SUÍTE 02 (QUARTO MENINO).jpg',
              px: 0.75, // lado direito
              py: 0.75, // parte inferior
            ),
          ];
        } else if (plantaTitulo.contains('Cobertura Duplex')) {
          return [
            AmbienteInfo(
              titulo: 'Estar, Jantar, Terraço e Cozinha',
              imagem: 'assets/images/areas_privativa/BLOCO E - Cobertura Duplex/RAIZ_IMG_AP_BE_2902_ESTAR, JANTAR, TERRAÇO E COZINHA.jpg',
              px: 0.25, // área social esquerda
              py: 0.55, // centro
            ),
            AmbienteInfo(
              titulo: 'Suíte Master',
              imagem: 'assets/images/areas_privativa/BLOCO E - Cobertura Duplex/RAIZ_IMG_AP_BE_2902_SUÍTE MASTER.jpg',
              px: 0.75, // lado direito
              py: 0.25, // parte superior
            ),
          ];
        }
        break;

            case BlocoTab.blocoF:
        if (plantaTitulo.contains('Apartamento 02') || plantaTitulo.contains('58m²')) {
          return [
            AmbienteInfo(
              titulo: 'Estar, Jantar e Cozinha',
              imagem: 'assets/images/areas_privativa/BLOCO F - 56m² (DECORADO)/RAIZ_IMG_AP_BF_0602_ESTAR, JANTAR E COZINHA.jpg',
              px: 0.35, // área social central-esquerda
              py: 0.6,  // centro-inferior
            ),
            AmbienteInfo(
              titulo: 'Quarto Criança',
              imagem: 'assets/images/areas_privativa/BLOCO F - 56m² (DECORADO)/RAIZ_IMG_AP_BF_0602_QUARTO CRIANÇA.jpg',
              px: 0.8,  // lado direito
              py: 0.7,  // parte inferior
            ),
            AmbienteInfo(
              titulo: 'Suíte',
              imagem: 'assets/images/areas_privativa/BLOCO F - 56m² (DECORADO)/RAIZ_IMG_AP_BF_0602_SUÍTE.jpg',
              px: 0.8,  // lado direito
              py: 0.3,  // parte superior
            ),
          ];
        } else if (plantaTitulo.contains('Apartamento 05') || plantaTitulo.contains('51,9m²')) {
          return [
            AmbienteInfo(
              titulo: 'Estar, Jantar, Terraço e Cozinha',
              imagem: 'assets/images/areas_privativa/BLOCO F - 48 m²/RAIZ_IMG_AP_BF_0605_ESTAR, JANTAR, TERRAÇO E COZINHA.jpg',
              px: 0.4,  // área social central
              py: 0.5,  // centro
            ),
          ];
        }
        break;

      case BlocoTab.blocoI:
        // Não há áreas privativas para estes blocos
        break;
    }

    return [];
  }

  void _showFullScreenImage(String imagePath, String title) {
    Get.to(
      () => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: InteractiveViewer(
            panEnabled: true,
            scaleEnabled: true,
            minScale: 0.5,
            maxScale: 5.0,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        size: 64,
                        color: AppColors.softWhite,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Erro ao carregar imagem',
                        style: TextStyle(
                          color: AppColors.softWhite,
                          fontSize: 18,
                                  ),
                                ),
                            ],
                  ),
                          );
                        },
                      ),
                ),
            ),
      ),
      transition: Transition.fadeIn,
    );
  }
}
