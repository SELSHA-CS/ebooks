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
    //var counterProvider = Provider.of<CounterProvider>(context);
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
            Consumer<CounterProvider>(
              builder: (BuildContext context, CounterProvider counterProvider, Widget? child) { 
                return Text("Count : ${counterProvider.counter.count}", style: TextStyle(
                  fontSize: 20,
              ),);
               },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    Provider.of<CounterProvider>(context, listen: false).increment();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.green[300],
                    child: Icon(Icons.add),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Provider.of<CounterProvider>(context, listen: false).decrement();
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