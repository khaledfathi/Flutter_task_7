import 'package:flutter/material.dart';
import 'package:task_l7/controllers/enum/event_status.dart';
import 'package:task_l7/controllers/helper/helper.dart';
import 'package:task_l7/models/event_model.dart';
import 'package:task_l7/views/screens/home/home_screen.dart';

class AddEventsController {
  Future<void> storeNewEvent(
      {required BuildContext context,
      required String title,
      required String date,
      required String time,
      String? description = ''}) async {
    //compine date and time as iso8601
    String dateTimeCompine = '${Helper.dateToISO8601(date)} $time';
    await EventModel(
            title: title,
            dateTime: dateTimeCompine,
            description: description ?? '',
            status: EventStatus.active.name,
            )
        .insert()
        .then((_) => Navigator.pushReplacementNamed(context, HomeScreen.route));
  }
}
