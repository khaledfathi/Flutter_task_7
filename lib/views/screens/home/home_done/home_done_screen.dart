import 'package:flutter/material.dart';
import 'package:task_l7/views/shared/events_page/events_page.dart';

class HomeDoneScreen extends StatefulWidget {
  static const String route = 'home-done';
  const HomeDoneScreen({super.key});

  @override
  State<HomeDoneScreen> createState() => _HomeDoneScreenState();
}

class _HomeDoneScreenState extends State<HomeDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return EventsPage(); 
  }
}
