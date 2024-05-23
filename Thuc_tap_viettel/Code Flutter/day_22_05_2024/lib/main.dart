

import 'package:day_22_05_2024/view_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'model/expense.dart';


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

  TextEditingController? textFieldController ;
  bool showToast = false;
  String ? errorMessage;
  bool isObscureText = true;
  List<Expense> expenses=[];
  Size? size ;
  int? selectedIndex ;

  @override
  void initState() {
    super.initState();
    textFieldController = TextEditingController();
    selectedIndex = 0;
    // fake data
    expenses.add(Expense("product 1",2,3,DateTime.now()));
    expenses.add(Expense("product 2",4,6,DateTime.now()));
    expenses.add(Expense("product 3",4,5,DateTime.now()));
    expenses.add(Expense("product 4",10,5,DateTime.now()));
    expenses.add(Expense("product 5",4,6,DateTime.now()));
    expenses.add(Expense("product 6",3,7,DateTime.now()));
    expenses.add(Expense("product 7",9,4,DateTime.now()));
  }

  @override
  void dispose() {
    textFieldController!.dispose() ;
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("22/05/2024"),
            elevation: 5,
          ),
          drawer: customDrawer(),
          body: SizedBox(
            height: size?.height,
            child: Column(
              children: [
                // build a screen check password, show error message and dialog
                showErrorMessage(),
                // show a list of expense.
                Expanded(child: showListExpense(expenses)),
                //
              ],
            ),
          ),

        ),
      ),
    );
  }
// hàm show error hoặc thông báo khi kiểm tra mật khẩu
 Widget showErrorMessage() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
               controller: textFieldController,
               decoration:  InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                  labelText: "Password",
                  hintText: "Enter your password",
                 prefixIcon: const Icon(Icons.password_outlined),
                suffixIcon: IconButton(
                  icon: isObscureText ? const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                ),
                errorText: errorMessage,
              ),
              obscureText: isObscureText,
            ),
          ),
          const SizedBox(width: 8,),
          ElevatedButton(
              onPressed: ()  {
                String? content;
                 setState(() {
                   content = textFieldController!.text;
                   if (!isValidPassword(content!)){
                     errorMessage = "Mật khẩu cần có 6 ký tự trở lên";
                   }
                   else {
                     showAlertDialog(context);
                   }
                });

              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.redAccent),
              ),
              child: const Text("check",style: TextStyle(
                color: Colors.white
              ),)
          )
        ],
      ),
    );
 }
 // check mật khẩu có đúng quy tắc chưa
  bool isValidPassword(String password){
    if(password.length > 6){
      return true;
    }

    return false;
  }
  // sử dụng AlertDialog để show ra một thông báo
  showAlertDialog(BuildContext context ){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Thông Báo"),
          content: const Text("Bạn đã sẵn sàng đăng nhập"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng AlertDialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();

                Fluttertoast.showToast(
                  msg: "Đăng nhập Thành công",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.TOP,
                );// Đóng AlertDialog
              },
              child: const Text("Ok oke"),
            ),

          ],
        );
      },
    );
  }

  Widget showListExpense(List<Expense> expenses) {
    return ListView.builder(
      itemCount: expenses.length,
        itemBuilder: (context,index){
          return Card(
            elevation: 4,
            margin: const EdgeInsets.all(12),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8,),
                  Text("Id : ${expenses[index].id}",style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16,
                  ),),
                  const SizedBox(height: 8,),
                  Text("Name Of Product : ${expenses[index].name}",style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 8,),
                  Text("Amount : ${expenses[index].number}",style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                  ),),
                  const SizedBox(height: 8,),
                  Text("Unit price : ${expenses[index].price} \$",style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                  const SizedBox(height: 8,),
                  Text("Date : ${expenses[index].date} ",style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                  const SizedBox(height: 8,),
                  Text("Total : ${expenses[index].totalPrice} \$",style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 8,),
                ],
              )
            ),
          );
        }
    );
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
              title: const Text("screen1"),
              selected:  selectedIndex ==0,
              onTap: (){
                selectedIndex =0;
                Navigator.push(context, MaterialPageRoute(builder: (context)=>  const MyHomePage(title: 'Flutter Demo Home Page') ));
              },
              selectedColor: selectedIndex ==0 ? Colors.red: null,
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


}
