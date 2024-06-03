import 'dart:io';
import 'package:day_03_06_2024/provider/pick_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class PickImagePage extends ConsumerWidget{
  const PickImagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var imageFile = ref.watch(imagePickerProvider);
    //var imageFileList = ref.watch(pickMultipleImageProvider);
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageFile.length,
                      itemBuilder: (context,index){
                    return SizedBox(
                      height: MediaQuery.of(context).size.height*0.5,
                      width: MediaQuery.of(context).size.width *0.9,
                      child: Center(
                        child: Card(
                          child: imageFile.isEmpty
                              ? const Text("Please choose an image")
                              : Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.file(File(imageFile[index].path),)),
                        ),
                      ),
                    );
                  }),
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: (){
                        ref.read(imagePickerProvider.notifier).pickImageFromGallery();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                      child: const Text("choose image from gallery",style: TextStyle(color: Colors.white),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: (){
                        ref.read(imagePickerProvider.notifier).pickImageFromCamera();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                      child: const Text("choose image from camera",style: TextStyle(color: Colors.white),)),

                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: (){
                        ref.read(imagePickerProvider.notifier).pickMultipleImage();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                      child: const Text("Choose Multiple image from camera",style: TextStyle(color: Colors.white),)),
                ),
              ],
            ),
          ),
    )
    );
  }

}