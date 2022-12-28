import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find<RegisterController>();

  RxBool isTermConditionChecked = RxBool(false);
  RxBool isRegisterButtonEnabled = RxBool(false);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void checkTermCondition() {
    isTermConditionChecked.value = !isTermConditionChecked.value;
    registerFormListener();
  }

  @override
  void onInit() {
    super.onInit();

    fullNameController.addListener(registerFormListener);
    emailController.addListener(registerFormListener);
    passwordController.addListener(registerFormListener);
  }

  void registerFormListener() {
    var fullName = fullNameController.text.trim();
    var email = emailController.text.trim();
    var password = passwordController.text.trim();

    if (fullName.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        isTermConditionChecked.value) {
      isRegisterButtonEnabled.value = true;
    } else {
      isRegisterButtonEnabled.value = false;
    }
  }
}
