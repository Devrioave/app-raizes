import 'package:flutter/material.dart';

class AppColors {
  // HARMONIA DE CORES PRINCIPAL
  // Verde - Tom principal
  static const primaryGreen = Color(0xff59773d);      // Verde médio - para fundos principais
  static const darkGreen = Color(0xff3d4f27);        // Verde escuro - para contraste e elementos destacados
  static const lightGreen = Color(0xff7a9959);       // Verde claro - para hover/pressed states
  static const paleGreen = Color(0xffa8c285);        // Verde pálido - para fundos sutis

  // Bege - Tom secundário
  static const primaryBeige = Color(0xffecc8b0);      // Bege principal - para textos sobre verde
  static const lightBeige = Color(0xfff5e5d3);       // Bege claro - para fundos de cards
  static const darkBeige = Color(0xffb8906f);        // Bege escuro - para textos sobre fundos claros

  // Neutros - Para legibilidade
  static const pureWhite = Color(0xffffffff);        // Branco puro - máximo contraste
  static const softWhite = Color(0xfff8f8f8);        // Branco suave - para fundos
  static const lightGray = Color(0xffe5e5e5);        // Cinza claro - para bordas
  static const mediumGray = Color(0xff888888);       // Cinza médio - para textos secundários
  static const darkGray = Color(0xff333333);         // Cinza escuro - para textos principais

  // Estados e Feedback
  static const errorRed = Color(0xffd32f2f);         // Vermelho para erros
  static const successGreen = Color(0xff388e3c);     // Verde para sucesso
  static const warningOrange = Color(0xfff57c00);    // Laranja para avisos

  // Raizes (manter compatibilidade)
  static const accentColor = Color(0xff946746);
  static const white = Color(0xffe6e7e3);
  static const gray = Color(0xff999999);
  static const appBarBackground = Color(0xffb7d1a8);
  static const iconColor = Color(0xffecc8b0);
}

final ThemeData appLightThemeData = ThemeData(
  fontFamily: 'VINILA',
  scaffoldBackgroundColor: AppColors.softWhite,  // Fundo branco suave para melhor legibilidade
  primaryColor: AppColors.primaryGreen,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.primaryBeige,
    primary: AppColors.primaryGreen,
    onSurface: AppColors.darkGray,      // Texto escuro sobre fundos claros
    onPrimary: AppColors.pureWhite,     // Texto branco sobre verde
    surface: AppColors.pureWhite,       // Superfícies em branco
    onSecondary: AppColors.darkGreen,   // Texto verde escuro sobre bege
    // background and onBackground deprecated, using surface instead
  ),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: AppColors.primaryGreen,
    foregroundColor: AppColors.pureWhite,     // Texto branco no AppBar para máximo contraste
    iconTheme: const IconThemeData(color: AppColors.pureWhite),
    titleTextStyle: const TextStyle(
      color: AppColors.pureWhite,
      fontFamily: 'VINILA',
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  textTheme: const TextTheme().copyWith(
    bodySmall: const TextStyle(
      color: AppColors.darkGray,        // Texto escuro para melhor legibilidade
      fontSize: 12,
    ),
    bodyMedium: const TextStyle(
      color: AppColors.darkGray,
      fontSize: 14,
    ),
    bodyLarge: const TextStyle(
      color: AppColors.darkGray,
      fontSize: 16,
    ),
    headlineSmall: const TextStyle(
      color: AppColors.darkGreen,       // Títulos em verde escuro
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: const TextStyle(
      color: AppColors.darkGreen,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: const TextStyle(
      color: AppColors.darkGreen,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: const TextStyle(
      color: AppColors.darkGreen,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: const TextStyle(
      color: AppColors.primaryGreen,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: const TextStyle(
      color: AppColors.mediumGray,      // Labels em cinza médio
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48),
      ),
      backgroundColor: AppColors.primaryGreen,   // Botões verdes
      foregroundColor: AppColors.pureWhite,     // Texto branco nos botões
      elevation: 2,
      shadowColor: AppColors.primaryGreen.withValues(alpha: 0.3),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.softWhite,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.lightGray),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.primaryGreen, width: 2),
    ),
  ),
);

final ThemeData appDarkThemeData = ThemeData(
  fontFamily: 'VINILA',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkGreen,     // Verde escuro como fundo
  primaryColor: AppColors.primaryGreen,
  colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark).copyWith(
    secondary: AppColors.primaryBeige,
    primary: AppColors.primaryGreen,
    onSurface: AppColors.primaryBeige,      // Texto bege sobre fundos escuros
    onPrimary: AppColors.pureWhite,         // Texto branco sobre verde
    surface: AppColors.primaryGreen,        // Superfícies em verde
    onSecondary: AppColors.darkGreen,
    // background and onBackground deprecated, using surface instead
  ),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: AppColors.darkGreen,
    foregroundColor: AppColors.pureWhite,
    iconTheme: const IconThemeData(color: AppColors.pureWhite),
    titleTextStyle: const TextStyle(
      color: AppColors.pureWhite,
      fontFamily: 'VINILA',
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  textTheme: const TextTheme().copyWith(
    bodySmall: const TextStyle(
      color: AppColors.primaryBeige,
      fontSize: 12,
    ),
    bodyMedium: const TextStyle(
      color: AppColors.primaryBeige,
      fontSize: 14,
    ),
    bodyLarge: const TextStyle(
      color: AppColors.primaryBeige,
      fontSize: 16,
    ),
    headlineSmall: const TextStyle(
      color: AppColors.lightBeige,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: const TextStyle(
      color: AppColors.lightBeige,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: const TextStyle(
      color: AppColors.lightBeige,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48),
      ),
      backgroundColor: AppColors.primaryBeige,
      foregroundColor: AppColors.darkGreen,
      elevation: 2,
    ),
  ),
);

