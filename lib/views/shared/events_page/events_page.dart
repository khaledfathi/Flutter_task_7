import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:task_l7/views/shared/events_page/components/events_page_header.dart';
import 'package:task_l7/views/shared/row_date_picker.dart';

class EventsPage extends StatelessWidget {
  static const String route = 'home-events';
  final void Function(DateTime dateime)? onDateChange ; 
  
  final DateTime? startDate; 
  final List<DateTime>? activeDates; 
  final Widget child; 
  final DateTime? initialSelectedDate; 

  EventsPage({super.key,
    required this.child,
    this.onDateChange,
    this.startDate,
    this.activeDates,
    this.initialSelectedDate

  });

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
                    startDate: startDate??DateTime.now(),
                    activeDates: activeDates ,
                    controller: _datePickerController,
                    initialSelectedDate: initialSelectedDate ,
                    onDateChange: onDateChange ,
                  ),
                ],
              ),
            ),
            //body
            Expanded(
              child: child,
            ),
          ],
        ));
  }
}
