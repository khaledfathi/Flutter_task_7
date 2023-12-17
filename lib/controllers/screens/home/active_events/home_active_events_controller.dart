import 'package:flutter/material.dart';
import 'package:task_l7/controllers/enum/event_status.dart';
import 'package:task_l7/controllers/helper/helper.dart';
import 'package:task_l7/models/event_model.dart';

class HomeActiveEventsController {
  Future<List<EventModel>> getActiveEvents() async {
    try {
      return  await EventModel().selectWhere('status = ? ', [EventStatus.active.name ]);
    } catch (e) {
      debugPrint('HomeActiveEvents => getActiveEvents : $e'); 
    }
    return []; 
  }
  
  Future<List<EventModel>> getActiveEventsByDate (DateTime date)async{
    try {
        return  await EventModel().selectWhere('status = ? AND date_time LIKE ? ', [EventStatus.active.name , "${date.year}-${date.month}-${date.day}%"]);
    } catch (e) {
      debugPrint('HomeActiveEvents => getActiveEventsByDate : $e'); 
    }
    return [] ; 
  }

  Future<void> changeEventStatusToDone(BuildContext context, String id) async {
    await EventModel(status: EventStatus.done.name)
        .update(int.parse(id))
        .then((_) => Navigator.pop(context));
  }

  Future<void> changeEventStatusToArchive(
      BuildContext context, String id) async {
    await EventModel(status: EventStatus.archived.name)
        .update(int.parse(id))
        .then((value) => Navigator.pop(context));
  }

  Future<void> deleteEvent(BuildContext context, String id) async {
    await EventModel()
        .delete(id: int.parse(id))
        .then((value) => Navigator.pop(context));
  }

  Future<List<DateTime>> getAllEventsDateTime () async {
    List<DateTime> eventsdates= []; 
    List<EventModel> events = await EventModel().select(); 
    for (var row in events) {
      eventsdates.add(DateTime.parse(row.dateTime!)); 
    }
    return Helper.sortDate(eventsdates); 
  }
}
