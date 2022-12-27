import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_app/configs/route/app_routes.dart';
import 'package:pet_app/constants/asset_constants.dart';

import 'components/onboarding_widget.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final List<Widget> onBoardingView = [
    const OnBoardingWidget(
      assetPath: AssetConstants.onboardingIllustration,
      label: 'Meet your animal needs here',
      description:
          'Whether you have a furry friend at home or you\'re looking to adopt a companion, we have something for everyone.',
    ),
    const OnBoardingWidget(
      assetPath: AssetConstants.onboardingIllustration2,
      label: 'Revolutionize Your Pet Care with This App',
      description:
          'Our app offers tips and resources for training, nutrition, and overall pet care, making it the ultimate tool for any pet owner.',
    ),
    const OnBoardingWidget(
      assetPath: AssetConstants.onboardingIllustration3,
      label: 'Your Ultimate Pet Care Companion',
      description:
          'Whether you have a new puppy or an aging senior dog, this app has you covered',
    )
  ];

  final PageController _pageController = PageController(initialPage: 0);
  var currentIndex = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentIndex = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 24.h),
              SizedBox(
                height: MediaQuery.of(context).size.height * 4 / 5,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onBoardingView.length,
                  itemBuilder: (context, position) {
                    return onBoardingView[position];
                  },
                ),
              ),
              DotsIndicator(
                dotsCount: onBoardingView.length,
                position: currentIndex,
                decorator: const DotsDecorator(
                  size: Size.square(6),
                  activeSize: Size.square(6),
                ),
              ),
              SizedBox(height: 24.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(AppRoutes.login),
                  child: const Text(
                    'Get Started',
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
