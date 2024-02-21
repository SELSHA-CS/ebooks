import 'package:ebooks/statemanagement/using%20getX/controller/countCntrlr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(
    MaterialApp(
      home: GetCountMain(),
    ),
  );
}

class GetCountMain extends StatelessWidget {
  const GetCountMain({super.key});

  @override
  Widget build(BuildContext context) {

    final CountCntrl countcontroller = Get.put(CountCntrl()); //creating an instance of controller(or register the controller inside this widget tree)

    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Counter"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Counter using Getx", style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20,
            ),),
            Obx(() => Text("Count = ${countcontroller.count}")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    countcontroller.increment();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.green[300],
                    child: Icon(Icons.add),
                  ),
                ),
                InkWell(
                  onTap: (){
                    countcontroller.decrement();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.red[300],
                    child: Icon(Icons.remove),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}