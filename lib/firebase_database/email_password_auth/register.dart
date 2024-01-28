import 'package:ebooks/firebase_database/email_password_auth/firebase_functions.dart';
import 'package:ebooks/firebase_database/email_password_auth/login.dart';
import 'package:flutter/material.dart';

class Fire_Register extends StatelessWidget{
  final email = TextEditingController();
  final pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Registration Page"),
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
            ElevatedButton(
              onPressed: (){
                String emaill = email.text.trim();
                String password = pass.text.trim();
                FireBaseFunction().registerUser(email:emaill,pwd:password)
                .then((response) {
                  if(response == null){
                    Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Fire_Login())
                  );
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response))
                    );
                  }
                });
              }, 
              child: Text("Regiater Here"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: StadiumBorder()
              ),
            ),
            SizedBox(height: 15,),
            TextButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Fire_Login())
                );
              }, 
              child: RichText(
                text: TextSpan(
                  text: "Already have an account",
                  children: [
                    TextSpan(
                      text: "Login Here",
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