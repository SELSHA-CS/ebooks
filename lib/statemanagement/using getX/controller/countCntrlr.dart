import 'package:get/get.dart';

class CountCntrl extends GetxController{
  var count = 8.obs;

  void increment(){
    count++;
  }

  void decrement(){
    count--;
  }
}