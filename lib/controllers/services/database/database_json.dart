import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:task_l7/controllers/services/constants/general_constants.dart';
import 'package:task_l7/controllers/services/session/session.dart';

// Database like, by using (shared_prefrence lib) 
class DatabaseJson {
  
  static Future<bool> create(Map<String, String> row) async {
    List<String>? currentData = Session.currentSession!.getStringList(DB);
    if (currentData == null) {
      row['id'] = '0' ; 
      return await Session.currentSession!.setStringList(DB, [jsonEncode(row)]);
    } else {
      var lastRecord = currentData.isNotEmpty ? currentData.last : ''; 
      String id = jsonDecode(lastRecord)['id'];

      //increment id  
      row['id'] = (int.parse(id)+1).toString() ; 
      currentData.add(jsonEncode(row));

      return await Session.currentSession!.setStringList(DB, currentData);
    }
  }

  static List<Map<String, dynamic>> read({int? id}) {
    List<String>? data = Session.currentSession!.getStringList(DB);
    List<Map<String, dynamic>> result = [];
    try { // prevent index out of range
      if (data != null) {
        if (id == null) {
          //read all
          for (var row in data) {
            result.add(jsonDecode(row));
          }
        } else {
          for (var row in data) {
            Map<String, dynamic> selectedRow = jsonDecode(row); 
            if (selectedRow['id'] == id.toString()){
              result.add(selectedRow);
              break;  
            }
          }
        }
      }
    } catch (e) {
      debugPrint('=== ERROR : $e'); 
      null;
    }
    return result;
  }

  static Future<bool> update(Map<String, String> row, int id) async {
    List<String>? data = Session.currentSession!.getStringList(DB);
    if (data != null) {
      try {
        for (var row_ in data) {
          Map<String,dynamic> selectedRow=  jsonDecode(row_); 
          if(selectedRow['id'] == id.toString()){
            data[id] = jsonEncode(row);
            await Session.currentSession!.setStringList(DB, data);
            return true;
          }
        }
      } catch (e) {
        debugPrint('=== ERROR : $e'); 
      }
    }
    return false;
  }

  static Future<bool> delete({int? id}) async {
    List<String>? data = Session.currentSession!.getStringList(DB);
    if (id == null) {
      //delete all
      Session.currentSession!.clear();
      return true;
    } else {
      // delete by id
      try {
        for (var i = 0; i < data!.length; i++) {
          Map<String, dynamic>  selectedRow = jsonDecode(data[i]); 
          if (selectedRow['id'] == id.toString()){
            data.removeAt(i); 
            await Session.currentSession!.setStringList(DB, data);
            return true;
          }
        }
      } catch (e) {
        debugPrint('=== ERROR : $e'); 
      }
    }
    return false;
  }
}
