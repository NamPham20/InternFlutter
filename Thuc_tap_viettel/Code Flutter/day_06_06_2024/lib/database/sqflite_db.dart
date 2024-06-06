import 'package:day_06_06_2024/model/todo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  final String databaseName  = "Todo";

  Future<String> getDatabasePath(String dbName) async {
    final directory = await getApplicationDocumentsDirectory();
    return join(directory.path, dbName);
  }

  Future<Database> openTodoDatabase () async{
    String path = await getDatabasePath(databaseName);
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async{
        await db.execute('CREATE TABLE $databaseName (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, create_time TEXT, update_time TEXT NULL)');
      }
    ) ;
    return database;
  }

  Future<void> insertTodo (Database db, Todo todo) async{
    await db.insert(databaseName, {
      'title' : todo.title,
      'create_time' : todo.createTime,
    });
  }

  Future<List<Map<String, dynamic>>> getTodoList(Database db) async{
    return await db.query(databaseName);
  }

  Future<void> updateTodo (Database db, int id, Todo todo) async{
    await db.update(
        databaseName,
        {
          'title' : todo.title,
          'create_time' : todo.createTime,
          'update_time' : todo.updateTime,
        },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTodo(Database db , int id)async {
    await db.delete(
      databaseName,
      where: 'id = ?',
      whereArgs: [id]
    );

    await db.transaction((txn) async {
      int id = 1;
      await txn.rawQuery('UPDATE $databaseName SET id = $id WHERE id = ?', [id]);
      id++;
    });

  }

}