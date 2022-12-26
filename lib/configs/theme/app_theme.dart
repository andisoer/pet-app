import 'package:flutter/material.dart';
import 'package:pet_app/configs/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData themeData = ThemeData(
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSwatch(accentColor: AppColors.primary),
    iconTheme: const IconThemeData(color: AppColors.primary),
  );
}
