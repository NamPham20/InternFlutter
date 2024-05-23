
import 'package:day_23_05_2024/view_page_1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const ViewPage1(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> str = ["Dancing Script", "Roboto", "Raleway", "Aladin"];
  String? selectedItem;
  TextEditingController? controller;
  String textFont ="Dancing Script";
  late double sliderCurrentValue;

  @override
  void initState() {
    super.initState();
    selectedItem = str[0];
    controller = TextEditingController();
    sliderCurrentValue =10;
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 50,),
            Center(
              child: Text("HelloWorld!", style: GoogleFonts.getFont(
                textFont,
                textStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: sliderCurrentValue
                ),
              ),),
            ),
            designDropdownButton(),
            
            customSlider(),
          ],
        ),
      ),
    );
  }

 Widget designDropdownButton() {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: DropdownButton(
            items: str.map<DropdownMenuItem<String>> ((String value){
              return DropdownMenuItem<String> (
              value: value,
              child: Padding(
                padding: const EdgeInsets.all(12),
                  child: Text(value,)
              )
              );
            }).toList(),
            onChanged: (String? newValue){
              setState(() {
                textFont = newValue!;
              });
            },
          value: textFont,
          isExpanded: true,
          underline: Container(
            height: 0,
          ),
          icon: const Icon(Icons.arrow_drop_down_circle),

            ),
      ),
    );
 }

  Widget customSlider() {
    return Padding(
      padding: const EdgeInsets.all(12),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("TextSize"),
          Expanded(
            child: Slider(
                value: sliderCurrentValue ,
                max: 50,
                min: 0,
                divisions: 50,
                onChanged: (double value){
                  setState(() {
                    sliderCurrentValue = value;
                  });
                },
              label: sliderCurrentValue.round().toString(),
                ),
          )
        ],
      ),
    );
  }
}
