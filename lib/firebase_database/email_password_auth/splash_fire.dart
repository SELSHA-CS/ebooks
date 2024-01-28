import 'dart:async';
import 'package:ebooks/firebase_database/email_password_auth/home.dart';
import 'package:ebooks/firebase_database/email_password_auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA-hYC-dAE4pvYGRSHtPNpfsyrjUxuEg2U", 
      appId: "1:59186137835:android:22882225eff86699b80cae", 
      messagingSenderId: "", 
      projectId: "ebooksapp-6a8dc",
    )
  );
  User? user = FirebaseAuth.instance.currentUser; //to fetch the user who logged in
  runApp(
    MaterialApp(
      home: user == null ? Fire_Splash() : Fire_Home(),
    ),
  );
}
class Fire_Splash extends StatefulWidget {
  const Fire_Splash({super.key});

  @override
  State<Fire_Splash> createState() => _Fire_SplashState();
}

class _Fire_SplashState extends State<Fire_Splash> {

  @override
  void initState() {
    Timer(Duration(seconds: 5), () { 
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Fire_Login()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/gifs/duck.gif"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}