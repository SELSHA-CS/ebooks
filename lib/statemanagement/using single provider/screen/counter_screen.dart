import 'package:ebooks/statemanagement/using%20single%20provider/controller/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: IncreCount(),
      ),
    )
  );
}

class IncreCount extends StatelessWidget {
  const IncreCount({super.key});

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context); //specify which provider is working on this screen
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Press Button to Increment value", style: TextStyle(
              fontSize: 20,
            ),),
            Text("Count : ${counterProvider.counter.count}", style: TextStyle(
              fontSize: 20,
            ),),
            // ElevatedButton(
            //   onPressed: (){
            //     counterProvider.increment();
            //   }, 
            //   child: Text("Increment")
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    counterProvider.increment();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.green[300],
                    child: Icon(Icons.add),
                  ),
                ),
                InkWell(
                  onTap: (){
                    counterProvider.decrement();
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