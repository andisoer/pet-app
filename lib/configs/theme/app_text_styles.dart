import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_app/configs/color/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static final TextStyle f40w600Black = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w700,
    fontSize: 40.sp,
  );

  static final TextStyle f14w600Grey = TextStyle(
    color: AppColors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );

  static final TextStyle f16w700White = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
  );

  static final TextStyle f16w700Primary = TextStyle(
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
  );
}
