import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/configs/color/app_colors.dart';

class AppBarActionButtonWidget extends StatelessWidget {
  final String iconPath;
  final Function()? onTap;
  const AppBarActionButtonWidget({
    Key? key,
    required this.iconPath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: const EdgeInsets.all(14),
        child: SvgPicture.asset(iconPath),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.07),
              offset: const Offset(4, 4),
              blurRadius: 20,
            )
          ],
        ),
      ),
    );
  }
}
