import 'package:flutter/material.dart';
import 'package:task_l7/controllers/helper/helper.dart';
import 'package:task_l7/controllers/screens/add_events/add_events_controller.dart';
import 'package:task_l7/controllers/services/validation/validation.dart';
import 'package:task_l7/views/screens/add_event/components/add_events_app_bar.dart';
import 'package:task_l7/views/screens/add_event/components/add_events_custom_input.dart';

class AddEventsScreen extends StatefulWidget {
  static const String route = 'add-event';
  const AddEventsScreen({super.key});

  @override
  State<AddEventsScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventsScreen> {
  //screen controller
  final AddEventsController _controller = AddEventsController();
  //widgt keys
  final GlobalKey<FormState> _formKey = GlobalKey();
  //input controllers
  final TextEditingController _titleInputCtl = TextEditingController();
  final TextEditingController _dateInputCtl = TextEditingController();
  final TextEditingController _timeInputCtl = TextEditingController();
  final TextEditingController _descriptionInputCtl = TextEditingController();
  //values
  String? _title;
  String? _date;
  String? _time;
  String? _description;

  @override
  void initState() {
    _dateInputCtl.text = Helper.dateToString(DateTime.now());
    _timeInputCtl.text = Helper.timeToString(TimeOfDay.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AddEventsAppBar(
            onTapSave: _onTapSave,
          ),
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
                        key: _formKey,
                        child: Column(
                          children: [
                            AddEventsCustomInput(
                              iconData: Icons.event,
                              hintText: 'Title',
                              keyboardType: TextInputType.text,
                              controller: _titleInputCtl,
                              validator: _titleValidation,
                              onSaved: (title) => _title = title,
                            ),
                            AddEventsCustomInput(
                              iconData: Icons.date_range,
                              hintText: 'dd/mm/yyyy',
                              keyboardType: TextInputType.datetime,
                              controller: _dateInputCtl,
                              onPressIcon: _selectDate,
                              validator: _dateValidation,
                              onSaved: (date) =>
                                  _date = Helper.dateToISO8601(date!),
                            ),
                            AddEventsCustomInput(
                              iconData: Icons.access_time_outlined,
                              hintText: '10:15',
                              keyboardType: TextInputType.datetime,
                              controller: _timeInputCtl,
                              onPressIcon: _selectTime,
                              validator: _timeValidation,
                              onSaved: (time) => _time = time,
                            ),
                            AddEventsCustomInput(
                              iconData: Icons.description_outlined,
                              hintText: 'Description',
                              keyboardType: TextInputType.text,
                              controller: _descriptionInputCtl,
                            ),
                          ],
                        )),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void _selectDate() {
    showDatePicker(
      barrierDismissible: false,
      context: context,
      firstDate: DateTime(1970),
      lastDate: DateTime(2038),
      initialDate: DateTime.now(),
    ).then((date) {
      if (date != null) _dateInputCtl.text = Helper.dateToString(date);
    });
  }

  void _selectTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((time) {
      if (time != null) _timeInputCtl.text = Helper.timeToString(time);
    });
  }

  // Validation Functions :

  String? _titleValidation(String? input) {
    Validation validate =
        Validation(input!, fieldName: 'Title').required().validate();
    if (validate.errors.isNotEmpty) return validate.errors.first;
    return null;
  }

  String? _dateValidation(String? input) {
    Validation validate =
        Validation(input!, fieldName: 'Date').required().date().validate();
    if (validate.errors.isNotEmpty) return validate.errors.first;
    return null;
  }

  String? _timeValidation(String? input) {
    Validation validate =
        Validation(input!, fieldName: 'Time').required().time().validate();
    if (validate.errors.isNotEmpty) return validate.errors.first;
    return null;
  }
  // ==========

  void _onTapSave() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _controller.storeNewEvent(
          context: context,
          title: _title!,
          date: _date!,
          time: _time!,
          description: _description);
    }
  }
}
