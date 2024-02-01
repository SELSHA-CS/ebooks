import 'package:ebooks/local_storage/shared_pref/shared_pref_ex.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home_shared extends StatefulWidget {
  const Home_shared({super.key});

  @override
  State<Home_shared> createState() => _Home_sharedState();
}

class _Home_sharedState extends State<Home_shared> {

  late SharedPreferences preferences;
  late String username;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async{
    preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("Email")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome $username", style: TextStyle(
          fontSize: 15,
        ),),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            preferences = await SharedPreferences.getInstance();
            preferences.setBool("newuser", true); // user logged out
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Shared_Login())
            );
          }, 
          child: Text("LogOut"),
        ),
      ),
    );
  }
}