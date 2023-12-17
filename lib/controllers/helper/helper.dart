import 'package:flutter/material.dart';
import 'package:task_l7/controllers/services/constants/general_constants.dart';

class Helper {
  static String dateToString(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  static String timeToString(TimeOfDay time) {
    int minute = time.minute;
    int hour = time.hour;
    return "${hour < 10 ? '0$hour' : hour}:${minute < 10 ? '0$minute' : minute}";
  }

  static String dateToISO8601(String date) {
    return date.split('/').reversed.toList().join('-');
  }

  static String dateFromISO8601(String dateTime) {
    DateTime dateObject = DateTime.parse(dateTime);
    return '${MONTHES[dateObject.month - 1]} ${dateObject.day} , ${dateObject.year}';
  }

  static String timeFromISO8601(String dateTime, {bool mode12Hour = true}) {
    DateTime dateObject = DateTime.parse(dateTime);
    int hour = dateObject.hour;
    String? timePeriod = '';
    if (mode12Hour) {
      if (hour > 12) {
        hour -= 12;
        timePeriod = 'PM';
      } else {
        timePeriod = 'AM';
      }
    }
    return "${hour < 10 ? '0$hour' : '$hour'}:${dateObject.minute} $timePeriod";
  }
  static List<DateTime> sortDate (List<DateTime> dates){
    dates.sort((pastDate, futureDate)=>pastDate.compareTo(futureDate)); 
    return dates; 
  }
}
