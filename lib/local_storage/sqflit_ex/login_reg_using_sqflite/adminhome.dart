import 'package:ebooks/local_storage/sqflit_ex/login_reg_using_sqflite/dbaseFunction.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  bool isLoading = true;

  var users = [];

  @override
  void initState() {
    loadTask();
    super.initState();
  }

  Future<void> loadTask() async{
    final usr = await SQLHelpers.readUsers();
    setState(() {
      users = usr;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFDD0),
        title: Center(child: Text("Admin Panel")),
      ),
      body: isLoading == true ? Center(child: Lottie.asset("assets/animations/1.json")) : 
      //ListView(
        //children: [
          ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index){
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 221, 197, 197),
                    radius: 15,
                    child: Text("${users[index]["id"]}"),
                  ),
                  title: Text(users[index]['name']),
                  subtitle: Text(users[index]['emailid']),
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                ),
              );
            },
          ),
        //],
      //)
    );
  }
}