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
        ButtonStyle(
          elevation: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return 0;
              }
              return 0;
            },
          ),
        ),
      ),
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
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTextStyles.f14w500Grey,
      contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.primary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.red,
        ),
      ),
    ),
  );
}
