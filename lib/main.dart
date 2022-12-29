import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:psl_eight/Screens/home_screen.dart';

import 'globals/app_globals.dart';

void main() {
  runApp(
    ScreenUtilInit(
      builder: (context, _) => const MyApp(),
      designSize: const Size(375, 812),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        dividerColor: AppColors.black,
        hintColor: AppColors.black
      ),
      home: const MyHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
