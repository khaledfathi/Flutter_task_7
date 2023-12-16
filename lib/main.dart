
import 'package:flutter/material.dart';
import 'package:task_l7/controllers/services/database/app_database.dart';
import 'package:task_l7/views/screens/add_event/add_events_screen.dart';
import 'package:task_l7/views/screens/google_web_view/google_web_view_screen.dart';
import 'package:task_l7/views/screens/home/home_screen.dart';
import 'package:task_l7/controllers/services/globals/globals.dart' as globals ;
import 'package:task_l7/views/theme/dark_theme.dart';
import 'package:task_l7/views/theme/light_theme.dart'; 

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  
  //init database  depend on DBMS
  globals.appDatabase = AppDatabase.sqlite();
  await globals.appDatabase!.initDB(); 

  runApp( const App()); 
}

class App extends StatefulWidget {

  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme.apply,
      darkTheme: DarkTheme.apply,      
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route : (context) => const HomeScreen(), 
        GoogleWebViewScreen.route: (context) =>  GoogleWebViewScreen(), 
        AddEventsScreen.route : (context) => const AddEventsScreen(), 
      },
    );
  }
}