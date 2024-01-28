import 'package:ebooks/firebase_database/email_password_auth/firebase_functions.dart';
import 'package:ebooks/firebase_database/email_password_auth/login.dart';
import 'package:flutter/material.dart';

class Fire_Home extends StatelessWidget {
  const Fire_Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            FireBaseFunction().logoutUser().then((value) => 
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Fire_Login())));
          }, 
          child: Text("Logout"),
        ),
      ),
    );
  }
}