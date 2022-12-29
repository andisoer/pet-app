import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_app/configs/color/app_colors.dart';
import 'package:pet_app/configs/theme/app_text_styles.dart';
import 'package:pet_app/modules/auth/register/controller/register_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 18),
              Text(
                'Create New\nAccount',
                style: AppTextStyles.f40w600Black,
              ),
              SizedBox(height: 36.h),
              Text(
                'Water is life. Water is a basic human need. In various lines of life, humans need water.',
                style: AppTextStyles.f14w400Grey,
              ),
              SizedBox(height: 32.h),
              TextField(
                controller: RegisterController.to.fullNameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(hintText: 'Full Name'),
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: RegisterController.to.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: RegisterController.to.passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 26.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      RegisterController.to.checkTermCondition();
                    },
                    borderRadius: BorderRadius.circular(4.r),
                    child: Obx(
                      () => Container(
                        height: 17.h,
                        width: 14.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: RegisterController
                                  .to.isTermConditionChecked.value
                              ? Border.all(color: AppColors.primary, width: 2)
                              : null,
                          color:
                              RegisterController.to.isTermConditionChecked.value
                                  ? AppColors.primary
                                  : AppColors.grey3,
                        ),
                        child:
                            RegisterController.to.isTermConditionChecked.value
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(4.r),
                                      border: Border.all(
                                        color: AppColors.white,
                                        width: 2,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'I Agree to the ',
                        style: AppTextStyles.f12w400Grey,
                        children: [
                          TextSpan(
                            text: 'Terms of Service ',
                            style: AppTextStyles.f12w700Primary,
                          ),
                          const TextSpan(text: 'and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: AppTextStyles.f12w700Primary,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Expanded(child: SizedBox()),
              Obx(
                () => ElevatedButton(
                    onPressed:
                        RegisterController.to.isRegisterButtonEnabled.value
                            ? () {}
                            : null,
                    child: const Text('Register')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
