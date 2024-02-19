import 'package:ebooks/local_storage/hive_using_adapter/model/users.dart';
import 'package:ebooks/local_storage/hive_using_adapter/service/hive_DB.dart';
import 'package:ebooks/local_storage/hive_using_adapter/views/home.dart';
import 'package:ebooks/local_storage/hive_using_adapter/views/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(UsersAdapter());
  await Hive.openBox<Users>('userdata');
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    )
  );
}

class Login extends StatelessWidget {
  
  final emailid = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text("Login"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: emailid,
              decoration: InputDecoration(
                hintText: "Email ID",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          MaterialButton(
            onPressed: () async{
              final reg_users = await HiveDB.getallUsers();
              validateLogin(reg_users);
            },
            color: Colors.purple[200],
            minWidth: 200,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text("LOGIN"),
          ),
          TextButton(
            onPressed: (){
              Get.to(Register());
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(builder: (context) => Register())
              // );
            }, 
            child: Text("Register Here", style: TextStyle(
              color: Colors.purple[200]
            ),),
          ),
        ],
      ),
    );
  }
  void validateLogin(List<Users> users) async{
    final lemail = emailid.text;
    final lpass = password.text;
    if(lemail != "" && lpass != ""){
      await Future.forEach(users, (singleUser) {
        if(lemail == singleUser.email && lpass == singleUser.password){
          Get.offAll(Home());
          Get.snackbar("Success", "User Login Success");
        }
        else{
          Get.snackbar("Error", "Invalid login credentials");
        }
      });
    }
    else{
      Get.snackbar("Error", "Fields Must not be Empty");
    }
  }
}