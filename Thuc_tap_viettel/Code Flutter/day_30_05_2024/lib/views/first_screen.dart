import 'package:day_30_05_2024/model/todo_list.dart';
import 'package:day_30_05_2024/provider/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

final textEditingControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});


class FirstScreen extends ConsumerWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TodoList> todoList = ref.watch(todoListProvider);
    TextEditingController controller = ref.watch(textEditingControllerProvider);
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 12,right: 12,top: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          controller: controller,
                          decoration:  InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)
                            )
                          ),
                        )
                    ),
                    const SizedBox(width: 8,),
                    ElevatedButton(
                        onPressed: (){
                          ref.read(todoListProvider.notifier).addTodoList(controller.text);
                          controller.clear();
                        },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                        child: const Text("Add",style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),

              Expanded(
                child: ListView.builder(
                  itemCount: ref.watch(todoListProvider).length,
                    itemBuilder: (BuildContext context,int index){
                      return Slidable(

                        startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                  onPressed: (_){
                                    ref.read(todoListProvider.notifier).removeTodoList(index);
                                  },
                                icon: Icons.delete,
                                label: "Delete",
                                backgroundColor: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              SlidableAction(
                                onPressed: (_){},
                                icon: Icons.more_horiz,
                                label: "Information",
                                backgroundColor: Colors.blue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ]),
                        child: Card(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(todoList[index].title, textAlign: TextAlign.center,),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Checkbox(value: todoList[index].isComplete,
                                      onChanged: (newValue){
                                        ref.read(todoListProvider.notifier).changeComplete(index);
                                        todoList[index].isComplete = newValue!;
                                      }
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                    child: CircleAvatar(backgroundColor: todoList[index].isComplete ? Colors.green : Colors.red,))
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
              )

            ],
          ),
        )
    );
  }




}