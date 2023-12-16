
import 'package:flutter/material.dart';
import 'package:task_l7/models/event_model.dart';
import 'package:task_l7/views/screens/home/home_screen.dart';

class HomeController {
  bool changeTheme (bool isThemeLight){
    if (isThemeLight){
     return false; 
    }else {
     return true ; 
    }
  }
  Future<void> deleteAllEvents (BuildContext context)async {
    await EventModel().delete().then((_){
      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.route, (route) => false); 
    }); 
  }
}