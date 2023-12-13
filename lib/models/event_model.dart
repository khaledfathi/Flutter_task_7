import 'package:task_l7/models/abstract/model.dart';

class EventModel extends Model<EventModel> {
  String? id;
  String? title;
  String? description;
  String? dateTime;
  String? status;

  EventModel(
      {super.tableName = 'events',
      this.id,
      this.title,
      this.description,
      this.dateTime,
      this.status}){
        super.row = toMap(); 
      }

  @override
  List<EventModel> createQueryModelList(List<Map<String, Object?>> queryResult) {
    List<EventModel> modelList = [];
    for (var row in queryResult) {
      modelList.add(EventModel(
        id: row['id'].toString(), 
        title: row['title'].toString(), 
        description: row['description'].toString(), 
        dateTime: row['date_time'].toString(), 
        status: row['status'].toString(), 
      ));
    }
    return modelList; 
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'title': title??'',
      'description' : description??'', 
      'date_time': dateTime ??'',
      'status' : status??'',
    };
  }
}
