import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper{

  ///create database
  static Future<sql.Database> openOrCreateDB() async{
    return await sql.openDatabase(
      "todo", 
      version: 1,
      onCreate: (database, version) async{
        await createTable(database);
      }
    );
  }

  ///create table
  static Future<void> createTable(sql.Database database) async{
    await database.execute(
      'CREATE TABLE task (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, content TEXT)'
    );
  }

  static Future<int> create(String title, String content) async{
    final db = await SQLHelper.openOrCreateDB(); //to open database
    var data = {'title' : title, 'content' : content};
    final id = await db.insert('task', data);
    return id;
  }
}
