import 'package:ebooks/local_storage/shared_pref/log_reg_using%20shared_pref/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Register(),
    ),
  );
}

class Register extends StatelessWidget {
  //const Register({super.key});

  final name_ctrl = TextEditingController();
  final uname_ctrl = TextEditingController();
  final pswd_ctrl = TextEditingController();

  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: name_ctrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: uname_ctrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Username",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: pswd_ctrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
              ),
            ),
            MaterialButton(
              onPressed: () async{
                prefs = await SharedPreferences.getInstance();

                String name = name_ctrl.text;
                String uname = uname_ctrl.text;
                String pswd = pswd_ctrl.text; 

                if(name != "" && uname != "" && pswd != ""){
                  
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,
              child: Text("REGISTER",),
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Login())
                );
              }, 
              child: Text("Already have account. Login"),
            ),
          ],
        ),
      ),
    );
  }
}