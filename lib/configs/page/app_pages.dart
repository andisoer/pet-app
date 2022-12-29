import 'package:get/get.dart';
import 'package:pet_app/configs/route/app_routes.dart';
import 'package:pet_app/modules/auth/login/controller/login_controller.dart';
import 'package:pet_app/modules/auth/login/view/login_view.dart';
import 'package:pet_app/modules/auth/onboarding/view/onboarding_view.dart';
import 'package:pet_app/modules/auth/register/controller/register_controller.dart';
import 'package:pet_app/modules/auth/register/view/register_view.dart';
import 'package:pet_app/modules/navigator/controller/navigator_controller.dart';
import 'package:pet_app/modules/navigator/view/navigator_view.dart';

class AppPages {
  AppPages._();

  static List<GetPage> pages() {
    return [
      GetPage(
        name: AppRoutes.onBoarding,
        page: () => const OnBoardingView(),
      ),
      GetPage(
        name: AppRoutes.login,
        page: () => const LoginView(),
        binding: BindingsBuilder(
          () => Get.lazyPut<LoginController>(() => LoginController()),
        ),
      ),
      GetPage(
        name: AppRoutes.register,
        page: () => const RegisterView(),
        binding: BindingsBuilder(
          () => Get.lazyPut<RegisterController>(() => RegisterController()),
        ),
      ),
      GetPage(
        name: AppRoutes.navigator,
        page: () => const NavigatorView(),
        binding: BindingsBuilder(
          () => Get.lazyPut<NavigatorController>(() => NavigatorController()),
        ),
      ),
    ];
  }
}
