import 'package:flutter/material.dart';
import 'package:raizes/app/components/loop_animation_builder.dart';
import 'package:raizes/app/themes/app_themes.dart';

class InteractiveButton extends StatelessWidget {
  const InteractiveButton({
    Key? key,
    required this.name,
    required this.relativeOffset,
    this.visible = true,
    this.onPressed,
  }) : super(key: key);

  static const _size = 32.0;

  final String name;
  final FractionalOffset relativeOffset;
  final bool visible;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // centralizar widget subtraindo a metado do seu tamanho na coordenada
      final halfWidthOffsetPercent = (_size / constraints.maxWidth) / 2;
      final halfHeightOffsetPercent = (_size / constraints.maxHeight) / 2;
      return Align(
        alignment: FractionalOffset(
          relativeOffset.dx - halfWidthOffsetPercent,
          relativeOffset.dy - halfHeightOffsetPercent,
        ),
        child: AnimatedSwitcher(
          duration: kThemeAnimationDuration * 2,
          child: visible
              ? onPressed != null
                  ? LoopAnimationBuilder(
                      duration: const Duration(seconds: 1),
                      builder: (context, value, _) {
                        // 0<0.5 mapeado para 0 -> 1
                        // 0.5<=1 mapeado para 1 -> 0
                        value =
                            (value > 0.5 ? (0.5 - (value - 0.5)) : value) * 2;
                        return _buildItem(context, value);
                      },
                    )
                  : _buildItem(context, 0)
              : const SizedBox.shrink(),
        ),
      );
    });
  }

  Widget _buildItem(BuildContext context, double paddingIncrement) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: _size,
        height: _size,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: onPressed == null
                  ? AppColors.mediumGray
                  : AppColors.primaryGreen,
            ),
            padding: EdgeInsets.all(4 + 2 * paddingIncrement),
            child: Transform.translate(
              offset: const Offset(0, 1),
              child: Text(
                name.padLeft(2, '0'),
                style: TextStyle(
                    color: onPressed == null
                        ? AppColors.pureWhite
                        : AppColors.pureWhite,
                    fontSize: 9,
                    height: 1,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
