import 'package:get/get.dart';
import 'package:pet_app/constants/asset_constants.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();

  List<HomeFilterClass> homeFilterList = [
    HomeFilterClass(
      type: 'all',
      id: 'filter1',
      icon: AssetConstants.iconSwap,
    ),
    HomeFilterClass(
      type: 'category',
      id: 'food',
      label: 'Food',
    ),
    HomeFilterClass(
      type: 'category',
      id: 'toys',
      label: 'Toys',
    ),
    HomeFilterClass(
      type: 'category',
      id: 'accesories',
      label: 'Accesories',
    ),
  ];

  Rx<HomeFilterClass> selectedFilter = Rx<HomeFilterClass>(
    HomeFilterClass(
      type: 'category',
      id: 'food',
      label: 'Food',
    ),
  );

  Future<void> selectFilter(HomeFilterClass filter) async {
    selectedFilter.value = filter;
  }
}

class HomeFilterClass {
  final String? label;
  final String? icon;
  final String type;
  final String id;

  HomeFilterClass({
    this.label,
    this.icon,
    required this.type,
    required this.id,
  });
}
