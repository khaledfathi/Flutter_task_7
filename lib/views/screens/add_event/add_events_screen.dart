import 'package:flutter/material.dart';
import 'package:task_l7/views/screens/add_event/components/add_events_app_bar.dart';
import 'package:task_l7/views/screens/add_event/components/add_events_custom_input.dart';

class AddEventsScreen extends StatefulWidget {
  static const String route = 'add-event';
  const AddEventsScreen({super.key});

  @override
  State<AddEventsScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: const AddEventsAppBar(),
          body: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(30),
              color: Theme.of(context).primaryColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Add Event',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    //FORM
                    Form(
                        child: Column(
                      children: [
                        AddEventsCustomInput(iconData: Icons.event , hintText: 'Title',),
                        AddEventsCustomInput(iconData: Icons.date_range ,hintText: 'dd/mm/yyyy',),  
                        AddEventsCustomInput(iconData: Icons.access_time_outlined, hintText: '10:15',),  
                        AddEventsCustomInput(iconData: Icons.description_outlined , hintText: 'Description',),  
                      ],
                    )),
                  ],
                ),
              )),
        ),
      ),
    );
  }
  void _test() {
    print('test');
    showDatePicker(context: context, firstDate: DateTime(1970), lastDate: DateTime(2038),
    currentDate: DateTime.parse('2023-12-11'),
    barrierDismissible: false,
    );

  }
}
