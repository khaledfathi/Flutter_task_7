import 'package:flutter/material.dart';

class HomeEventsScreen extends StatefulWidget {
  static const String route = 'home-events';
  const HomeEventsScreen({super.key});

  @override
  State<HomeEventsScreen> createState() => _HomeEventsScreenState();
}

class _HomeEventsScreenState extends State<HomeEventsScreen> {
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            ElevatedButton(onPressed: () async {}, child: Text('data')),
          ],
        ));
  }
}
