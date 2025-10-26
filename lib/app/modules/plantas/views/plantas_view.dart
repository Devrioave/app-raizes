import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raizes/app/components/raizes_scaffold.dart';
import 'package:raizes/app/themes/app_themes.dart';
import 'package:raizes/app/modules/plantas/controller/plantas_controller.dart';

class PlantasView extends GetView<PlantasController> {
  const PlantasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTab = 0.obs;

    return RaizesScaffold(
      title: const Text("Plantas"),
      body: Column(
        children: [
            // Título e badge
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "Tipologias",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.darkGreen,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.lightBeige,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "1ª fase",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // TabBar customizada
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              color: AppColors.softWhite,
              child: Obx(() => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTabButton(
                      "Gilvan Samico",
                      currentTab.value == 0,
                      () => currentTab.value = 0,
                    ),
                    const SizedBox(width: 8),
                    _buildTabButton(
                      "Lula Cardoso Ayres",
                      currentTab.value == 1,
                      () => currentTab.value = 1,
                    ),
                    const SizedBox(width: 8),
                    _buildTabButton(
                      "Cícero Dias",
                      currentTab.value == 2,
                      () => currentTab.value = 2,
                    ),
                  ],
                ),
              )),
            ),

            // Conteúdo
            Expanded(
              child: Obx(() {
                switch (currentTab.value) {
                  case 0:
                    return _buildPlantasListView(_getGilvanSamicoPlants());
                  case 1:
                    return _buildPlantasListView(_getLulaCardosoPlants());
                  case 2:
                    return _buildPlantasListView(_getCiceroDiasPlants());
                  default:
                    return _buildPlantasListView(_getGilvanSamicoPlants());
                }
              }),
            ),
          ],
        ),
      );
  }

  Widget _buildTabButton(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : AppColors.darkGreen.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.darkGreen,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildPlantasListView(List<PlantaData> plantas) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: plantas.length,
      itemBuilder: (context, index) {
        final planta = plantas[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card da planta
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título
                    Text(
                      planta.titulo,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGreen,
                      ),
                    ),

                    // Área
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

                    const SizedBox(height: 16),

                    // Se tem subImagens (cobertura duplex), mostra todas
                    if (planta.subImagens != null && planta.subImagens!.isNotEmpty) ...[
                      ...planta.subImagens!.map((subImg) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subImg.subtitulo,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryGreen,
                              ),
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () => _showFullScreenImage(subImg.imagem, '${planta.titulo} - ${subImg.subtitulo}'),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  subImg.imagem,
                                  width: double.infinity,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 200,
                                      color: Colors.grey[200],
                                      child: const Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.image_not_supported, size: 48, color: Colors.grey),
                                            SizedBox(height: 8),
                                            Text('Imagem não encontrada', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      }).toList(),
                    ] else ...[
                      // Imagem única
                      GestureDetector(
                        onTap: () => _showFullScreenImage(planta.imagem, planta.titulo),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            planta.imagem,
                            width: double.infinity,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 200,
                                color: Colors.grey[200],
                                child: const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.image_not_supported, size: 48, color: Colors.grey),
                                      SizedBox(height: 8),
                                      Text('Imagem não encontrada', style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],

                    // Botão "Veja as imagens"
                    if (planta.ambientes.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      const Text(
                        'Veja as imagens:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.iconColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...planta.ambientes.asMap().entries.map((entry) {
                        final idx = entry.key;
                        final ambiente = entry.value;
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundColor: AppColors.primaryGreen,
                            child: Text(
                              '${idx + 1}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(ambiente.titulo),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () => _showAmbientesCarousel(planta.ambientes, idx),
                        );
                      }).toList(),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  void _showFullScreenImage(String imagePath, String title) {
    Get.to(
      () => Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                panEnabled: true,
                scaleEnabled: true,
                minScale: 0.5,
                maxScale: 5.0,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 16,
              child: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 30),
                    onPressed: () => Get.back(),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.7),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAmbientesCarousel(List<AmbienteData> ambientes, int initialIndex) {
    Get.to(
      () => Scaffold(
        backgroundColor: Colors.black,
        body: PageView.builder(
          controller: PageController(initialPage: initialIndex),
          itemCount: ambientes.length,
          itemBuilder: (context, index) {
            final ambiente = ambientes[index];
            return Stack(
              children: [
                Center(
                  child: InteractiveViewer(
                    panEnabled: true,
                    scaleEnabled: true,
                    minScale: 0.5,
                    maxScale: 5.0,
                    child: Image.asset(
                      ambiente.imagem,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: SafeArea(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white, size: 30),
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7),
                        ],
                      ),
                    ),
                    child: SafeArea(
                      child: Column(
                        children: [
                          Text(
                            ambiente.titulo,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${index + 1} de ${ambientes.length}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // GILVAN SAMICO - 9 plantas
  List<PlantaData> _getGilvanSamicoPlants() {
    return [
      PlantaData(
        titulo: '0009 - Pavimento Tipo',
        imagem: 'assets/images/plantas_v2/GILVAN SAMICO/RAIZ_IMG_PH_BE_0009_PAV. TIPO.jpg',
      ),
      PlantaData(
        titulo: '0010 - Cobertura Térreo',
        imagem: 'assets/images/plantas_v2/GILVAN SAMICO/RAIZ_IMG_PH_BE_0010_COBERTURA TÉRREO.jpg',
      ),
      PlantaData(
        titulo: '0011 - Cobertura 1º Pavimento',
        imagem: 'assets/images/plantas_v2/GILVAN SAMICO/RAIZ_IMG_PH_BE_0011_COBERTURA1 PAV.jpg',
      ),
      PlantaData(
        titulo: 'Tipo Apto 01',
        area: '97m²',
        imagem: 'assets/images/plantas_v2/GILVAN SAMICO/RAIZ_IMG_PH_BE_TIPO_APTO 01 97m².jpg',
        ambientes: [
          AmbienteData(
            titulo: 'Sala, Cozinha e Terraço',
            imagem: 'assets/images/areas_privativa/BLOCO E - 92m²/RAIZ_IMG_AP_BE_0601_SALA, COZINHA E TERRAÇO.jpg',
          ),
        ],
      ),
      PlantaData(
        titulo: 'Tipo Apto 02',
        area: '95m²',
        imagem: 'assets/images/plantas_v2/GILVAN SAMICO/RAIZ_IMG_PH_BE_TIPO_APTO 02 95m².jpg',
        ambientes: [
          AmbienteData(
            titulo: 'Jantar, Estar e Terraço',
            imagem: 'assets/images/areas_privativa/BLOCO E - 92m² (DECORADO)/RAIZ_IMG_AP_BE_0602_JANTAR, ESTAR E TERRAÇO.jpg',
          ),
          AmbienteData(
            titulo: 'Suíte Master',
            imagem: 'assets/images/areas_privativa/BLOCO E - 92m² (DECORADO)/RAIZ_IMG_AP_BE_0602_SUÍTE MASTER.jpg',
          ),
          AmbienteData(
            titulo: 'Demi-suíte 02 (Quarto Menino)',
            imagem: 'assets/images/areas_privativa/BLOCO E - 92m² (DECORADO)/RAIZ_IMG_AP_BE_0602_DEMI-SUÍTE 02 (QUARTO MENINO).jpg',
          ),
        ],
      ),
      PlantaData(
        titulo: 'Cobertura Duplex 2901',
        area: '194m²',
        imagem: '', // Não usado quando tem subImagens
        subImagens: [
          SubImagem(
            subtitulo: 'Térreo',
            imagem: 'assets/images/plantas_v2/GILVAN SAMICO/RAIZ_IMG_PH_BE_2901_COBERTURA DUPLEX TÉRREO 194m².jpg',
          ),
          SubImagem(
            subtitulo: '1º pavimento',
            imagem: 'assets/images/plantas_v2/GILVAN SAMICO/RAIZ_IMG_PH_BE_2901_COBERTURA DUPLEX 1°PAV 194m².jpg',
          ),
        ],
        ambientes: [
          AmbienteData(
            titulo: 'Estar, Jantar, Terraço e Cozinha',
            imagem: 'assets/images/areas_privativa/BLOCO E - Cobertura Duplex/RAIZ_IMG_AP_BE_2902_ESTAR, JANTAR, TERRAÇO E COZINHA.jpg',
          ),
          AmbienteData(
            titulo: 'Suíte Master',
            imagem: 'assets/images/areas_privativa/BLOCO E - Cobertura Duplex/RAIZ_IMG_AP_BE_2902_SUÍTE MASTER.jpg',
          ),
        ],
      ),
      PlantaData(
        titulo: 'Cobertura Duplex 2902',
        area: '190m²',
        imagem: '', // Não usado quando tem subImagens
        subImagens: [
          SubImagem(
            subtitulo: 'Térreo',
            imagem: 'assets/images/plantas_v2/GILVAN SAMICO/RAIZ_IMG_PH_BE_2902_COBERTURA DUPLEX TÉRREO 190m².jpg',
          ),
          SubImagem(
            subtitulo: '1º pavimento',
            imagem: 'assets/images/plantas_v2/GILVAN SAMICO/RAIZ_IMG_PH_BE_2902_COBERTURA DUPLEX 1°PAV 190m².jpg',
          ),
        ],
      ),
    ];
  }

  // LULA CARDOSO AYRES - 3 plantas
  List<PlantaData> _getLulaCardosoPlants() {
    return [
      PlantaData(
        titulo: '0012 - Pavimento Tipo',
        imagem: 'assets/images/plantas_v2/LULA CARDOSO AYRES/RAIZ_IMG_PH_BF_0012_PAV. TIPO.jpg',
      ),
      PlantaData(
        titulo: 'Tipo Apto 02',
        area: '58m²',
        imagem: 'assets/images/plantas_v2/LULA CARDOSO AYRES/RAIZ_IMG_PH_BF_TIPO_APTO 02 58m².jpg',
        ambientes: [
          AmbienteData(
            titulo: 'Estar, Jantar e Cozinha',
            imagem: 'assets/images/areas_privativa/BLOCO F - 56m² (DECORADO)/RAIZ_IMG_AP_BF_0602_ESTAR, JANTAR E COZINHA.jpg',
          ),
          AmbienteData(
            titulo: 'Quarto Criança',
            imagem: 'assets/images/areas_privativa/BLOCO F - 56m² (DECORADO)/RAIZ_IMG_AP_BF_0602_QUARTO CRIANÇA.jpg',
          ),
          AmbienteData(
            titulo: 'Suíte',
            imagem: 'assets/images/areas_privativa/BLOCO F - 56m² (DECORADO)/RAIZ_IMG_AP_BF_0602_SUÍTE.jpg',
          ),
        ],
      ),
      PlantaData(
        titulo: 'Tipo Apto 05',
        area: '51,9m²',
        imagem: 'assets/images/plantas_v2/LULA CARDOSO AYRES/RAIZ_IMG_PH_BF_TIPO_APTO 05 51,9m².jpg',
        ambientes: [
          AmbienteData(
            titulo: 'Estar, Jantar, Terraço e Cozinha',
            imagem: 'assets/images/areas_privativa/BLOCO F - 48 m²/RAIZ_IMG_AP_BF_0605_ESTAR, JANTAR, TERRAÇO E COZINHA.jpg',
          ),
        ],
      ),
    ];
  }

  // CÍCERO DIAS - 4 plantas
  List<PlantaData> _getCiceroDiasPlants() {
    return [
      PlantaData(
        titulo: '0016 - Pavimento Tipo',
        imagem: 'assets/images/plantas_v2/CÍCERO DIAS/RAIZ_IMG_PH_BH_0016_PAV. TIPO.png',
      ),
      PlantaData(
        titulo: '0017 - Pavimento Tipo Cobertura',
        imagem: 'assets/images/plantas_v2/CÍCERO DIAS/RAIZ_IMG_PH_BH_0017_PAV. TIPO COBERTURA.png',
      ),
      PlantaData(
        titulo: 'Tipo Apto 01',
        area: '74m²',
        imagem: 'assets/images/plantas_v2/CÍCERO DIAS/RAIZ_IMG_PH_BH_TIPO_APTO 01 74m².png',
      ),
      PlantaData(
        titulo: '3101 - Cobertura 01',
        imagem: 'assets/images/plantas_v2/CÍCERO DIAS/RAIZ_IMG_PH_BH_3101_COBERTURA 01.png',
      ),
    ];
  }
}

class PlantaData {
  final String titulo;
  final String? area;
  final String imagem;
  final List<AmbienteData> ambientes;
  final List<SubImagem>? subImagens; // Para coberturas duplex com múltiplas plantas

  PlantaData({
    required this.titulo,
    this.area,
    required this.imagem,
    this.ambientes = const [],
    this.subImagens,
  });
}

class SubImagem {
  final String subtitulo;
  final String imagem;

  SubImagem({
    required this.subtitulo,
    required this.imagem,
  });
}

class AmbienteData {
  final String titulo;
  final String imagem;

  AmbienteData({
    required this.titulo,
    required this.imagem,
  });
}
