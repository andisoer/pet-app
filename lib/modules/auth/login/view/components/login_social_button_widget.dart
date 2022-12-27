import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_app/configs/color/app_colors.dart';

class LoginSocialButtonWidget extends StatelessWidget {
  final String assetPath;

  const LoginSocialButtonWidget({required this.assetPath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(18.r),
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColors.grey3),
          ),
          child: Image.asset(assetPath),
        ),
      ),
    );
  }
}
