import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropdownButtonFormFieldProvider extends StateNotifier<String>{
  DropdownButtonFormFieldProvider(super.state);


  String updateSelectedValue(String? value) {
   return state = value!;
  }
}

final dropdownButtonProvider = StateNotifierProvider<DropdownButtonFormFieldProvider,String >((ref) {
  return DropdownButtonFormFieldProvider("");
});
