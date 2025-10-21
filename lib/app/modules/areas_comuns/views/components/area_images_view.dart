import 'package:flutter/material.dart';
import 'package:raizes/app/modules/areas_comuns/models/data.dart';
import 'package:raizes/app/modules/areas_comuns/models/area_comum.dart';
import 'package:raizes/app/themes/app_themes.dart';

class AreaImagesView extends StatefulWidget {
  const AreaImagesView({Key? key, this.initialImgPath}) : super(key: key);
  final String? initialImgPath;

  @override
  State<AreaImagesView> createState() => _AreaImagesViewState();
}

class _AreaImagesViewState extends State<AreaImagesView> {
  late PageController _pageController;
  late List<Local> locais;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Obter todas as áreas com imagens
    locais = areasComuns.expand((element) => element.locais).toList();
    locais.removeWhere((local) => local.imgPath == null);

    // Encontrar índice inicial
    var initialImgIndex = locais.indexWhere((local) => local.imgPath == widget.initialImgPath);
    if (initialImgIndex == -1) initialImgIndex = 0;

    currentIndex = initialImgIndex;
    _pageController = PageController(initialPage: initialImgIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _previousImage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextImage() {
    if (currentIndex < locais.length - 1) {
      setState(() {
        currentIndex++;
      });
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (locais.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text('Áreas Comuns'),
        ),
        body: const Center(
          child: Text(
            'Nenhuma imagem disponível',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
    }

    final currentLocal = locais[currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Áreas Comuns',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Header com informações da área atual
          Container(
            color: AppColors.primaryGreen,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Navegação simples
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Botão Anterior
                      IconButton(
                        onPressed: currentIndex > 0 ? _previousImage : null,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: currentIndex > 0
                              ? AppColors.primaryBeige
                              : AppColors.primaryBeige.withValues(alpha: 0.3),
                          size: 28,
                        ),
                      ),

                      // Contador de imagens
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              currentLocal.description,
                              style: const TextStyle(
                                color: AppColors.primaryBeige,
                                height: 1.2,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${currentIndex + 1} de ${locais.length}',
                              style: const TextStyle(
                                color: AppColors.primaryBeige,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Imagem meramente ilustrativa",
                              style: TextStyle(
                                color: AppColors.primaryBeige,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Botão Próximo
                      IconButton(
                        onPressed: currentIndex < locais.length - 1 ? _nextImage : null,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: currentIndex < locais.length - 1
                              ? AppColors.primaryBeige
                              : AppColors.primaryBeige.withValues(alpha: 0.3),
                          size: 28,
                        ),
                      ),
                    ],
                  ),

                  // Barra de progresso
                  const SizedBox(height: 12),
                  Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBeige.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: (currentIndex + 1) / locais.length,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryBeige,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Carrossel de imagens
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: locais.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final local = locais[index];
                    return InteractiveViewer(
                      panEnabled: true,
                      scaleEnabled: true,
                      minScale: 0.5,
                      maxScale: 5.0,
                      child: Image.asset(
                        local.imgPath ?? '',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error,
                                  size: 64,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Erro ao carregar imagem',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),

                // Botões de navegação sobrepostos nas laterais
                Positioned(
                  left: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: currentIndex > 0
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.5),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: _previousImage,
                              icon: const Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),

                Positioned(
                  right: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: currentIndex < locais.length - 1
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.5),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: _nextImage,
                              icon: const Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
