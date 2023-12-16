import 'package:flutter/material.dart';
import 'package:task_l7/controllers/enum/event_status.dart';
import 'package:task_l7/models/event_model.dart';

class HomeDoneEventsController {
  
  Future<List<EventModel>> getDoneEvents()async {
    return EventModel().selectWhere('status = ?', [EventStatus.done.name]); 
  }

  Future<void> changeEventStatusToActive(BuildContext context, String id) async {
    await EventModel(status: EventStatus.active.name)
        .update(int.parse(id))
        .then((_) => Navigator.pop(context));
  }

  Future<void> changeEventStatusToArchive(
      BuildContext context, String id) async {
    await EventModel(status: EventStatus.archived.name)
        .update(int.parse(id))
        .then((_) => Navigator.pop(context));
  }

  Future<void> deleteEvent(BuildContext context, String id) async {
    await EventModel()
        .delete(id: int.parse(id))
        .then((_) => Navigator.pop(context));
  }

}