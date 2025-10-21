import 'package:flutter/material.dart';
import 'package:raizes/app/themes/app_themes.dart';

class PlantasInteractiveButton extends StatelessWidget {
  const PlantasInteractiveButton({
    Key? key,
    required this.number,
    required this.relativeOffset,
    required this.onPressed,
  }) : super(key: key);

  static const _size = 32.0;

  final String number;
  final FractionalOffset relativeOffset;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // centralizar widget subtraindo a metade do seu tamanho na coordenada
      final halfWidthOffsetPercent = (_size / constraints.maxWidth) / 2;
      final halfHeightOffsetPercent = (_size / constraints.maxHeight) / 2;
      return Align(
        alignment: FractionalOffset(
          relativeOffset.dx - halfWidthOffsetPercent,
          relativeOffset.dy - halfHeightOffsetPercent,
        ),
        child: _buildItem(context),
      );
    });
  }

  Widget _buildItem(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.iconColor,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
