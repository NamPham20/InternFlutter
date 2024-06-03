import 'package:day_03_06_2024/model/comment.dart';
import 'package:day_03_06_2024/provider/call_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentScreen extends ConsumerWidget{
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Comment>> comments = ref.watch(callApiProvider);

   return SafeArea(
       child: Scaffold(
         body: comments.when(
             data: (comments){
               return ListView.builder(
                 itemCount: comments.length,
                   itemBuilder: (context,index){
                     return Card(
                       margin: const EdgeInsets.all(8),
                       child: Padding(
                         padding: const EdgeInsets.all(8),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(" Id : ${comments[index].id.toString()}"),
                             Text(" PostId : ${comments[index].postId.toString()}"),
                             Text(" Email : ${comments[index].email}" ),
                             Text(" Name : ${comments[index].name}" ),
                             Text(" Comment : ${comments[index].body}" ),
                           ],
                         ),
                       ),
                     ) ;
                   });
             },
             error: (err,stack) => Text("$err"),
             loading: () => const Center(child: CircularProgressIndicator())),
       )
   );
  }

}