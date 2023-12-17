
import 'package:flutter/material.dart';
import 'package:task_l7/controllers/states/global_state.dart';
import 'package:task_l7/models/event_model.dart';
import 'package:task_l7/views/screens/home/home_screen.dart';

class HomeController {
  bool changeTheme ( bool isThemeLight ,GlobaleState global ){
    if (isThemeLight){
      global.changeThemeToDark(); 
      debugPrint('HomeController : Line 9 : Theme is changed to DARK Theme'); 
     return false; 
    }else {
    debugPrint('HomeController : Line 12 : Theme is changed to LIGHT Theme'); 
      global.changeThemeToLight();  
      ThemeMode.light; 
     return true ; 
    }
  }
  Future<void> deleteAllEvents (BuildContext context)async {
    await EventModel().delete().then((_){
      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.route, (route) => false); 
    }); 
  }

 
}