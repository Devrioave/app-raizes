import 'package:flutter/material.dart';
import 'package:raizes/app/themes/app_themes.dart';

class AmbienteTile extends StatelessWidget {
  const AmbienteTile({
    Key? key,
    required this.number,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String number;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: onTap == null
                      ? AppColors.iconColor.withValues(alpha: 0.5)
                      : AppColors.iconColor,
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.all(3),
              child: Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: onTap == null
                      ? AppColors.iconColor.withValues(alpha: 0.5)
                      : AppColors.iconColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    number,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.darkGray,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            if (onTap != null)
              Icon(
                Icons.photo_library_outlined,
                color: AppColors.iconColor,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
