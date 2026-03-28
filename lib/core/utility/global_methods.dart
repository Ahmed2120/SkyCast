import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utility/app_strings.dart';

class GlobalMethods{
  static void navigate(BuildContext context, Widget widget){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return widget;
        }));
  }

  static String get formatDate{
    DateTime date = DateTime.now(); // sample date
    String formattedDate = DateFormat('E, MMM d').format(date);
    return formattedDate;
  }

  static String formatTime(String timeString){
    final now = DateTime.now();
    print(now.hour);
  DateFormat inputFormat = DateFormat("HH:mm:ss");
  DateFormat outputFormat = DateFormat("h:mm");
  DateTime time = inputFormat.parse(timeString);
  String formattedTime = outputFormat.format(time);
  return formattedTime;
  }

  static String getUVIndexRiskLevel(double uv) {
    if (uv <= 2) return AppStrings.uvLow;
    if (uv <= 5) return AppStrings.uvModerate;
    if (uv <= 7) return AppStrings.uvHigh;
    if (uv <= 10) return AppStrings.uvVeryHigh;
    return AppStrings.uvExtreme;
  }
}