const DATABASE_NAME = 'mydb.db';
const List<String> SCHEMA = [
  '''
    CREATE TABLE "events" (
        "id"	INTEGER,
        "title" TEXT,
        "description" TEXT,
        "date_time" TEXT,
        "status" TEXT,
        PRIMARY KEY("id" AUTOINCREMENT)
      );
  ''',
];
