import 'package:flutter/material.dart';
import '../views/screen_1.dart';
import '../views/screen_2.dart';
import '../views/screen_3.dart';

class CustomBottomBar {

  BuildContext context ;
  int selectedPage;

  CustomBottomBar({ required this.context, required this.selectedPage});

  BottomNavigationBar customBottomBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Screen1"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.screen_search_desktop),
            label: "Screen2"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.screenshot_monitor),
            label: "Screen3"
        )
      ],
      currentIndex: selectedPage,
      selectedItemColor: Colors.red,
      onTap: (int value){
        if(selectedPage ==value){
          return;
        }
        selectedPage = value;
        switch (selectedPage){
          case 0 : Navigator.push(context, MaterialPageRoute(builder: (context)=> const Screen1()));
                   break;
          case 1 : Navigator.push(context, MaterialPageRoute(builder: (context)=> const Screen2()));
                   break;
          case 2 : Navigator.push(context, MaterialPageRoute(builder: (context)=> const Screen3()));
                   break;
        }
      },
    );
  }
}