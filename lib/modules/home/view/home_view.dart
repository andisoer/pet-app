import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_app/configs/color/app_colors.dart';
import 'package:pet_app/configs/theme/app_text_styles.dart';
import 'package:pet_app/constants/asset_constants.dart';
import 'package:pet_app/modules/home/controller/home_controller.dart';

import 'components/app_bar_action_button_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 24.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.h),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Location',
                              style: AppTextStyles.f12w600Black30,
                            ),
                            SizedBox(width: 10.w),
                            SvgPicture.asset(AssetConstants.iconArrowDown),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Jebres, Surakarta',
                          style: AppTextStyles.f16w400Black,
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    const AppBarActionButtonWidget(
                      iconPath: AssetConstants.iconSearch,
                    ),
                    SizedBox(width: 12.w),
                    const AppBarActionButtonWidget(
                      iconPath: AssetConstants.iconNotification,
                    )
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              Container(
                constraints: BoxConstraints(maxHeight: 200.h),
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(maxHeight: 139.h),
                        margin: EdgeInsets.symmetric(horizontal: 24.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.r),
                          color: AppColors.primary,
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24.r),
                              child: SvgPicture.asset(
                                AssetConstants.bgHomeHeader,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 20.w),
                                const Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                SizedBox(width: 40.w),
                                Flexible(
                                  flex: 2,
                                  fit: FlexFit.tight,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Royal Canin Adult Pomeraniann',
                                        style: AppTextStyles.f16w700White,
                                      ),
                                      SizedBox(height: 8.h),
                                      Text(
                                        'Get an interesting promo here, without conditions',
                                        style: AppTextStyles.f14w400White,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20.w),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      AssetConstants.headerIllustration,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 20.w),
                  Text('Category', style: AppTextStyles.f16w700Black),
                  const Expanded(child: SizedBox()),
                  Text('View All', style: AppTextStyles.f12w500Primary),
                  SizedBox(width: 20.w),
                ],
              ),
              SizedBox(height: 20.h),
              Obx(
                () {
                  var selectedFilter = HomeController.to.selectedFilter.value;

                  return Container(
                    height: 40.h,
                    margin: EdgeInsets.symmetric(horizontal: 14.w),
                    child: ListView.builder(
                      itemCount: HomeController.to.homeFilterList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var itemFilter =
                            HomeController.to.homeFilterList[index];

                        return ItemCategoryHomeWidget(
                          label: itemFilter.label,
                          onTap: () async =>
                              HomeController.to.selectFilter(itemFilter),
                          icon: itemFilter.icon,
                          isSelected: itemFilter.id == selectedFilter.id,
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 20.w),
                  Text('Best Seller', style: AppTextStyles.f16w700Black),
                  const Expanded(child: SizedBox()),
                  Text('View All', style: AppTextStyles.f12w500Primary),
                  SizedBox(width: 20.w),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCategoryHomeWidget extends StatelessWidget {
  final bool isSelected;
  final String? label;
  final String? icon;
  final Function() onTap;

  const ItemCategoryHomeWidget({
    this.isSelected = false,
    this.label,
    this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 20.w,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.grey4,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: label != null
              ? Text(
                  label!,
                  style: isSelected
                      ? AppTextStyles.f12w500White
                      : AppTextStyles.f12w500Black30,
                )
              : SvgPicture.asset(icon!,
                  color: isSelected ? AppColors.white : null),
        ),
      ),
    );
  }
}
