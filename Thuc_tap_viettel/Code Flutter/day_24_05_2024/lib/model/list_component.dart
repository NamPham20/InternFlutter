import 'package:flutter/material.dart';

abstract class ListComponent{
 Widget buildTitle();
 Widget buildSubTitle();
 Widget buildIcon();
}

class HeadingItem implements ListComponent{
  
  String heading;


  HeadingItem({required this.heading});

  @override
  Widget buildIcon() {
    return const Icon(Icons.table_restaurant_sharp);
  }

  @override
  Widget buildSubTitle() {
    return const Text("");
  }

  @override
  Widget buildTitle() {
    return Text(heading,style: const TextStyle(
      color: Colors.red,
      fontSize: 25,
      fontWeight: FontWeight.bold
    ),);
  }
  
}

class MessageTitle implements ListComponent{

  String heading;
  String message;

  MessageTitle({required this.heading, required this.message});


  @override
  Widget buildIcon() {

    return const Icon(Icons.message);
  }

  @override
  Widget buildSubTitle() {
    return  Text(message);
  }

  @override
  Widget buildTitle() {

    return Text(heading,style: const TextStyle(
        color: Colors.red,
        fontSize: 20
    ),);
  }

}