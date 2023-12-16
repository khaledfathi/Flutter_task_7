import 'package:flutter/material.dart';
import 'package:task_l7/views/theme/dark_theme.dart';
import 'package:task_l7/views/theme/light_theme.dart';

class GlobaleState extends ChangeNotifier{
  ThemeData theme = LightTheme.apply; 

  void changeThemeToDark (){
    theme = DarkTheme.apply; 
    notifyListeners();
  }
  void changeThemeToLight (){
    theme = LightTheme.apply; 
    notifyListeners();
  }
}