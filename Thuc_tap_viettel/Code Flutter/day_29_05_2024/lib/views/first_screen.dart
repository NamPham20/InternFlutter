import 'package:day_29_05_2024/provider/change_text_provider.dart';
import 'package:day_29_05_2024/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red
                  ),
                  child: Text("${context.watch<ChangeTextProvider>().text} - ${context.watch<CounterProvider>().count}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 50,),
                 Text(context.watch<CounterProvider>().count.toString(), style: const TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                   color: Colors.red
                  ),
                 ),
                const SizedBox(height: 50,),
                Container(
                  margin: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton.icon(
                        onPressed: (){
                          context.read<CounterProvider>().incrementCounter();
                        },
                          label: const Text("Add",style: TextStyle(color: Colors.white),),
                          icon: const Icon(Icons.add),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton.icon(
                          onPressed: (){
                            context.read<CounterProvider>().decrementCounter();
                          },
                          label: const Text("Subtract",style: TextStyle(color: Colors.white),),
                          icon: const Icon(Icons.remove),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  margin:  const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                     children :[
                       Expanded(
                         child: TextField(
                           controller: textController,
                          decoration: InputDecoration(
                            labelText: "Input",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                                             ),
                       ),
                      ElevatedButton(
                          onPressed: (){
                            context.read<ChangeTextProvider>().changeText(text: textController!.text);
                          },
                          child: const Text("Set Text"))
                     ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
