import 'package:ebooks/local_storage/sqflit_ex/login_reg_using_sqflite/loginpage.dart';
import 'package:ebooks/local_storage/sqflit_ex/login_reg_using_sqflite/regpage.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 43, 139, 218),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 250,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.pink[300],
            ),
          ),
          Positioned(
            top: 150,
            left: 200,
            child: CircleAvatar(
              radius: 150,
              backgroundColor: Colors.cyan[300],
            ),
          ),
          Positioned(
            top: 150,
            left: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("PUNCH", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),),
                Text("Punch . Earn . Repeat", style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10,),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/gifs/cc.png")),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Organize, find, and enjoy your loyalty cards in a more modern and dynamic way",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  MaterialButton(
                    color: Colors.black,
                    minWidth: 300,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register())
                      );
                    },
                    child: Text("SIGN UP", style: TextStyle(
                      color: Colors.white,
                    ),),
                  ),
                  SizedBox(height: 10,),
                  OutlinedButton( 
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      minimumSize: Size(300, 50),
                    ),                   
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Login())
                      );
                    },
                    child: Text("LOGIN", style: TextStyle(
                      color: Colors.black,
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}