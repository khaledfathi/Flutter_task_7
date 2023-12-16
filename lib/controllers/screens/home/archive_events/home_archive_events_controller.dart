import 'package:flutter/material.dart';
import 'package:task_l7/controllers/enum/event_status.dart';
import 'package:task_l7/models/event_model.dart';

class HomeArchiveEventsController {
  
  Future<List<EventModel>> getArchiveEvents()async {
    return EventModel().selectWhere('status = ?', [EventStatus.archived.name]); 
  }

 Future<void> changeEventStatusToDone (BuildContext context, String id)async{
    EventModel(status: EventStatus.done.name).update(int.parse(id));
  }
  
  Future<void> changeEventStatusToActive (BuildContext context,String id)async{
    EventModel(status: EventStatus.active.name).update(int.parse(id)); 
  }
  
  Future<void> changeEventStatusToArchive (BuildContext context,  String id)async{
    EventModel(status: EventStatus.archived.name).update(int.parse(id)); 
  }

}