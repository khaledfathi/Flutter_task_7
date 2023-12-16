import 'package:flutter/material.dart';
import 'package:task_l7/controllers/enum/event_status.dart';
import 'package:task_l7/models/event_model.dart';

class HomeActiveEventsController {
  
  Future<List<EventModel>> getActiveEvents()async {
    return EventModel().selectWhere('status = ?', [EventStatus.active.name]);
  }
 
  Future<void> changeEventStatusToDone (BuildContext context, String id)async{
    await EventModel(status: EventStatus.done.name).update(int.parse(id)).then((_){
      Navigator.pop(context); 
    });
  }
  
  Future<void> changeEventStatusToActive (BuildContext context,String id)async{
    await EventModel(status: EventStatus.active.name).update(int.parse(id)); 
  }
  
  Future<void> changeEventStatusToArchive (BuildContext context,  String id)async{
    await EventModel(status: EventStatus.archived.name).update(int.parse(id)); 
  }

}