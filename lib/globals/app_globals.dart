// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class AppAssets {
  // Images
  static const String bachground = 'assets/bj.png';
  static const String json = 'assets/data.json';
}

class AppStrings extends ChangeNotifier {
  // App Title
  static const String appTitle = "PSL Season 8";

  // Home Page
  static const String homeTitle = "PSL Season 8";
  static const String schedule = "schedule";
  static const String venues = "venues";
  static const String history = "history";
  static const String teams = "teams";
  static const String liveScore = "Live Score";
  static const String highlights = "Highlights";

  // Toast Messages
  static const String subjectRequired = "subject is required";
  static const String somethingWentWrong = "something went wrong";
  static const String allFieldsAreRequired = "all fields are required";
  static const String passwordDoesNotMatch = "confirm password does not match";

  static const List<String> items = [
    "New Request",
    "Under Review",
    "Pending Payment",
    "Work in Progress",
    "Work Completed",
  ];
}

class AppColors {
  // Main
  static const Color primaryColor = Color(0xff0fa859);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color purple = Colors.purple;

  // static const  Color secondary =  Color(0xFFBA68C8);
  // static const Color secondary = Color(0xffe8750a);

  static const Color transparent = Color(0x00000000);

  // Grey
  static const Color gray100 = Color(0xfff5f2f5);
  static const Color gray600 = Color(0xff808085);
  static const Color gray800 = Color(0xff4f423d);
  static const Color gray900 = Color(0xff1f2424);
  static const Color gray901 = Color(0xff212424);
  static const Color gray60087 = Color(0xff87808085);
  static const Color gray8007a = Color(0xff7a4f423d);
  static const Color gray80099 = Color(0xff994f423d);
  static const Color gray800A2 = Color(0xffa24f423d);
  static const Color gray9007a = Color(0xff7a1f2424);
  static const Color gray9007f = Color(0xff7f212424);
  static const Color gray90087 = Color(0xff87212424);

  // Black
  static const Color black900 = Color(0xff000000);
  static const Color black1e1100 = Color(0xFF1E1100);
  static const Color black90075 = Color(0xff751f1200);
  static const Color black90030 = Color(0xff30000000);
  static const Color black90040 = Color(0xff40000000);
  static const Color black90087 = Color(0xff871f1200);
  static const Color black90090 = Color(0xff90000000);
  static const Color black900Bf = Color(0xffbf1f1200);

  // White
  static const Color whiteA700 = Color(0xffffffff);
  static const Color whiteA7007f = Color(0xff7fffffff);
  static const Color whiteA70087 = Color(0xff87ffffff);

  // Teal
  static const Color secondary = Color(0xff38a685);
  static const Color teal100 = Color(0xff9af1d7);
  static const Color gGreenColor = Color(0xff1a5c47);
  static const Color teal40065 = Color(0xff6538a685);
  static const Color teal4009e = Color(0xff9e38a685);

  // Orange
  static const Color yellow701 = Color(0xFFF7BA34);

  // Others
  static const Color red = Colors.red;
}

class AppStyle {
  static TextStyle text = const TextStyle(
    color: AppColors.whiteA700,
    fontSize: 23,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static TextStyle textStyle1 = const TextStyle(
    color: AppColors.black900,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
}
