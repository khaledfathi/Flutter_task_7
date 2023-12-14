import 'package:flutter/material.dart';
import 'package:task_l7/views/shared/events_page/events_page.dart';

class HomeArchiveScreen extends StatefulWidget {
  static const String route = 'home-archive'; 
  const HomeArchiveScreen({super.key});

  @override
  State<HomeArchiveScreen> createState() => _HomeArchiveScreenState();
}

class _HomeArchiveScreenState extends State<HomeArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    return EventsPage(); 
  }
}