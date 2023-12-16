import 'package:flutter/material.dart';
import 'package:task_l7/controllers/screens/home/home_controller.dart';
import 'package:task_l7/views/screens/home/components/home_app_bar.dart';
import 'package:task_l7/views/screens/home/components/home_bottom_navigator_bar.dart';
import 'package:task_l7/views/screens/home/components/home_drawer.dart';
import 'package:task_l7/views/screens/home/home_active_events/home_active_events_screen.dart';
import 'package:task_l7/views/screens/home/home_archive_events/home_archive_events_screen.dart';
import 'package:task_l7/views/screens/home/home_done_events/home_done_events_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'home';
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //screen controlle
  final HomeController _controller = HomeController();
  //sub screens
  final List<Widget> _subScreen = const [
    HomeActiveEventsScreen(),
    HomeDoneEventsScreen(),
    HomeArchiveEventsScreen(),
  ];
  //app bar titles
  final List<String> _title = ['My Events', 'Done Events', 'Archive Events'];
  //current selected index for navigator bar
  late int _index;
  //current Theme flag 
  late bool _isThemeLight;

  @override
  void initState() {
    _index = 0;
    _isThemeLight = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
          title: _title[_index],
          isThemeLight: _isThemeLight,
          onPressChangeTheme: ()=> _changeTheme()
        ),
      drawer: HomeDrawer(
        onTapDeleteAll: _onTapDeleteAll,
      ),
      bottomNavigationBar: HomeBottomNavigatorBar(
        selectedIndex: _index,
        onDestinationSelected: (val) => _onDestinationSelected(val),
      ),
      body: _subScreen[_index],
    );
  }

  //HomeBottomNavigatorBar : on click 
  void _onDestinationSelected(int val) {
    setState(() {
      _index = val;
    });
  }

  //HomeAppBar : onPressChangeTheme (change theme icon buttom)
  void _changeTheme() {
    _isThemeLight = _controller.changeTheme(_isThemeLight);
    setState(() {});
  }

  void _onTapDeleteAll () async{
    await _controller.deleteAllEvents(context);
  }
}
