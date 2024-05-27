
import 'package:day_24_05_2024/bottom_bar/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {


  late CustomBottomBar customBottomBar ;
  late int selectedPage ;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: [SystemUiOverlay.top]);
    selectedPage =0;
  }

  @override
  Widget build(BuildContext context) {
    customBottomBar = CustomBottomBar(context: context, selectedPage: selectedPage);

    return  SafeArea(
        child: Scaffold(
          bottomNavigationBar: customBottomBar.customBottomBar() ,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              for(int i =0;i<200;i++)
              Card(
                child: ListTile(
                  title: Text("product $i",),
                  subtitle: Text("sub title $i"),
                ),
              )
            ],
          )
        )
    );
  }
}
