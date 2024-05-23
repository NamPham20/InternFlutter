import 'package:uuid/uuid.dart';

class Expense {
  String _id;
  String _name;
  num   _number;
  num  _price;
  DateTime _date;
  final num _totalPrice;

  Expense(  this._name, this._number, this._price, this._date)
      : _totalPrice =_price*_number  , _id = const Uuid().v4();

  num get totalPrice => _totalPrice;


  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }

  num get price => _price;

  set price(num value) {
    _price = value;
  }

  num get number => _number;

  set number(num value) {
    _number = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}