import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:task_l7/views/shared/events_page/components/events_page_header.dart';
import 'package:task_l7/views/shared/row_date_picker.dart';

class EventsPage extends StatefulWidget {
  static const String route = 'home-events';
  
  final Widget child; 

  const EventsPage({super.key,
    required this.child
  });

  @override
  State<EventsPage> createState() => _HomeEventsScreenState();
}

class _HomeEventsScreenState extends State<EventsPage> {
  //widget controllers
  final DatePickerController _datePickerController = DatePickerController();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            //header
            SizedBox(
              height: 187,
              width: double.infinity,
              child: Column(
                children: [
                  const EventsPageHeader(),
                  RowDatePicker(
                    startDate: DateTime.now(),
                    controller: _datePickerController,
                    onDateChange: _onDateChange ,
                  ),
                ],
              ),
            ),
            //body
            Expanded(
              child: widget.child,
            ),
          ],
        ));
  }

  //HomeEventsDatePickerRow : onDateChange function 
  void _onDateChange (DateTime date){
    setState(() {});
  }
}
