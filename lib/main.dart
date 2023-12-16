import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_l7/controllers/services/database/app_database.dart';
import 'package:task_l7/controllers/states/global_state.dart';
import 'package:task_l7/views/screens/add_event/add_events_screen.dart';
import 'package:task_l7/views/screens/google_web_view/google_web_view_screen.dart';
import 'package:task_l7/views/screens/home/home_screen.dart';
import 'package:task_l7/controllers/services/globals/globals.dart' as globals;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //init database  depend on DBMS
  globals.appDatabase = AppDatabase.sqlite();
  await globals.appDatabase!.initDB();

  runApp(
    ChangeNotifierProvider(
      create: (_) => GlobaleState(),
      child: const App(),
    ),
  );
  // runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobaleState>(builder: (context, global, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: global.theme,
        themeMode: ThemeMode.light,
        initialRoute: HomeScreen.route,
        routes: {
          HomeScreen.route: (context) => const HomeScreen(),
          GoogleWebViewScreen.route: (context) => GoogleWebViewScreen(),
          AddEventsScreen.route: (context) => const AddEventsScreen(),
        },
      );
    });
  }
}
