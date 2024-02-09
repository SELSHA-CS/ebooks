import 'dart:async';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:ebooks/local_storage/sqflit_ex/login_reg_using_sqflite/introscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => IntroScreen())
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 50,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue[800],
            ),
          ),
          Positioned(
            top: 100,
            left: 300,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.pink[300],
            ),
          ),
          Positioned(
            left: 100,
            top: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientText(
                  "PUNCH", style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                  colors: [
                    Colors.pink,
                    Colors.black,
                    Colors.purple,
                    Colors.black,
                    Colors.blueAccent,
                    Colors.black,
                    Colors.cyan
                  ]
                ),
                EasyRichText(
                  "Punch . Earn . Repeat",
                  patternList: [
                    EasyRichTextPattern(
                      targetString: 'Punch',
                      style: TextStyle(color: Colors.pink),
                    ),
                    EasyRichTextPattern(
                      targetString: 'Earn',
                      style: TextStyle(color: const Color.fromARGB(255, 27, 107, 172)),
                    ),
                    EasyRichTextPattern(
                      targetString: 'Repeat',
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 150,
            left: 100,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.cyan,
            ),
          )
        ],
      ),
    );
  }
}