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
      body: StreamBuilder<QuerySnapshot>(stream: readUser(), builder: (context, snapshot){
        if(snapshot.hasError){
          return Center(child: Text("Error ${snapshot.error}"));
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        final users = snapshot.data!.docs;
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: ((context, index) {
          //final users = snapshot.data!.docs[index];
          final user = users[index]; 
          final userId = user.id;
          final userName = user["name"]; // or final uerName = user[index]["name"];
          final userEmail = user["email"];

          return ListTile(
            title: Text("$userName", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            subtitle: Text("$userEmail", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            trailing: Wrap(
              children: [
                IconButton(onPressed: (){
                  editUserData(userId);
                }, icon: Icon(Icons.edit)),
                IconButton(onPressed: (){
                  deleteUser(userId);
                }, icon: Icon(Icons.delete)),
              ],
            ),
          );
        }));
      }),
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
  
  ///read all the documents through querysnapshot
  Stream<QuerySnapshot> readUser() {
    return _userCollection.snapshots();
  }
  
  ///show bottomsheet to edit userdata
  void editUserData(String userId) {
    var uname  = TextEditingController();
    var uemail = TextEditingController();
    showModalBottomSheet(context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: uname,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: uemail,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              updateUser(userId, uname.text, uemail.text);
              uname.clear();
              uemail.clear();
            }, child: Text("Update User"))
          ],
        ),
      );
    });
  }
  
  Future<void> updateUser(String userId, String uname, String uemail) async{
    var updatevalues = {"name":uname, "email":uemail};
    return _userCollection.doc(userId).update(updatevalues).then((value){
      print("User data updated succesffully");
    }).catchError((error){
      print("User data updating failed");
    });
  }
  
  Future<void> deleteUser(var id) async{
    return _userCollection.doc(id).delete().then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User Deleted Successfully"))
      );
    }).catchError((error){
      print("User deletion failed $error");
    });
  }
}