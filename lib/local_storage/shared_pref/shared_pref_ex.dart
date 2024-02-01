import 'package:ebooks/local_storage/shared_pref/sharedhome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(
    MaterialApp(
      home: Shared_Login(),
    ),
  );
}
class Shared_Login extends StatefulWidget {
  @override
  State<Shared_Login> createState() => _Shared_LoginState();
}

class _Shared_LoginState extends State<Shared_Login> {
  //const Shared_Login({super.key});

  final uname_controller = TextEditingController();

  final pass_controller = TextEditingController();

  late SharedPreferences preferences; 

  late bool isANewUser;

  @override
  void initState() {
    checkTheUserIsAlreadyLoggedIn();
    super.initState();
  }

  void checkTheUserIsAlreadyLoggedIn() async{
    preferences = await SharedPreferences.getInstance();
    isANewUser = preferences.getBool("newuser") ?? true;

    /// ?? - if first statement is null, second statement will execute
    if(isANewUser == false){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home_shared())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login using Shared"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login Page", style: TextStyle(
              fontSize: 20,
            ),),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: uname_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "UserName",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: pass_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () async{
                preferences = await SharedPreferences.getInstance();

                String email = uname_controller.text;
                String pwd = pass_controller.text;

                if(email != "" && pwd != ""){
                  preferences.setString("Email", email);
                  preferences.setString("Pass", pwd);
                  preferences.setBool("newuser", false);

                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Home_shared())
                  );
                  uname_controller.text = "";
                  pass_controller.text = "";
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please fill all the Fields"))
                  );
                }
                
              }, 
              child: Text("Login Here"),
            ),
          ],
        ),
      ),
    );
  }
}