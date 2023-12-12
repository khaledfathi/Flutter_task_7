
import 'package:task_l7/models/abstract/model.dart';

class EventModel extends Model<EventModel>{
  String? id;
  String? title; 
  String? details; 
  String? date; 
  String? timeFrom; 
  String? timeTo;
  String? status; 
  Map<String , String>? row ; 

  EventModel({      
    super.currentRow, 
    this.id,
    this.title,
    this.details, 
    this.date, 
    this.timeFrom, 
    this.timeTo, 
    this.status, 
  }){
    currentRow = _toMap(); 
  }


  @override
  List<EventModel> createQueryModelList(List<Map<String, dynamic>> query) {
    List<EventModel> queryAsModel = []; 
    for (var row in query) {
      queryAsModel.add(EventModel( 
        id: row['id'],
        title: row['title'],
        details: row['details'], 
        date: row['date'], 
        timeFrom: row['timeFrom'], 
        timeTo: row['timeTo'],
        status: row['status'],
      )) ; 
    }
    return queryAsModel; 
  }
  
  Map<String, String> _toMap() {
    return {
      'title' : title??'' ,
      'details' : details??'',
      'date' : date??'', 
      'timeFrom' : timeFrom??'',
      'timeTo' : timeTo??'' , 
      'status' : status??''
    }; 
    
  } 
}