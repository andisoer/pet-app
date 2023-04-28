import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_app/configs/page/app_pages.dart';
import 'package:pet_app/configs/route/app_routes.dart';
import 'package:pet_app/configs/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pet App',
          initialRoute: AppRoutes.onBoarding,
          theme: AppTheme.themeData,
          getPages: AppPages.pages(),
        );
      },
    );
  }
}
