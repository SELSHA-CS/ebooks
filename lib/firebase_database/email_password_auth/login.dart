import 'package:ebooks/firebase_database/email_password_auth/firebase_functions.dart';
import 'package:ebooks/firebase_database/email_password_auth/home.dart';
import 'package:ebooks/firebase_database/email_password_auth/register.dart';
import 'package:flutter/material.dart';
class Fire_Login extends StatelessWidget{
  final email = TextEditingController();
  final pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            MaterialButton(
              onPressed: (){
                FireBaseFunction().loginUser(emaill:email.text.trim(), pwd:pass.text.trim())
                .then((response){
                  if(response == null){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Fire_Home()));
                  }
                });
              },
              shape: StadiumBorder(),
              color: Colors.brown,
              child: Text("Login Here"),
            ),
            SizedBox(height: 15,),
            TextButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Fire_Register())
                );
              }, 
              child: RichText(
                text: TextSpan(
                  text: "Not a user",
                  children: [
                    TextSpan(
                      text: "Register Here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}