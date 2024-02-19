import 'package:ebooks/statemanagement/using%20multi%20provider/model/Counter.dart';
import 'package:flutter/material.dart';

class CounterProvider1 extends ChangeNotifier{
  final Counter1 _counter = Counter1(0); 
  Counter1 get counter => _counter; //getter creation

  void increment(){
    counter.count++;
    notifyListeners();
  }

  void decrement(){
    counter.count--;
    notifyListeners();
  }
}