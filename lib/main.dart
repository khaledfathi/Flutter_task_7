
import 'package:flutter/material.dart';
import 'package:task_l7/controllers/services/session/session.dart';
import 'package:task_l7/views/screens/home/home_archive/home_archive_screen.dart';
import 'package:task_l7/views/screens/home/home_done/home_done_screen.dart';
import 'package:task_l7/views/screens/home/home_events/home_events_screen.dart';
import 'package:task_l7/views/screens/home/home_screen.dart';
import 'package:task_l7/views/theme/dark_theme.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized(); 
  Session.init(); 
  runApp(const App()); 
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: DarkTheme.theme,
      // darkTheme: DarkTheme.theme,
      initialRoute: HomeScreen.route,
      routes: {
        //main home screen
        HomeScreen.route : (context) => const HomeScreen(), 
        // home sub screens
        HomeEventsScreen.route : (context)=> const HomeEventsScreen(),
        HomeDoneScreen.route : (context)=> const HomeDoneScreen(), 
        HomeArchiveScreen.route : (context) => const HomeArchiveScreen(), 
      },
    );
  }
}