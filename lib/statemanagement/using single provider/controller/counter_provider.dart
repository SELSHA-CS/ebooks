import 'package:ebooks/statemanagement/using%20single%20provider/model/Counter.dart';
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  final Counter _counter = Counter(0); 
  Counter get counter => _counter; //getter creation

  void increment(){
    counter.count++;
    notifyListeners();
  }

  void decrement(){
    counter.count--;
    notifyListeners();
  }
}