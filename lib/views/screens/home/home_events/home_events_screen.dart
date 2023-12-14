import 'package:flutter/material.dart';
import 'package:task_l7/views/shared/events_page/events_page.dart';

class HomeEventsScreen extends StatefulWidget {
  static const String route = 'home-events';
  const HomeEventsScreen({super.key});

  @override
  State<HomeEventsScreen> createState() => _HomeEventsScreenState();
}

class _HomeEventsScreenState extends State<HomeEventsScreen> {

  @override
  Widget build(BuildContext context) {
    return EventsPage(); 
  }

}
