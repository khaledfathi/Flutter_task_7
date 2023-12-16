import 'package:flutter/material.dart';
import 'package:task_l7/controllers/enum/bottom_dialog_mode.dart';
import 'package:task_l7/controllers/helper/helper.dart';
import 'package:task_l7/controllers/screens/home/done_events/home_done_events_controller.dart';
import 'package:task_l7/models/event_model.dart';
import 'package:task_l7/views/shared/bottom_buttons_dialog.dart';
import 'package:task_l7/views/shared/event_view_box.dart';
import 'package:task_l7/views/shared/events_page/events_page.dart';

class HomeDoneEventsScreen extends StatefulWidget {
  const HomeDoneEventsScreen({super.key});

  @override
  State<HomeDoneEventsScreen> createState() => _HomeDoneScreenState();
}

class _HomeDoneScreenState extends State<HomeDoneEventsScreen> {
  //screen controller
  final HomeDoneEventsController _controller = HomeDoneEventsController();
  //values
  late Future<List<EventModel>> _data;

  @override
  void initState() {
    _data = _controller.getDoneEvents();
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
                  onTapMore: () => _onTapMore(events.data![index].id! , events.data! , index),
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


  void _onTapMore(String id, List<EventModel> eventsList, int index) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    showDialog(
        context: context,
        builder: (context) {
          return BottomButtonsDialog(
              mode: BottomDialogMode.done,
              height: screenHeight * 0.3,
              width: screenWidth,
              onTapButtonOne: () async {
                await _controller.changeEventStatusToActive(context, id);
                setState(() {
                  eventsList.removeAt(index);
                });
              },
              onTapButtonTwo: () async {
                await _controller.changeEventStatusToArchive(context, id);
                setState(() {
                  eventsList.removeAt(index);
                });
              },
              onTapButtonThree: () async {
                await _controller
                    .deleteEvent(context, id)
                    .then((value) => setState(() {}));
                setState(() {
                  eventsList.removeAt(index);
                });
              });
        });
  }

}
