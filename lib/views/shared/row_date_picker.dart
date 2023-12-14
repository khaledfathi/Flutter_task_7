import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class RowDatePicker extends StatelessWidget {

  final DatePickerController? controller;
  final void Function(DateTime date)? onDateChange;
  final DateTime startDate ; 

  const RowDatePicker({super.key, 
    required this.startDate, 
    this.controller, 
    this.onDateChange
  });

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      startDate,
      controller: controller,
      height: 100,
      initialSelectedDate: DateTime.now(),
      selectionColor: Theme.of(context).colorScheme.background,
      selectedTextColor: Theme.of(context).colorScheme.onBackground,
      dayTextStyle: Theme.of(context).textTheme.titleSmall!,
      monthTextStyle: Theme.of(context).textTheme.titleSmall!,
      dateTextStyle: Theme.of(context).textTheme.titleLarge!,
      onDateChange: onDateChange,
    );
  }
}
