import 'package:ebooks/statemanagement/using%20single%20provider/controller/counter_provider.dart';
import 'package:ebooks/statemanagement/using%20multi%20provider/controller/theme_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider()),
    ],
    child: MyApp1()
    ),
  );
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider",
      theme: Provider.of<ThemeProvider>(context).darkTheme 
      ? ThemeData.dark() 
      : ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: IncreCount1(),
    );
  }
}

class IncreCount1 extends StatelessWidget {
  const IncreCount1({super.key});

  @override
  Widget build(BuildContext context) {
    //var counterProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        leading: Consumer(builder: (context, ThemeProvider provider, child){
          return IconButton(
            onPressed: (){
              provider.switchTheme();
            }, 
            icon: Icon(provider.darkTheme 
              ? Icons.dark_mode 
              : Icons.light_mode
            )
          );
        }),
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