import 'package:day_06_06_2024/model/todo.dart';
import 'package:day_06_06_2024/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final statusAddProvider = StateProvider<bool>((ref) {
  return true;
});

final updateTodoProvider = StateProvider<Todo?>((ref) {
  return null;
});


class TodoPage extends ConsumerStatefulWidget{
  const TodoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => TodoPageState();

}

class TodoPageState extends ConsumerState <TodoPage> {


  TextEditingController? controller ;
  bool statusAdd = true ;
  Todo? updateTodo ;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Todo> todoList = ref.watch(todoProvider);
    statusAdd = ref.watch(statusAddProvider);
    updateTodo = ref.watch(updateTodoProvider);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.redAccent,
            elevation: 12,
            title: const Text(
              "Todo List",
              style: TextStyle(color: Colors.white),),

          ),
          body: Center(
            child: Column(
              children: [
                addEditTodo(updateTodo),
                Expanded (
                    child:  FutureBuilder<void>  (
                      future: ref.read(todoProvider.notifier).loadInitialData() ,
                      builder: (context, snapshot){
                          return displayTodoList(todoList);
                      },
                    )
                ),
              ],
            ),
          ),
        )
    );
  }

 Widget addEditTodo([Todo? updateTodo]) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 18),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  labelText: "Enter here!",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)
                  )
              ),
            ),
          ),
          const SizedBox(width: 12,),
          ElevatedButton(
              onPressed: () async {
                if(statusAdd){
                  Todo newTodo = Todo( title: controller!.text.trim(), createTime: DateTime.now().toString());
                  controller!.clear();
                  await ref.read(todoProvider.notifier).createTodo(newTodo);

                }else{
                  if(updateTodo != null){
                    updateTodo.updateTime = DateTime.now().toString();
                    updateTodo.title = controller!.text;
                    ref.read(statusAddProvider.notifier).state = true;
                    controller!.clear();
                    await ref.read(todoProvider.notifier).updateTodo(updateTodo);
                    ref.read(updateTodoProvider.notifier).state = null;
                  }

                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)
                )
              ),
              child: Text(statusAdd ? "Add" :"Update", style: const TextStyle(color: Colors.white),)
          )
        ],
      ),
    );
 }

 Widget displayTodoList(List<Todo> todoList)  {
    return ListView.builder(
      itemCount: todoList.length,
        itemBuilder: (context, index){
          return  GestureDetector(
            onTap: () async{
              ref.read(statusAddProvider.notifier).state = false;
              controller!.text = todoList[index].title;
              ref.read(updateTodoProvider.notifier).state = todoList[index];
            }
              ,
            child: Card(
              margin: const EdgeInsets.all(12),
              color: index %2==0 ? Colors.deepPurpleAccent : Colors.blueAccent,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                     children: [
                       Text("Id : ${todoList[index].id}", style: const TextStyle(color: Colors.white),),
                       Text("Title : ${todoList[index].title}", style: const TextStyle(color: Colors.white),),
                       Text("Create Time : ${todoList[index].createTime}", style: const TextStyle(color: Colors.white),),
                       Text("Update Time : ${todoList[index].updateTime}", style: const TextStyle(color: Colors.white),),
                     ]
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await ref.read(todoProvider.notifier).deleteTodo(todoList[index]);
                    },
                    icon: const Icon(Icons.delete, color: Colors.white,),
                  )
                ],
              ),
            ),
          ) ;
        }
    );
 }
}