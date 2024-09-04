import 'package:flutter/material.dart';
import 'package:habittrackerapp/theme/theme.dart';

class ThemeProvider extends ChangeNotifier{

  //initail value
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData td){
    _themeData = td;
    notifyListeners();
  }

  bool get isDarkmode => _themeData == darkMode;

  void themeToogle(){
    if(_themeData == lightMode){
      themeData = darkMode;
    }
    else{
      themeData = lightMode;
    }
  }
}