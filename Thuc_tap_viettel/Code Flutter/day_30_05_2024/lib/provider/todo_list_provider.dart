import 'package:day_30_05_2024/model/todo_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoListProvider extends StateNotifier<List<TodoList>>{
  TodoListProvider() : super([]);

  void addTodoList( String title){
    state = [...state, TodoList(title: title)];

  }

  void changeComplete(int index){
    List<TodoList> updateList =[...state];
    updateList[index].isComplete = !updateList[index].isComplete;
    state = updateList;

  }

  void removeTodoList(int index){
    List<TodoList> deleteOneElement =[...state];
    deleteOneElement.removeAt(index);
    state= deleteOneElement;

  }
}

final todoListProvider = StateNotifierProvider<TodoListProvider,List<TodoList> >((ref) {
  return TodoListProvider();
});
