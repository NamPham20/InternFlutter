import 'package:day_24_05_2024/bottom_bar/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/list_component.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  late CustomBottomBar customBottomBar;

  late int selectedPage;

   List<ListComponent>? mList ;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    selectedPage = 2;
    mList = List<HeadingItem>.generate(
        200,
        (i) =>
             HeadingItem(heading: "heading $i"));

  }

  @override
  Widget build(BuildContext context) {
    print(mList![2].toString());
    customBottomBar =
        CustomBottomBar(context: context, selectedPage: selectedPage);

    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: customBottomBar.customBottomBar(),
            body: Column(
              children: [
                Flexible(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      for(int i=0;i<mList!.length;i++)
                      SizedBox(
                        height: 100,
                        child:
                        ListView.builder(
                            itemCount: mList!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        mList![index].buildIcon(),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            mList![index].buildTitle(),
                                            mList![index].buildSubTitle()
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              return null;
                            }),
                      ),
                  ]),
                ),
              ],
            )));
  }
}
