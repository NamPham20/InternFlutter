import 'dart:convert';
import 'dart:io';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:day_06_06_2024/provider/post_provider.dart';
import 'package:day_06_06_2024/views/new_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../model/post.dart';
import '../provider/image_path_provider.dart';
import '../utilities/custom_floating_action_button.dart';


class HomePage extends ConsumerStatefulWidget{
  const HomePage({super.key, this.controller});
  final NotchBottomBarController? controller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomePageState();

}

class HomePageState extends ConsumerState<HomePage>{
  List <Post> posts = [];
  XFile? imagePath;
  
  @override
  Widget build(BuildContext context) {

    posts = ref.watch(postProvider);
    imagePath = ref.watch(imagePathProvider);
   return Scaffold(
     backgroundColor: Colors.redAccent,

     body: Column(
       children: [
         Expanded(
           child: FutureBuilder<void>(
             future: ref.read(postProvider.notifier).loadInitialData(),
             builder: (BuildContext context,snapshot){
               return displayPost(posts,context);
             },
           ),
         ),

       ],
     ),
   );
  }

  Widget displayPost(List<Post> posts, BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Swiper(
          itemCount: posts.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context,int index){
            return SizedBox(
              height: MediaQuery.of(context).size.height -130 ,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.green,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              File(posts[index].pathImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                    ),
                    Positioned(
                      bottom: 0,
                        left: 4,
                        right: 4,
                        child: Container(
                            width: MediaQuery.of(context).size.width-8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blueGrey.withOpacity(0.3)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(posts[index].nameUser,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                              ),
                              Text(posts[index].title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
            );
        },
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewPost()));
            }, icon: const Icon(Icons.add,color: Colors.white,))
          ],
        ),
      ]);
  }

  
}