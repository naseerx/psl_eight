import 'package:flutter/cupertino.dart';

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
