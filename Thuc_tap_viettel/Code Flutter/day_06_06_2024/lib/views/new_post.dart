import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:day_06_06_2024/provider/post_provider.dart';
import 'package:day_06_06_2024/views/home_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../model/post.dart';
import '../provider/pick_image_provider.dart';

final textControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final isPublicProvider = StateProvider<bool>((ref) {
  return false;
});


class NewPost extends ConsumerStatefulWidget{
  const NewPost({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> NewPostState();

}

class NewPostState extends ConsumerState<NewPost>{

  var imageFile;
  TextEditingController? controller ;
  bool isPublic = false;
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    imageFile = ref.watch(imagePickerProvider);
    controller = ref.watch(textControllerProvider);
    isPublic = ref.watch(isPublicProvider);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset :true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.redAccent.withOpacity(0.8),
          title: const Text("What are you thinking?", style: TextStyle(color: Colors.white),),
        ),
        body: SingleChildScrollView(
          child: KeyboardDismisser(
            child: Center(
              child:  Column(
                children: [
                  // display image
                  displayImage(size),
                  // option choose image
                  chooseImage(),
                  // writeStatus
                  writeStatus(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget displayImage(Size size){
    return Padding(
      padding: const EdgeInsets.all(4),
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeCap: StrokeCap.butt,
        radius: const Radius.circular(18),
        dashPattern: const [10,6],
        strokeWidth: 2,
        color: Colors.blueGrey.withOpacity(0.7),
        stackFit: StackFit.passthrough,
        child: Container(
            width: size.width *0.9,
            height: size.height *0.45,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(18),
            ),
            child: imageFile == null
                ? const Icon(Icons.image,size: 200,)
                :ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.file(File(imageFile.path),fit: BoxFit.cover,))),
      ),
    );
  }

  Widget chooseImage(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: OutlinedButton(
                onPressed: () async {
                  await ref.read(imagePickerProvider.notifier).pickImageFromGallery();
                },
                style: OutlinedButton.styleFrom(
                ),
                child: const Text("Open Gallery")),
          ),
          const SizedBox(width: 30,),
          Expanded(
            flex: 1,
            child: OutlinedButton(
                onPressed: () async{
                  await ref.read(imagePickerProvider.notifier).pickImageFromCamera();
                },
                style: OutlinedButton.styleFrom(
                ),
                child: const Text("Open Camera")),
          )
        ],
      ),
    );
  }

  Widget writeStatus(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: "What do you think ?",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.redAccent
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: const BorderSide(
                    color: Colors.blueGrey,
                    width: 2.0,
                  ),
                ),
                  focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(18.0),
                       borderSide: const BorderSide(
                        color: Colors.blue,
                       width: 2.0,
                       ),
                    ),
              ),
            ),
            Row(
              children: [
                Icon( isPublic? Icons.public : Icons.public_off),
                const SizedBox(width: 12,),
                const Text("Public"),
                const SizedBox(width: 12,),
                Checkbox(
                    value: isPublic,
                    onChanged: (value){
                      ref.read(isPublicProvider.notifier).state = value!;
                    })
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  List<String> userList = List.generate(5, (index) => "user${index + 1}");
                  Random random = Random();
                  int randomIndex = random.nextInt(userList.length);
                  String randomUser = userList[randomIndex];
                  String status = isPublic ? "public": "private";
                  Post post = Post(nameUser: randomUser, title: controller!.text, pathImage: imageFile.path, scope: status);
                  await ref.read(postProvider.notifier).createPost(post);
                  Navigator.pop(context);
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent
                ),
                child: const Text("Post", style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }

  Future<String> xFileToString(XFile file) async {
    List<int> bytes = await file.readAsBytes();
    return base64Encode(bytes);
  }


}