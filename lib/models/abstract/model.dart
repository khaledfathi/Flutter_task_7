import 'package:flutter/material.dart';
import 'package:task_l7/controllers/services/globals/globals.dart' as globals;

abstract class Model<T> {
  String tableName;
  Map<String, dynamic>? row;

  Model({required this.tableName, this.row});
  List<T> createQueryModelList(List<Map<String, Object?>> queryResult);

  Future<List<T>> select({int? id}) async {
    List<T> records = [];
    if (id == null) {
      await globals.appDatabase!.table(tableName).select().then((queryResult) {
        if (queryResult.isNotEmpty) {
          records = createQueryModelList(queryResult);
        }
      });
    } else {
      await globals.appDatabase!
          .table(tableName)
          .select(id: id)
          .then((queryResult) {
        if (queryResult.isNotEmpty) {
          records = createQueryModelList(queryResult);
        }
      });
    }
    return records;
  }

  Future<List<T>> selectWhere(String where, List<Object?> whereArgs) async {
    List<T> records = [];
    await globals.appDatabase!
        .table(tableName)
        .selectWhere(where, whereArgs)
        .then((queryResult) {
      if (queryResult.isNotEmpty) {
        records = createQueryModelList(queryResult);
      }
    });
    return records;
  }

  Future<int> insert() async {
    try {
      return globals.appDatabase!.table(tableName).insert(row);
    } catch (e) {
      debugPrint(e.toString());
    }
    return 0;
  }

  Future<int> update(int id) async {
    Map<String, dynamic> newRow = {};
    row!.forEach((key, value) => value.isNotEmpty ? newRow[key] = value : null);
    try {
      return globals.appDatabase!.table(tableName).update(newRow, id);
    } catch (e) {
      debugPrint(e.toString());
    }
    return 0;
  }

  Future<int> updateWhere(String where, List<Object?> whereArgs) async {
    Map<String, dynamic> newRow = {};
    row!.forEach((key, value) => value.isNotEmpty ? newRow[key] = value : null);
    return globals.appDatabase!.table(tableName).update(where, whereArgs);
  }

  Future<int> delete({int? id}) {
    if (id == null) {
      return globals.appDatabase!.table(tableName).delete();
    } else {
      return globals.appDatabase!.table(tableName).delete(id: id);
    }
  }

  Future<int> deleteWhere(String where, List<Object?> whereArgs) {
    return globals.appDatabase!.table(tableName).delete(where, whereArgs);
  }

  Map<String, dynamic> toMap();
}
