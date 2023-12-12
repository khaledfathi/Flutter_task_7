import 'package:task_l7/models/event_model.dart';

class HomeEventsControllers {
  Future<void> databaseTest() async {
    //create test
    EventModel(
      title: 'test title',
      details: 'test details',
      date: '10/10/2020',
      timeFrom: '12:20',
      timeTo: '18:20,',
      status: 'acitve',
    ).create();

    //update test ( <id> )
    EventModel(
      title: 'update title',
      details: 'update details',
      date: 'update 10/10/2020',
      timeFrom: 'update 12:20',
      timeTo: 'update 18:20,',
      status: 'update acitve',
    ).update(9);

    //delete test ( [id] | delete all )
    EventModel().delete();

    //read test ( [id] | read all )
    List<EventModel> data = EventModel().read();

    if (data.isNotEmpty) {
      for (var row in data) {
        print('=========');
        print('id : ${row.id}');
        print('title : ${row.title}');
        print('details : ${row.details}');
        print('date : ${row.date}');
        print('time form : ${row.timeFrom}');
        print('time To : ${row.timeTo}');
        print('status : ${row.status}');
      }
    }else {
      print("Table is Empty"); 
    }
  }
}
