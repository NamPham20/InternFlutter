import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{

  num count ;

  CounterProvider({this.count =0});

  void incrementCounter(){
    count ++;
    notifyListeners();
  }

  void decrementCounter(){
    count --;
    notifyListeners();
  }

}