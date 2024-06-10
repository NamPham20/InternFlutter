import 'package:day_06_06_2024/model/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqlite_api.dart';

import '../database/post_db.dart';

class PostProvider extends StateNotifier<List<Post>>{
  PostProvider() : super([]);

  Future<void> createPost(Post post) async{
    Database database = await PostDbService().openPostDatabase();
    await PostDbService().insertPost(database, post);
    List<Post> postList =[];
    List<Map<String, dynamic>> getTodolistFromDb = await PostDbService().getTodoList(database);
    for (Map<String, dynamic> element in getTodolistFromDb) {
      postList.add(Post.fromMap(element));
    }
    state = postList;
  }

  Future<void> deletePost(Post post) async{
    Database database = await PostDbService().openPostDatabase();
    await PostDbService().deletePost(database,post.id);
    List<Post> postList =[];
    List<Map<String, dynamic>> getTodolistFromDb = await PostDbService().getTodoList(database);
    for (Map<String, dynamic> element in getTodolistFromDb) {
      postList.add(Post.fromMap(element));
    }
    state = postList;
  }

  Future<void> loadInitialData() async{
    Database database = await PostDbService().openPostDatabase();
    List<Post> todoList =[];
    List<Map<String, dynamic>> getTodolistFromDb = await PostDbService().getTodoList(database);
    for (Map<String, dynamic> element in getTodolistFromDb) {
      todoList.add(Post.fromMap(element));
    }
    state = todoList;
    return Future.value();
  }

}

final postProvider = StateNotifierProvider<PostProvider,List<Post> >((ref) {
  return  PostProvider();
});
