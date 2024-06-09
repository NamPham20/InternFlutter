import 'package:day_06_06_2024/model/post.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class PostDbService{
  final String nameDb = "post";

  Future<String> getDatabasePath(String dbName) async {
    final directory = await getApplicationDocumentsDirectory();
    return join(directory.path, dbName);
  }

  Future<Database> openPostDatabase () async{
    String path = await getDatabasePath(nameDb);
    Database database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async{
          await db.execute(
              'CREATE TABLE $nameDb (id INTEGER PRIMARY KEY AUTOINCREMENT, name_user TEXT,title TEXT, path_image TEXT,scope TEXT , create_time TEXT, update_time TEXT NULL)');
        }
    ) ;
    return database;
  }

  Future<void> insertPost (Database db, Post post) async{
    await db.insert(nameDb, {
      'name_user' : post.nameUser,
      'title' : post.title,
      'create_time' : post.createTime,
      'path_image' : post.pathImage,
      'scope' : post.scope
    });
  }

  Future<List<Map<String, dynamic>>> getTodoList(Database db) async{
    return await db.query(nameDb);
  }


  Future<void> deletePost(Database db , int id)async {
    await db.delete(
        nameDb,
        where: 'id = ?',
        whereArgs: [id]
    );

    await db.transaction((txn) async {
      int id = 1;
      await txn.rawQuery('UPDATE $nameDb SET id = $id WHERE id = ?', [id]);
      id++;
    });

    
  }
}