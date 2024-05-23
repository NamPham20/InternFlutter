
import 'package:day_21_05_2024/model/task.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Size size ;
  bool showText = false;
  String buttonContent = "ShowText" ;
  //Data Model
  List<Task> tasks =[];
  late String message;
  // initState được khởi chạy chỉ một lần khi khởi động
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    message = "initState is Initialized";

    // Fake data
    tasks.add(Task("Task 1", false,"20/05/2024"));
    tasks.add(Task("Task 2", true,"21/05/2024"));
    tasks.add(Task("Task 3", false,"22/05/2024"));
    tasks.add(Task("Task 4", false,"23/05/2024"));
    tasks.add(Task("Task 5", true,"25/05/2024"));
    tasks.add(Task("Task 6", true,"25/05/2024"));
  }

  Map information ={
    "name" : "Pham Phuong Nam",
    "nameBank" : "Techcombank",
    "date" : "11/2030",
    "seriesNumber" : "0238  5947  5384  6868"
  };

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size ;
    return SafeArea(child: Scaffold(

      body: Column(
        children: [
          // iconButton
          designIconButton(),
          // Adding Transparency to Widgets
          designContainerWithTransparency(),
          //  Rendering Content Conditionally + use font of google
          showContentConditionally(),
          // Use for to display item in Row + SingleChildScroll
           displaySomeItemInRow(tasks),
           //Accessing Map Values & Using "Type Casting"
           displayInformationPerson(information)
        ],
      ),
    ));
  }

 Widget designIconButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
            onPressed: (){},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: const Text("Add",style: TextStyle(
              color: Colors.white,
              fontSize: 18
            ),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue
          ),
        )
      ],
    );
  }

 Widget designContainerWithTransparency() {
    return Center(
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(top: 20,bottom: 20,left: 5,right: 5),
              height: size.height*0.2,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepOrange.withOpacity(0.8),// use withOpacity to set transparency
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Text("Container with transparency : 80% ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(top: 20,bottom: 20,left: 5,right: 5),
              height: size.height*0.2,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepOrange.withOpacity(0.5),// use withOpacity to set transparency
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Text("Container with transparency : 50% ",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
 }

  Widget showContentConditionally() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // sử dụng điêu kiện để quyết định có hiển thị hay không
       // showText ? const Text("Đây là text", textAlign: TextAlign.center,): const SizedBox(),

        // sử dụng Widget Visibility
        // Visibility(
        //   visible: showText,
        //     child: const Text("Đây là text", textAlign: TextAlign.center,)
        // ),

        // sử dụng Offstage
        Offstage(
          offstage: !showText,
          child:  Text("Đây là text", textAlign: TextAlign.center,style: GoogleFonts.dancingScript(
            textStyle:  const TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold

          ),),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
            )
          ),
            onPressed: (){
              setState(() {
                showText =! showText;
                buttonContent = !showText ? "ShowText" :"HideText";
              });
            },
            child: Text(buttonContent))

      ],
    );
  }

  Widget displaySomeItemInRow(List<Task> tasks) {
    // sử dụng SingleChildScrollView để hiển thị danh sách các task theo chiêu ngang
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(Task task in tasks)
            setListTask(task),
        ],
      ),
    );
  }

  Widget setListTask(Task task){

    return Container(
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent.withOpacity(0.2), // Màu của bóng
            spreadRadius: 2, // Bán kính lan rộng
            blurRadius: 4, // Bán kính mờ
            offset: const Offset(0, 2), // Độ dịch chuyển của bóng
          ),
        ],
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      child:  Row(
        children: [
          const Icon(Icons.work,
            color: Colors.red,
          ),
          Text("${task.nameTask}",),
          const SizedBox(width: 10,),
          Text("${task.deadline}",),
          task.status! ? const Icon(Icons.fiber_manual_record_rounded,color: Colors.green,)
              :const Icon(Icons.fiber_manual_record_rounded,color: Colors.red,)
        ],
      ),
    );
  }

 Widget displayInformationPerson(Map mapInfor) {
   String name = mapInfor["name"] as String;
    return Container(
      width: size.width*0.95,
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.6),
        borderRadius: const BorderRadius.all(Radius.circular(16))
      ),
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10,),
              Text(
                mapInfor["nameBank"],
                style: GoogleFonts.dancingScript(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
                ),
                textAlign: TextAlign.left,
              ),
                Expanded(
                 flex: 1,
                   child: Container(),
               ),
               const Icon(Icons.qr_code_2,size: 40,),
              const SizedBox(width: 10,)
            ],
          ),
          const SizedBox(height: 30,),
          Text(name.toUpperCase(), style: GoogleFonts.raleway(
            fontSize: 18,
            color: Colors.black,
            letterSpacing: 5
          ),),
          const SizedBox(height: 12,),
          Text(mapInfor["date"], style: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.black,
          ),),
          const SizedBox(height: 12,),
          Text(mapInfor["seriesNumber"], style: GoogleFonts.roboto(
            fontSize: 20,
            color: Colors.black,
              letterSpacing: 5
          ),),
          const SizedBox(height: 20,)
        ],
      ),
    );
 }

}
