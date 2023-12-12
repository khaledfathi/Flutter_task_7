import 'package:shared_preferences/shared_preferences.dart';

class Session {

  static SharedPreferences? currentSession ; 
  
  static Future<void> init()async{
    currentSession = await SharedPreferences.getInstance(); 
  }
}