import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_l7/controllers/services/database/database_json.dart';
import 'package:task_l7/controllers/services/session/session.dart';

void main (){
  // WidgetsFlutterBinding.ensureInitialized(); 
  // Session.init(); 
  group('Database Json', () {
    test('create', () async {
      bool isCreated = await DatabaseJson.create({'test_field': 'test_text'});
      return expect(isCreated , true);
    });
  });
}