import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raizes/app/components/raizes_scaffold.dart';
import 'package:raizes/app/modules/localizacao/localizacao_controller.dart';
import 'package:raizes/app/themes/app_themes.dart';

class LocalizacaoView extends GetView<LocalizacaoController> {
  LocalizacaoView({Key? key}) : super(key: key);

  final TransformationController _transformationController = TransformationController()
    ..value = (Matrix4.identity()..scale(1.5));

  @override
  Widget build(BuildContext context) {
    return RaizesScaffold(
      title: const Text('Localização'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: InteractiveViewer(
                    transformationController: _transformationController,
                    panEnabled: true,
                    scaleEnabled: true,
                    minScale: 1.2,
                    maxScale: 4.0,
                    boundaryMargin: const EdgeInsets.all(20),
                    child: Image.asset(
                      'assets/3.0x/Localizacao.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Column(
                    children: [
                      _buildZoomButton(
                        icon: Icons.add,
                        onPressed: _zoomIn,
                      ),
                      const SizedBox(height: 8),
                      _buildZoomButton(
                        icon: Icons.remove,
                        onPressed: _zoomOut,
                      ),
                      const SizedBox(height: 8),
                      _buildZoomButton(
                        icon: Icons.center_focus_strong,
                        onPressed: _resetZoom,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Locais do entorno:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGreen,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Educação
                  _buildCategorySection(
                    title: 'Educação',
                    icon: Icons.school,
                    locations: [
                      {'name': 'Salesiano', 'time': '5 min | 9 min'},
                      {'name': 'Wizard', 'time': '14 min | 8 min'},
                      {'name': 'Grau Técnico', 'time': '13 min | 8 min'},
                      {'name': 'Unicap', 'time': '21 min | 6 min'},
                    ],
                  ),

                  // Bem-estar
                  _buildCategorySection(
                    title: 'Bem-estar',
                    icon: Icons.fitness_center,
                    locations: [
                      {'name': 'Smart Fit', 'time': '17 min | 9 min'},
                      {'name': 'Academia Biodinâmica', 'time': '10 min | 4 min'},
                      {'name': 'Corpo em Movimento', 'time': '15 min | 5 min'},
                    ],
                  ),

                  // Saúde
                  _buildCategorySection(
                    title: 'Saúde',
                    icon: Icons.local_hospital,
                    locations: [
                      {'name': 'Hospital Português', 'time': '8 min | 4 min'},
                      {'name': 'Memorial São José', 'time': '8 min | 5 min'},
                      {'name': 'Hope', 'time': '10 min | 4 min'},
                      {'name': 'Imip', 'time': '13 min | 5 min'},
                    ],
                  ),

                  // Gastronomia
                  _buildCategorySection(
                    title: 'Gastronomia',
                    icon: Icons.restaurant,
                    locations: [
                      {'name': 'Skillus', 'time': '2 min | 1 min'},
                      {'name': 'La em Casa', 'time': '7 min | 4 min'},
                      {'name': 'Ilha Gourmet', 'time': '7 min | 8 min'},
                      {'name': 'Dona Salsa', 'time': '6 min | 5 min'},
                      {'name': 'Triunfo Gourmet', 'time': '5 min | 5 min'},
                      {'name': 'Frisabor', 'time': '6 min | 3 min'},
                    ],
                  ),

                  // Comércio
                  _buildCategorySection(
                    title: 'Comércio',
                    icon: Icons.shopping_bag,
                    locations: [
                      {'name': 'Shopping Boa Vista', 'time': '14 min | 5 min'},
                      {'name': 'Cinema São Luiz', 'time': '24 min | 7 min'},
                      {'name': 'Teatro Boa Vista', 'time': '9 min | 8 min'},
                      {'name': 'Cinema Fundação Joaquim Nabuco', 'time': '14 min | 9 min'},
                      {'name': 'Drogasil', 'time': '17 min | 7 min'},
                      {'name': 'Pague Menos', 'time': '1 min | 1 min'},
                      {'name': 'Farmácia Independente', 'time': '3 min | 2 min'},
                      {'name': 'Atacado dos presentes', 'time': '19 min | 8 min'},
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection({
    required String title,
    required IconData icon,
    required List<Map<String, String>> locations,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
                    color: AppColors.lightBeige, // Bege claro da paleta
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                   color: AppColors.darkGreen, // Verde escuro da paleta
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                 color: AppColors.pureWhite,
                 size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.pureWhite,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: locations.map((location) => _buildLocationItem(
                location['name']!,
                location['time']!,
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationItem(String location, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(
            Icons.location_on,
            color: AppColors.primaryGreen,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              location,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.primaryGreen,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.pureWhite,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.primaryGreen.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Text(
              time,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildZoomButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.iconColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              color: AppColors.primaryGreen,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  void _zoomIn() {
    final Matrix4 currentMatrix = _transformationController.value;
    final Matrix4 scaleMatrix = Matrix4.diagonal3Values(1.2, 1.2, 1.0);
    _transformationController.value = scaleMatrix * currentMatrix;
  }

  void _zoomOut() {
    final Matrix4 currentMatrix = _transformationController.value;
    final Matrix4 scaleMatrix = Matrix4.diagonal3Values(0.8, 0.8, 1.0);
    _transformationController.value = scaleMatrix * currentMatrix;
  }

  void _resetZoom() {
    _transformationController.value = Matrix4.identity();
  }
}
