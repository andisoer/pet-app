import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_app/configs/font/app_fonts.dart';
import 'package:pet_app/configs/color/app_colors.dart';

import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData themeData = ThemeData(
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSwatch(accentColor: AppColors.primary),
    iconTheme: const IconThemeData(color: AppColors.primary),
    fontFamily: AppFonts.inter,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(vertical: 18.h),
        textStyle: AppTextStyles.f16w700White,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
      ).merge(
          ButtonStyle(elevation: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return 0;
        }
        return 0;
      }))),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTextStyles.f16w700Primary,
        backgroundColor: AppColors.white,
        side: const BorderSide(color: AppColors.primary),
        padding: EdgeInsets.symmetric(vertical: 18.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
      ),
    ),
  );
}
