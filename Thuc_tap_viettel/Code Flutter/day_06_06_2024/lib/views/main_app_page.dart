import 'dart:ui';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:day_06_06_2024/views/favorite_page.dart';
import 'package:day_06_06_2024/views/home_page.dart';
import 'package:day_06_06_2024/views/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainAppPage extends ConsumerStatefulWidget{
  const MainAppPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> MainAppPageState();
}

class MainAppPageState  extends ConsumerState<MainAppPage>{


  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    final List<Widget> bottomBarPages = [
      HomePage(
        controller: (_controller),
      ),
      const FavoritePage(),
      const ProfilePage(),
    ];

    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
        extendBody: true,
        bottomNavigationBar: AnimatedNotchBottomBar(
          elevation: 2,
          textOverflow: TextOverflow.visible,
          notchBottomBarController: _controller,
          durationInMilliSeconds: 200,
          bottomBarItems: const [
            BottomBarItem(
              activeItem: Icon(
                Icons.home_filled,
                color: Colors.blueAccent,
              ),
                inActiveItem: Icon(
                  Icons.home_filled,
                  color: Colors.blueGrey,
                )
            ),
            BottomBarItem(
                activeItem: Icon(
                  Icons.favorite,
                  color: Colors.blueAccent,
                ),
                inActiveItem: Icon(
                  Icons.favorite,
                  color: Colors.blueGrey,
                )
            ),
            BottomBarItem(
                activeItem: Icon(
                  Icons.person,
                  color: Colors.blueAccent,
                ),
                inActiveItem: Icon(
                  Icons.person,
                  color: Colors.blueGrey,
                )
            ),
          ],
          onTap: (int index) {
            _pageController.jumpToPage(index);
          },
          kIconSize: 24,
          kBottomRadius: 20,
        ),
           ),
    );
  }
}