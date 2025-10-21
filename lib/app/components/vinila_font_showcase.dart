import 'package:flutter/material.dart';
import 'package:raizes/app/themes/app_themes.dart';

/// Widget para demonstrar todas as variações da fonte VINILA
/// Este widget pode ser usado para testar se todas as fontes estão carregadas corretamente
class VinilaFontShowcase extends StatelessWidget {
  const VinilaFontShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child:  const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fonte VINILA - Demonstração',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColors.primaryBeige,
            ),
          ),
          SizedBox(height: 20),

          // VINILA Light (300)
          Text(
            'VINILA Light (300) - Texto leve e elegante',
            style: TextStyle(
              fontFamily: 'VINILA',
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: AppColors.primaryBeige,
            ),
          ),
          SizedBox(height: 12),

          // VINILA Regular (400)
          Text(
            'VINILA Regular (400) - Texto padrão do aplicativo',
            style: TextStyle(
              fontFamily: 'VINILA',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryBeige,
            ),
          ),
          const SizedBox(height: 12),

          // VINILA Bold Oblique (600 italic)
          const Text(
            'VINILA Bold Oblique (600) - Texto em itálico destacado',
            style: TextStyle(
              fontFamily: 'VINILA',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              color: AppColors.primaryBeige,
            ),
          ),
          const SizedBox(height: 12),

          // VINILA Bold (700)
          const Text(
            'VINILA Bold (700) - Texto em negrito',
            style: TextStyle(
              fontFamily: 'VINILA',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryBeige,
            ),
          ),
          const SizedBox(height: 12),

          // VINILA ExtraBold (800)
          const Text(
            'VINILA ExtraBold (800) - Títulos e destaques',
            style: TextStyle(
              fontFamily: 'VINILA',
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppColors.primaryBeige,
            ),
          ),
          const SizedBox(height: 12),

          // VINILA Black (900)
          const Text(
            'VINILA Black (900) - Máximo peso da fonte',
            style: TextStyle(
              fontFamily: 'VINILA',
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryBeige,
            ),
          ),
        ],
      ),
    );
  }
}

/// Constantes para facilitar o uso das fontes VINILA no aplicativo
class VinilaFonts {
  static const String fontFamily = 'VINILA';

  // Estilos pré-definidos para consistência
  static const TextStyle light = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle regular = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle boldOblique = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );

  static const TextStyle bold = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle extraBold = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle black = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w900,
  );
}
