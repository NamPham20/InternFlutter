import 'package:flutter/material.dart';

class ChangeTextProvider extends ChangeNotifier{

  String text;

  ChangeTextProvider({this.text = ""});

  void changeText({required String text}){
    this.text = text;
    notifyListeners();
  }
}