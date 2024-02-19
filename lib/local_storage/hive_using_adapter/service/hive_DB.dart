import 'package:ebooks/local_storage/hive_using_adapter/model/users.dart';
import 'package:hive/hive.dart';

class HiveDB{
  // HiveDB.constr();
  // static HiveDB instance = HiveDB.constr();
  // factory HiveDB(){
  //   return instance;
  // }
  static Future<void> addUser(Users user) async{
    final db = await Hive.openBox('userdata');
    db.put(user.id, user); //to store userdata to db
  }

  static Future<List<Users>> getallUsers() async{
    final db = await Hive.openBox<Users>('userdata');
    return db.values.toList();
  }
}