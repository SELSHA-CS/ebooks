import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA-hYC-dAE4pvYGRSHtPNpfsyrjUxuEg2U", 
      appId: "1:59186137835:android:22882225eff86699b80cae", 
      messagingSenderId: "", 
      projectId: "ebooksapp-6a8dc",
      storageBucket: "ebooksapp-6a8dc.appspot.com"
    )
  );
  runApp(
    MaterialApp(
      home: FireBaseCRUD(),
    ),
  );
}

class FireBaseCRUD extends StatefulWidget {
  const FireBaseCRUD({super.key});

  @override
  State<FireBaseCRUD> createState() => _FireBaseCRUDState();
}

class _FireBaseCRUDState extends State<FireBaseCRUD> {

  final cname = TextEditingController();
  final cemail = TextEditingController();
  late CollectionReference _userCollection; //object of collections in db

  @override
  void initState() {
    _userCollection = FirebaseFirestore.instance.collection("users");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data"),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => createUser(),
        child: Icon(Icons.person_add),
      ),
    );
  }
  void createUser(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Add user"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: cname,
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: cemail,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: (){}, 
            //   child: Text("Create User"),
            // ),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: (){
              Navigator.of(context).pop();
            }, 
            child: Text("Cancel")),
          OutlinedButton(
            onPressed: () => addUsertoDB(cname.text, cemail.text), 
            child: Text("Create User")),
        ],
      );
    });
  }
  Future<void> addUsertoDB(String name, String email) async{
    return _userCollection.add({
      'name':name,
      'email':email
    }).then((value){
      print("User Added Successfully");
      cname.clear();
      cemail.clear();
      Navigator.of(context).pop();
    }).catchError((error){
      print("Failed to add data $error");
    });
  }
}