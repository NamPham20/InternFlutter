
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'model/expense.dart';

class ViewPage1 extends StatefulWidget {
  const ViewPage1({super.key});

  @override
  State<ViewPage1> createState() => _ViewPage1State();
}

class _ViewPage1State extends State<ViewPage1> {

  TextEditingController? nameController;
  TextEditingController? priceController;
  TextEditingController? amountController;

  List<Expense> expenses=[];

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    priceController = TextEditingController();
    amountController = TextEditingController();

  }

  @override
  void dispose() {
    super.dispose();
    nameController!.dispose();
    priceController!.dispose();
    amountController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: KeyboardDismisser(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Flexible(
                  flex: 1,
                    child:setupFrom() ),
                const SizedBox(height: 30,),
                Flexible(
                  flex: 2,
                    child: expenses.isNotEmpty ?  showListExpense(expenses) : Container()
                )
              ],
            ),
          ),
        ));
  }

 Widget setupFrom() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Flexible(
              child: TextField(
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text("Name Of Product"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Flexible(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: amountController,
                decoration: const InputDecoration(
                  label: Text("Amount"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Flexible(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: priceController,
                decoration: const InputDecoration(
                  label: Text("Price"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  String nameOfProduct = nameController!.text;
                  num amount = num.parse(amountController!.text);
                  num price = num.parse(priceController!.text);

                  Expense expense = Expense(nameOfProduct,amount,price,DateTime.now());
                  setState(() {
                    expenses.add(expense);

                    nameController!.clear();
                    amountController!.clear();
                    priceController!.clear();
                  });

                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                ),
                child: const Text("ADD",style: TextStyle(
                  color: Colors.white
                ),))
          ],
        ),
      ),
    );
 }

  Widget showListExpense(List<Expense> expenses) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context,index){
          return Dismissible(

            key: Key(expenses[index].id),
            onDismissed: (direction){
              setState(() {
                expenses.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Item dismissed",textAlign: TextAlign.center,),
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                ));
            },
            child: GestureDetector(
              onLongPress: (){
                showAlertDialog(context,index);
              },
              child: Card(
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
              ),
            ),
          );
        }
    );
  }

  showAlertDialog(BuildContext context, int index ){
    showDialog(
      context: context,
      builder: (BuildContext context,) {
        return AlertDialog(
          title: const Text("Notification"),
          content: const Text("Are you sure you want to delete"),
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
                setState(() {
                  expenses.removeAt(index);
                });
              },
              child: const Text("Ok"),
            ),

          ],
        );
      },
    );
  }
}
