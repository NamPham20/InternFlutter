import 'package:day_06_06_2024/database/sqflite_db.dart';
import 'package:day_06_06_2024/model/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

class TodoProvider extends StateNotifier<List<Todo>>{
  TodoProvider() : super([]);

  Future<void> createTodo (Todo todo) async{
    Database database = await DatabaseService().openTodoDatabase();
    await DatabaseService().insertTodo(database, todo);
    List<Todo> todoList =[];
    List<Map<String, dynamic>> getTodolistFromDb = await DatabaseService().getTodoList(database);
     for (Map<String, dynamic> element in getTodolistFromDb) {
       todoList.add(Todo.fromMap(element));
     }
    state = todoList;

  }

  Future<void> updateTodo (Todo todo) async{
    Database database = await DatabaseService().openTodoDatabase();
    List<Todo> todoList =[];
    await DatabaseService().updateTodo(database, todo.id, todo);
    List<Map<String, dynamic>> getTodolistFromDb = await DatabaseService().getTodoList(database);
    for (Map<String, dynamic> element in getTodolistFromDb) {
      todoList.add(Todo.fromMap(element));
    }
    state = todoList;

  }

  Future<void> deleteTodo(Todo todo) async{
    Database database = await DatabaseService().openTodoDatabase();
    await DatabaseService().deleteTodo(database, todo.id);
    List<Todo> todoList =[];
    List<Map<String, dynamic>> getTodolistFromDb = await DatabaseService().getTodoList(database);
    for (Map<String, dynamic> element in getTodolistFromDb) {
      todoList.add(Todo.fromMap(element));
    }
    state = todoList;

  }

  Future<void> loadInitialData() async{
    Database database = await DatabaseService().openTodoDatabase();
    List<Todo> todoList =[];
    List<Map<String, dynamic>> getTodolistFromDb = await DatabaseService().getTodoList(database);
    for (Map<String, dynamic> element in getTodolistFromDb) {
      todoList.add(Todo.fromMap(element));
    }
    state = todoList;
    database.close();
    return Future.value();
  }

}

final todoProvider = StateNotifierProvider<TodoProvider,List<Todo>>((ref) {
  return TodoProvider();
 },


);
