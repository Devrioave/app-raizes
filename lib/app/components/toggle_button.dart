import 'package:flutter/material.dart';
import 'package:raizes/app/themes/app_themes.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({
    Key? key,
    required this.title,
    required this.toggled,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
  }) : super(key: key);
  final String title;
  final bool toggled;
  final VoidCallback onTap;
  final EdgeInsets padding;
  static const _borderRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      decoration: BoxDecoration(
        color: toggled
            ? AppColors.primaryGreen
            : AppColors.primaryGreen.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      margin: const EdgeInsets.all(4),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(_borderRadius),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(_borderRadius),
          child: Padding(
            padding: padding,
            child: Text(
              title,
              style: TextStyle(
                color: toggled ? AppColors.primaryBeige : AppColors.primaryGreen,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
