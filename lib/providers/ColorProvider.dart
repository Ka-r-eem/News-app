import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier{

  Color? color = Color(0xFF39A552) ;

  void changeThemeColor ( Color change ){
    color = change  ;
    notifyListeners();
  }




}