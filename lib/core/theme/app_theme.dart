import 'package:flutter/material.dart';
import 'package:flutter_smooth_template/core/theme/app_colors.dart';
import 'package:flutter_smooth_template/core/theme/app_radius.dart';
import 'package:flutter_smooth_template/core/theme/app_typography.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
      ),
      textTheme: const TextTheme(
        headlineLarge: AppTypography.titleLarge,
        headlineMedium: AppTypography.titleMedium,
        bodyLarge: AppTypography.body,
        bodyMedium: AppTypography.body,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
      useMaterial3: true,
    );
  }

  static ThemeData get dark {
    final base = light;
    return base.copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0B1220),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF14B8A6),
        secondary: Color(0xFFF59E0B),
        error: Color(0xFFEF4444),
      ),
    );
  }
}
