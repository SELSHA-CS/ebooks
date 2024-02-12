import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main()async{
  await Hive.initFlutter();
  await Hive.openBox("todo");
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HiveTodo(),
    ),
  );
}

class HiveTodo extends StatefulWidget {
  const HiveTodo({super.key});

  @override
  State<HiveTodo> createState() => _HiveTodoState();
}

class _HiveTodoState extends State<HiveTodo> {

  final ctitle = TextEditingController();
  final ccontent = TextEditingController();
  final todo_box = Hive.box('todo');
  var mytasks = [];

  @override
  void initState() {
    load_or_read_Task();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text("Hive_ToDo"),
        actions: [
          IconButton(onPressed: () => createDialog(null), icon: Icon(Icons.add))
        ],
      ),
      body: mytasks.isEmpty 
      ? Center(
          child: CircularProgressIndicator(
            color: Colors.purple[200],
          ),
        )
      : ListView.builder(
        itemCount: mytasks.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              tileColor: Colors.pink[200],
              leading: Text("${mytasks[index]['id']}"),
              title: Text(mytasks[index]['head']),
              subtitle: Text(mytasks[index]['desc']),
              trailing: Wrap(
                children: [
                  IconButton(
                    onPressed: (){
                      createDialog(mytasks[index]['id']);
                    }, 
                    icon: Icon(Icons.edit)),
                  IconButton(
                    onPressed: () async{
                      await todo_box.delete(mytasks[index]['id']);
                      load_or_read_Task();
                    }, 
                    icon: Icon(Icons.delete))
                ],
              ),
            ),
          );
      })
    );
  }
  
  void createDialog(int? key) { // key - similiar to id in sqflite
  if(key != null){
    final existingTask = mytasks.firstWhere((element) => element['id'] == key);
    ctitle.text = existingTask['head'];
    ccontent.text = existingTask['desc'];
  }
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text(key == null ? "Create Task" : "Update Task"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ctitle,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Title"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ccontent,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Content"
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: (){
              if(key == null){
                createTask({
                  'title' : ctitle.text,
                  'content' : ccontent.text,
                });
                ctitle.clear();
                ccontent.clear();
                Navigator.of(context).pop();
              }
              else{
                updateTask(key,{
                  'title' : ctitle.text,
                  'content': ccontent.text
                });
                ctitle.clear();
                ccontent.clear();
                Navigator.of(context).pop();
              }
            }, 
            child: Text(key == null ? "Create" : "Update")),
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text("Cancel"))
        ],
      );
    });
  }
  
  Future<void> createTask(Map<String, dynamic> task) async{
    await todo_box.add(task);
    load_or_read_Task();
  }


  ///read task
  Future<void> load_or_read_Task() async{
    final task_from_hive = todo_box.keys.map((e){ // to read all the keys of todo_box
    //fetch all the keys from hive in ascending order
      final value = todo_box.get(e);
      return {
        'id' : e,
        'head' : value['title'],
        'desc' : value['content']
      };
    }).toList(); 
    setState(() {
      mytasks = task_from_hive.reversed.toList();
    });
  }
  

  //update task
  Future<void> updateTask(int key, Map<String, String> uptask) async{
    await todo_box.put(key, uptask);
    load_or_read_Task();
  }
}