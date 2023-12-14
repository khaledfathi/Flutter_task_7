import 'package:task_l7/controllers/services/database/database_sqlite.dart';
import 'package:task_l7/controllers/services/database/interface/database_core_interface.dart';

class AppDatabase {
  static DatabaseCoreInterface<DatabaseSqlite> sqlite(){ return DatabaseSqlite();}
  // static DatabaseCore? mysql(){ /*instantce of database mysql*/}
  // static DatabaseCore? postgre(){ /*instantce of database postgre*/}
}