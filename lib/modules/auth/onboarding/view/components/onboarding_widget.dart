import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/configs/theme/app_text_styles.dart';

class OnBoardingWidget extends StatelessWidget {
  final String assetPath;
  final String label;
  final String description;

  const OnBoardingWidget({
    Key? key,
    required this.assetPath,
    required this.label,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 12.h),
          Text(
            label + '\n\n\n',
            style: AppTextStyles.f40w600Black,
            textAlign: TextAlign.start,
            maxLines: 3,
          ),
          SizedBox(height: 4.h),
          SvgPicture.asset(assetPath),
          SizedBox(height: 16.h),
          Text(
            description,
            style: AppTextStyles.f14w400Grey,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
