import 'package:ebooks/local_storage/hive_using_adapter/model/users.dart';
import 'package:ebooks/local_storage/hive_using_adapter/service/hive_DB.dart';
import 'package:ebooks/local_storage/hive_using_adapter/views/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {

  final uname = TextEditingController();
  final emailid = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Center(child: Text("Reisteration")),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: uname,
              decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
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
              //to fetch all registered userd from db
              final reg_users = await HiveDB.getallUsers();
              validateSignUp(reg_users);
            },
            color: Colors.purple[200],
            minWidth: 200,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text("REGISTER"),
          ),
          TextButton(
            onPressed: (){
              Get.to(Login());
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(builder: (context) => Login())
              // );
            }, 
            child: Text("Login Here", style: TextStyle(
              color: Colors.purple[200]
            ),),
          ),
        ],
      ),
    );
  }

  void validateSignUp(List<Users> users) async{
    final email = emailid.text;
    final pwd = password.text;
    final name = uname.text;
    bool userExist = false;
    final validateEmail = EmailValidator.validate(email); // results will be in bool
    if(email != "" && pwd != ""){
      if(validateEmail == true){
        await Future.forEach(users, (singleUser) {
          if(singleUser.email == email){
            userExist = true;
          }
          else{
            userExist = false;
          }
        });
        if(userExist == true){
          Get.snackbar("Failed", "User Already Exist !!!", colorText: Colors.red, backgroundColor: Colors.red[100]);
        }
        else{
          if(pwd.length < 6){
            Get.snackbar("Error", "Password length should be >= 6", colorText: Colors.red, backgroundColor: Colors.red[100]);
          }
          else{
            final user = Users(name: name, email: email, password: pwd);
            await HiveDB.addUser(user);
            Get.snackbar("Success", "User Registration sucess", colorText: Colors.red, backgroundColor: Colors.red[100]);
            Get.to(Login());
          }
        }
      }
      else{
        Get.snackbar("Empty Fieds", "Invalid Email Address", colorText: Colors.red, backgroundColor: Colors.red[100]);
      }
    }
    else{
      Get.snackbar("Error", "Field Must not be empty", colorText: Colors.red, backgroundColor: Colors.red[100]);
    }
  }
}