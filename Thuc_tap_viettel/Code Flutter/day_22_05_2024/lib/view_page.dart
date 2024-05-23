import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'main.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {

  late int selectedIndex;

  TextEditingController? controller ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex =1;
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: KeyboardDismisser(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("22/05/2024"),
              elevation: 5,
            ),
            drawer: customDrawer(),
            body:  Column(
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: TextField(
                      controller: controller,
                      decoration:  InputDecoration(
                        labelText: "Date",
                        hintText: "dd/mm/yyy",
                        filled: true,
                        suffixIcon: IconButton(
                          icon : const Icon(Icons.date_range),
                          onPressed: () {
                            displayDatePicker();
                          },
                        ),

                      ),
                    ),
                  )
                )
              ]),
          ),
        ));
  }

  Widget customDrawer() {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children:  [
          const DrawerHeader(
              child: CircleAvatar(
                backgroundColor: Colors.yellow,
              )
          ),

          Card(
            elevation: 4,
            child: ListTile(
              title: const Text("screen1",style: TextStyle(
              ),),
              selected:  selectedIndex ==0,
              onTap: (){
                selectedIndex =0;
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyHomePage(title: 'Flutter Demo Home Page',) ));
              },
             selectedColor: selectedIndex ==1 ? Colors.red: null,
            ),
          ),
          Card(
            elevation: 4,
            child: ListTile(
              title: const Text("screen1"),
              selected:  selectedIndex ==1,
              onTap: (){
                selectedIndex =1;
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ViewPage() ));
              },
              selectedColor: selectedIndex ==1 ? Colors.red: null,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> displayDatePicker() async {
    DateTime? dateTime= await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        initialDate: DateTime.now()
    );
    if(dateTime!= null){
      setState(() {
        controller?.text = dateTime.toString().split(" ")[0];
      });
    }
  }
}
