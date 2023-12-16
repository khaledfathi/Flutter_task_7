import 'package:flutter/material.dart';
import 'package:task_l7/controllers/services/constants/general_constants.dart';
import 'package:task_l7/views/screens/add_event/add_events_screen.dart';

class EventsPageHeader extends StatelessWidget {
  const EventsPageHeader({super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                  child: Text(_currentDate(),
                style: Theme.of(context).textTheme.titleMedium,
              )),
              FittedBox(
                  child: Text( 'Today',
                style: Theme.of(context).textTheme.titleMedium,
              )),
            ],
          ),
          //add event button
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(AddEventsScreen.route),
            child: Container(
              height: 50,
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color.fromRGBO(255, 87, 34, 1),
                  Color.fromRGBO(255, 144, 93, 1)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Add Event',
                style: TextStyle(color:Colors.white ,fontSize: 18 , fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  String _currentDate (){
    DateTime today = DateTime.now();
    return '${today.day} ${MONTHES[today.month-1]} , ${today.year}';
  }
}
