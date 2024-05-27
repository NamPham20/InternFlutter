
import 'package:day_24_05_2024/bottom_bar/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/list_component.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen3State();
}

class _Screen3State extends State<Screen2> {


  late CustomBottomBar customBottomBar ;
  late int selectedPage ;

  List<ListComponent> list =[];
  

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: [SystemUiOverlay.top]);
    selectedPage =1;
    
    list = List<ListComponent>.generate(200,
        (i) => i %5 ==0 ? HeadingItem(heading: "heading $i"): MessageTitle(heading: "message $i", message: "hello $i")
    );
    
    
    
  }

  @override
  Widget build(BuildContext context) {
    customBottomBar = CustomBottomBar(context: context, selectedPage: selectedPage);

    return  SafeArea(
        child: Scaffold(
          bottomNavigationBar: customBottomBar.customBottomBar() ,
          body: ListView.builder(
            itemCount: list.length,
              itemBuilder: (context,index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        list[index].buildIcon(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            list[index].buildTitle(),
                            list[index].buildSubTitle()
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },

          )
        )
    );
  }
}
