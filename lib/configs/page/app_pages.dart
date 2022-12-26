import 'package:get/get.dart';
import 'package:pet_app/configs/route/app_routes.dart';
import 'package:pet_app/modules/auth/onboarding/view/onboarding_view.dart';

class AppPages {
  AppPages._();

  static List<GetPage> pages() {
    return [
      GetPage(
        name: AppRoutes.onBoarding,
        page: () => const OnBoardingView(),
      ),
    ];
  }
}
