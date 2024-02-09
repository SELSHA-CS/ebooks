import 'package:sqflite/sqflite.dart' as sql;

class SQLHelpers{
  static Future<sql.Database> openOrCreateDB() async{
    return await sql.openDatabase(
      "punch",
      version: 1,
      onCreate: (sql.Database db, version) async{
        await createTable(db);
      },
    );
  }
  
  static Future<void> createTable(sql.Database db) async{
    await db.execute(
      'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, phnno TEXT, emailid TEXT, pswd TEXT)'
    );
  }

  static Future<int> insertValues(String name, String phnno,String email, String password) async{
    var db = await SQLHelpers.openOrCreateDB();
    var data = {
      'name' : name,
      'phnno' : phnno,
      'emailid' : email,
      'pswd' : password
    };
    var id = await db.insert('users', data);
    return id;
  }

  static checkUser(String email, String password) async{
    var db = await SQLHelpers.openOrCreateDB();
    final data = await db.rawQuery(
      "SELECT * FROM users WHERE emailid = '$email' AND pswd = '$password'"
    );
    if(data.isNotEmpty){
      return data;
    }
    else{
      return data;
    }
  }

  static Future<List<Map<String, dynamic>>> readUsers() async{
    var db = await SQLHelpers.openOrCreateDB();
    final allUsers = await db.rawQuery(
      "SELECT * FROM users"
    );
    return allUsers;
  }
}