import 'package:ebooks/local_storage/sqflit_ex/todo_using_sqflite/dbFunction.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyToDo(),
    ),
  );
}
class MyToDo extends StatefulWidget {
  const MyToDo({super.key});

  @override
  State<MyToDo> createState() => _MyToDoState();
}

class _MyToDoState extends State<MyToDo> {

  final ctitle = TextEditingController();
  final ccontent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("ToDo"),
      ),
      body: Column(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showSheet(null),
        backgroundColor: Colors.purple, 
        label: Text("Create Task"),),
    );
  }
  
  void showSheet(int? id) async{
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (context){
      return Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 120
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: ctitle,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Title",
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: ccontent,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Content",
              ),
            ),
            ElevatedButton(
              onPressed: (){
                if(id == null){
                  createTask();
                  ctitle.text = "";
                  ccontent.text = "";
                }
                if(id  != null){
                  //updateTask();
                  ctitle.text = "";
                  ccontent.text = "";
                }
              }, 
              child: Text(
                id == null ? "Create Task" : "Update Task"
              ))
          ],
        ),
      );
    });
  }
  
  Future<void> createTask() async{
    var id = await SQLHelper.create(ctitle.text, ccontent.text);
    print(id);
  }
}