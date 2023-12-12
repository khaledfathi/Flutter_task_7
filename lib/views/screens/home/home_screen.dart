import 'package:flutter/material.dart';
import 'package:task_l7/views/screens/home/home_archive/home_archive_screen.dart';
import 'package:task_l7/views/screens/home/home_done/home_done_screen.dart';
import 'package:task_l7/views/screens/home/home_events/home_events_screen.dart';

class HomeScreen extends StatefulWidget {
  
  static const String route = 'home'; 
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //sub screens
  final List<Widget> _subScreen = const [
    HomeEventsScreen(), 
    HomeDoneScreen() , 
    HomeArchiveScreen() ,
  ];

  //app bar titles 
  final List<String> _title = ['Events', 'Done' , 'Archive'] ; 

  //current page selected index
  late int _index ;  

  @override
  void initState() {
    _index= 0 ; 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(_title[_index]),
      ),
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 800),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (currentSelect)=> setState(()=> _index = currentSelect,), 
        selectedIndex: _index,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.menu), label: 'Event'),
          NavigationDestination(icon: Icon(Icons.check_circle_outline_rounded), label: 'Done'),
          NavigationDestination(icon: Icon(Icons.archive_outlined), label: 'Arvhice'),
      ]),
      body: _subScreen[_index],
    );
  }
}