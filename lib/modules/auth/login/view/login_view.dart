import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_app/configs/color/app_colors.dart';
import 'package:pet_app/configs/route/app_routes.dart';
import 'package:pet_app/configs/theme/app_text_styles.dart';
import 'package:pet_app/constants/asset_constants.dart';
import 'package:pet_app/modules/auth/login/controller/login_controller.dart';
import 'package:pet_app/modules/auth/login/view/components/login_social_button_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 18),
              Text(
                'Hello,\nWelcome Back!',
                style: AppTextStyles.f40w600Black,
              ),
              SizedBox(height: 36.h),
              Text(
                'Water is life. Water is a basic human need. In various lines of life, humans need water.',
                style: AppTextStyles.f14w400Grey,
              ),
              SizedBox(height: 32.h),
              TextField(
                controller: LoginController.to.emailController,
                keyboardType: TextInputType.emailAddress,
                style: AppTextStyles.f14w500Primary,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: LoginController.to.passwordController,
                style: AppTextStyles.f14w500Primary,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 36.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: const BoxDecoration(color: AppColors.grey2),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35.w),
                    child: Text(
                      'or',
                      style: AppTextStyles.f12w400Grey2,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: const BoxDecoration(color: AppColors.grey2),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
              Row(
                children: [
                  const LoginSocialButtonWidget(
                    assetPath: AssetConstants.logoGoogle,
                  ),
                  SizedBox(width: 24.w),
                  const LoginSocialButtonWidget(
                    assetPath: AssetConstants.logoFacebook,
                  )
                ],
              ),
              const Expanded(child: SizedBox()),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: AppTextStyles.f12w400Black,
                  children: [
                    TextSpan(
                      text: 'Create Account',
                      style: AppTextStyles.f12w700Primary,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(AppRoutes.register),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: LoginController.to.isLoginButtonEnabled.value
                        ? () {}
                        : null,
                    child: const Text('Login'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
