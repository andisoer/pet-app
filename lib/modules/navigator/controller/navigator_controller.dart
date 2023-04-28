import 'package:get/get.dart';

class NavigatorController extends GetxController {
  static NavigatorController get to => Get.find<NavigatorController>();

  RxInt selectedIndex = RxInt(0);

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
