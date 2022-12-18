import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';

class Utils {
  static String formatTime(DateTime dateTime) {
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    if (dateTime.hour < 12) {
      return "$hour:$minute AM";
    } else if (dateTime.hour == 12) {
      return "$hour:$minute PM";
    } else {
      return "${(dateTime.hour - 12).toString().padLeft(2, '0')}:$minute PM";
    }
  }

  static showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 16.0,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: AppColors.gray800,
    );
  }

  static void bottomSheetOpen(BuildContext context, Widget sheet,
      {isDismissible = false}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return sheet;
      },
      isDismissible: isDismissible,
      isScrollControlled: true,
    );
  }

  // static Future<void> showNotification(
  //     {String? title, String? body, bool playSound = true}) async {
  //   return await FlutterLocalNotificationsPlugin().show(
  //     1,
  //     title,
  //     body,
  //     NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         AppStrings.notificationId,
  //         AppStrings.notificationName,
  //         playSound: playSound,
  //         color: AppColors.teal400,
  //         channelDescription: AppStrings.notificationDescription,
  //       ),
  //     ),
  //   );
  // }

  static bool checkIsAnyFieldIsEmpty(
      {required List<TextEditingController> controllers}) {
    for (final controller in controllers) {
      if (controller.text.isEmpty) {
        return true;
      }
    }
    return false;
  }

  static bool isPasswordMatched(
      {required List<TextEditingController> controllers}) {
    return controllers[0].text == controllers[1].text;
  }

  static void clearAllFields(
      {required List<TextEditingController> controllers}) {
    for (final controller in controllers) {
      controller.clear();
    }
  }
//
// static Future<String?> downloadFile(
//     String url, String fileName, String? path) async {
//   late File file;
//
//   if (path == null) {
//     var directory = Platform.isAndroid
//         ? await getExternalStorageDirectory()
//         : await getApplicationSupportDirectory();
//
//     if (directory == null) {
//       return null;
//     }
//
//     var dir = Directory(directory.path + "/Downloads");
//
//     if (!await dir.exists()) {
//       dir = await dir.create();
//     }
//
//     file = File('${dir.path}/$fileName');
//   } else {
//     file = File(path);
//   }
//
//   if (await file.exists()) {
//     return file.path;
//   } else {
//     HttpClient httpClient = HttpClient();
//     try {
//       var request =
//           await httpClient.getUrl(Uri.parse(AppStrings.baseUrl + url));
//       var response = await request.close();
//       if (response.statusCode == 200) {
//         var bytes = await consolidateHttpClientResponseBytes(response);
//         await file.writeAsBytes(bytes);
//         httpClient.close(force: true);
//         return file.path;
//       }
//     } catch (ex) {
//       httpClient.close(force: true);
//       return null;
//     } finally {
//       httpClient.close(force: true);
//     }
//   }
//   return null;
// }
}
