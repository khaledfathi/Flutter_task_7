import 'package:flutter/material.dart';
import 'package:task_l7/controllers/enum/bottom_dialog_mode.dart';
import 'package:task_l7/controllers/helper/helper.dart';
import 'package:task_l7/controllers/screens/home/archive_events/home_archive_events_controller.dart';
import 'package:task_l7/models/event_model.dart';
import 'package:task_l7/views/shared/bottom_buttons_dialog.dart';
import 'package:task_l7/views/shared/event_view_box.dart';
import 'package:task_l7/views/shared/events_page/events_page.dart';

class HomeArchiveEventsScreen extends StatefulWidget {
  const HomeArchiveEventsScreen({super.key});

  @override
  State<HomeArchiveEventsScreen> createState() => _HomeArchiveScreenState();
}

class _HomeArchiveScreenState extends State<HomeArchiveEventsScreen> {
  //screen controller
  final HomeArchiveEventsController _controller = HomeArchiveEventsController();
  //values
  late Future<List<EventModel>> _data;

  @override
  void initState() {
    _data = _controller.getArchiveEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _data,
      builder: (context, events) {
        if (events.connectionState == ConnectionState.done) {
          return EventsPage(
            child: ListView.builder(
              itemCount: events.data!.length,
              itemBuilder: (context, index) {
                return EventViewBox(
                  title: events.data![index].title!,
                  date: Helper.dateFromISO8601(events.data![index].dateTime!),
                  time: Helper.timeFromISO8601(events.data![index].dateTime!),
                  onTapMore: () => _onTapMore(events.data![index].id!),
                );
              },
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  void _onTapMore(String id) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    showDialog(
        context: context,
        builder: (context) {
          return BottomButtonsDialog(
            mode: BottomDialogMode.archive,
            height: screenHeight *0.3,
            width: screenWidth,
            onTapButtonOne: ()async => await _controller.changeEventStatusToActive(context,id),
            onTapButtonTwo: ()async => await _controller.changeEventStatusToDone(context,id),
            onTapButtonThree: ()async => await _controller.changeEventStatusToDone(context,id),
            );
        });
  }
}