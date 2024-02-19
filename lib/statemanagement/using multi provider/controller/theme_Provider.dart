import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDarkTheme = false;
  bool get darkTheme => _isDarkTheme;

  void switchTheme(){
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}