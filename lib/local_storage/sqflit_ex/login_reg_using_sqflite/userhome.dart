import 'package:ebooks/local_storage/sqflit_ex/login_reg_using_sqflite/dbaseFunction.dart';
import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  final data;
  const UserHome({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    var uName = TextEditingController();
    var uEmail = TextEditingController();

    void editUser() {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Center(child: Text("Edit User")),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: uName,
                  decoration: InputDecoration(
                    hintText: "Name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: uEmail,
                  decoration: InputDecoration(
                    hintText: "Email Id",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              MaterialButton(
                onPressed: (){},
                color: Colors.black26,
                minWidth: 100,
                height: 50,
                child: Text("UPDATE", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        );
      });
    }

    var userName  = data[0]['name'];
    var userEmail = data[0]['emailid'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFDD0),
        title: Text("Welcome $userName"),
      ),
      body: Card(
        color: Color.fromARGB(255, 221, 197, 197),
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text(userName),
          subtitle: Text(userEmail),
          trailing: IconButton(
            onPressed: (){
              editUser();
            }, 
            icon: Icon(Icons.edit),
          ),
        ),
      )
    );
  }
}