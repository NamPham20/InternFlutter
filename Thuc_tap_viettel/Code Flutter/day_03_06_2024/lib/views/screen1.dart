import 'package:day_03_06_2024/provider/dropdown_button_form_field_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Screen1 extends ConsumerWidget{
  const Screen1({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> mList = ['Option1','Option2','Option3','Option4','Option5','Option6'];
    String? selectedValue = ref.watch(dropdownButtonProvider);
    final key = GlobalKey<FormState>();
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonFormField<String>(
                      value: selectedValue ==''? mList[0] : selectedValue,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                      items: mList.map((option){
                        return DropdownMenuItem(
                          value: option,
                            child:Text(option)
                        );
                    }).toList(),
                      onChanged: (String? value) {
                        selectedValue = ref.read(dropdownButtonProvider.notifier).updateSelectedValue(value);
                      },
                      validator:  (value) => value == null ? 'Please select an option' : null,
                    ),
                    ElevatedButton(
                        onPressed: (){
                          if (key.currentState!.validate()){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Form is valid")));
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Form is invalid")));

                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: const Text("Check",style: TextStyle(color: Colors.white),))
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

}