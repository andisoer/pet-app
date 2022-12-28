import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isLoginButtonEnabled = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    emailController.addListener(loginFormListener);
    passwordController.addListener(loginFormListener);
  }

  void loginFormListener() {
    var email = emailController.text.trim();
    var password = passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      isLoginButtonEnabled.value = true;
    } else {
      isLoginButtonEnabled.value = false;
    }
  }
}
