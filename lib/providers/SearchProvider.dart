import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier{

  String? search = '';

  void filterNews ( String? filter ){
    search = filter ;
    notifyListeners();
  }




}