import 'package:flutter/material.dart';
import 'package:raizes/app/components/raizes_scaffold.dart';
import 'package:raizes/app/themes/app_themes.dart';

class AmbientesCarouselView extends StatefulWidget {
  const AmbientesCarouselView({
    Key? key,
    required this.ambientes,
    required this.plantaTitulo,
    this.initialIndex = 0,
  }) : super(key: key);

  final List<Map<String, String>> ambientes;
  final String plantaTitulo;
  final int initialIndex;

  @override
  _AmbientesCarouselViewState createState() => _AmbientesCarouselViewState();
}

class _AmbientesCarouselViewState extends State<AmbientesCarouselView> {
  late PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RaizesScaffold(
      title: Text(widget.plantaTitulo),
      body: Column(
        children: [
          // Indicador de página
          if (widget.ambientes.length > 1)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.ambientes.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == index
                          ? AppColors.iconColor
                          : AppColors.iconColor.withValues(alpha: 0.3),
                    ),
                  ),
                ),
              ),
            ),

          // Carrossel de ambientes
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: widget.ambientes.length,
              itemBuilder: (context, index) {
                final ambiente = widget.ambientes[index];
                return _buildAmbientePage(ambiente);
              },
            ),
          ),

          // Navegação
          if (widget.ambientes.length > 1)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: currentIndex > 0
                        ? () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                    child: const Text('Anterior'),
                  ),
                  Text(
                    '${currentIndex + 1} de ${widget.ambientes.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: currentIndex < widget.ambientes.length - 1
                        ? () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                    child: const Text('Próximo'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAmbientePage(Map<String, String> ambiente) {
    final titulo = ambiente['titulo'] ?? '';
    final imagem = ambiente['imagem'] ?? '';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título do ambiente
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Imagem do ambiente
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagem,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_not_supported,
                              size: 64,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Imagem não encontrada',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
