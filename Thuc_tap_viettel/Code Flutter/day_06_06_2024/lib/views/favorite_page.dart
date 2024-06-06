import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePage extends ConsumerStatefulWidget{
  const FavoritePage({super.key, this.controller});
  final NotchBottomBarController? controller;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => FavoritePageState();

}

class FavoritePageState extends ConsumerState<FavoritePage>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.redAccent,
     body: Center(
       child: Text("FavoritePage"),
     ),
   );
  }
}