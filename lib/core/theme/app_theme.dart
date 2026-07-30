import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSpacing {
  static const double xs = 8.0;
  static const double sm = 16.0;
  static const double md = 32.0;
  static const double lg = 64.0;
  static const double xl = 96.0;
  static const double xxl = 128.0;

  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);
}

class AppRadius {
  static const double sm = 12.0;
  static const double md = 24.0;
  static const double lg = 36.0;
  static const double xl = 100.0; // fully rounded/pill
}

extension TextStyleContext on BuildContext {
  TextTheme get textStyles => Theme.of(this).textTheme;
}

extension TextStyleExtensions on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withSize(double size) => copyWith(fontSize: size);
}

class AppColors {
  // Deep space dark background
  static const background = Color(0xFF030305);
  static const surface = Color(0xFF101018);
  static const surfaceHighlight = Color(0xFF1C1C2A);

  // Vibrant Neon accents
  static const primary = Color(0xFF00E5FF); // Neon Cyan
  static const secondary = Color(0xFFB400FF); // Neon Purple
  static const accent = Color(0xFFFF0066); // Neon Pink

  // Text colors
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFA0A0B0);

  static const error = Color(0xFFFF3366);
}

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        error: AppColors.error,
        onPrimary: AppColors.background,
        onSecondary: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: const BorderSide(color: AppColors.surfaceHighlight, width: 1),
        ),
      ),
      textTheme: _buildTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.background,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          textStyle: GoogleFonts.outfit(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          textStyle: GoogleFonts.outfit(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );

// We just map the light theme to the dark one, as the app is an immersive dark commercial landing page
ThemeData get lightTheme => darkTheme;

TextTheme _buildTextTheme() {
  return TextTheme(
    displayLarge: GoogleFonts.outfit(
      fontSize: 72.0,
      fontWeight: FontWeight.w800,
      color: AppColors.textPrimary,
      height: 1.1,
      letterSpacing: -1.5,
    ),
    displayMedium: GoogleFonts.outfit(
      fontSize: 56.0,
      fontWeight: FontWeight.w800,
      color: AppColors.textPrimary,
      height: 1.1,
      letterSpacing: -1.0,
    ),
    displaySmall: GoogleFonts.outfit(
      fontSize: 48.0,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
      height: 1.1,
      letterSpacing: -0.5,
    ),
    headlineLarge: GoogleFonts.outfit(
      fontSize: 40.0,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
      height: 1.2,
      letterSpacing: -0.5,
    ),
    headlineMedium: GoogleFonts.outfit(
      fontSize: 32.0,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
      height: 1.2,
    ),
    headlineSmall: GoogleFonts.outfit(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    titleLarge: GoogleFonts.outfit(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    titleMedium: GoogleFonts.outfit(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      height: 1.5,
    ),
    titleSmall: GoogleFonts.outfit(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      height: 1.5,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
      height: 1.6,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
      height: 1.6,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
      height: 1.6,
    ),
    labelLarge: GoogleFonts.outfit(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
      letterSpacing: 1.0,
    ),
  );
}
