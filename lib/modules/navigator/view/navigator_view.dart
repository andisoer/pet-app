import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_app/configs/color/app_colors.dart';
import 'package:pet_app/constants/asset_constants.dart';
import 'package:pet_app/modules/chat/view/chat_view.dart';
import 'package:pet_app/modules/home/view/home_view.dart';
import 'package:pet_app/modules/navigator/controller/navigator_controller.dart';
import 'package:pet_app/modules/profile/view/profile_view.dart';
import 'package:pet_app/modules/store/view/store_view.dart';

class NavigatorView extends StatelessWidget {
  const NavigatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        var selectedIndex = NavigatorController.to.selectedIndex.value;
        switch (selectedIndex) {
          case 0:
            return const HomeView();
          case 1:
            return const ChatView();
          case 2:
            return const StoreView();
          case 3:
            return const ProfileView();

          default:
            return const SizedBox();
        }
      }),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.grey4,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
        ),
        padding: EdgeInsets.only(
          top: 28.h,
          bottom: 34.h,
          left: 36.w,
          right: 36.w,
        ),
        child: Obx(() {
          var selectedIndex = NavigatorController.to.selectedIndex.value;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemBottomNavigationMenuWidget(
                iconPath: AssetConstants.iconHome,
                iconPathSelected: AssetConstants.iconHomeFilled,
                isSelected: selectedIndex == 0 ? true : false,
                onTap: () => NavigatorController.to.setSelectedIndex(0),
              ),
              ItemBottomNavigationMenuWidget(
                iconPath: AssetConstants.iconChat,
                iconPathSelected: AssetConstants.iconChatFilled,
                isSelected: selectedIndex == 1 ? true : false,
                onTap: () => NavigatorController.to.setSelectedIndex(1),
              ),
              ItemBottomNavigationMenuWidget(
                iconPath: AssetConstants.iconBag,
                iconPathSelected: AssetConstants.iconBagFilled,
                isSelected: selectedIndex == 2 ? true : false,
                onTap: () => NavigatorController.to.setSelectedIndex(2),
              ),
              ItemBottomNavigationMenuWidget(
                iconPath: AssetConstants.iconProfile,
                iconPathSelected: AssetConstants.iconProfileFilled,
                isSelected: selectedIndex == 3 ? true : false,
                onTap: () => NavigatorController.to.setSelectedIndex(3),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class ItemBottomNavigationMenuWidget extends StatelessWidget {
  final String iconPath;
  final String iconPathSelected;
  final bool isSelected;
  final Function() onTap;
  const ItemBottomNavigationMenuWidget({
    Key? key,
    required this.iconPath,
    required this.iconPathSelected,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isSelected ? iconPathSelected : iconPath,
          ),
          SizedBox(height: 8.h),
          Container(
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : null,
              shape: BoxShape.circle,
            ),
            width: 6.w,
            height: 6.h,
          )
        ],
      ),
    );
  }
}
