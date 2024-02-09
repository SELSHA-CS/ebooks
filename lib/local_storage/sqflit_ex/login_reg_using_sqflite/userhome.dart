import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  final data;
  const UserHome({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome "),
      ),
    );
  }
}