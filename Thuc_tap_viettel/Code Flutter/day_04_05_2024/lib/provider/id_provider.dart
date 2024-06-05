import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/place.dart';

class IdProvider extends StateNotifier<bool>{
  IdProvider() : super(true);

  Future<void> checkValidId(String id , List<Place> places)async {
    bool isValid = true;
    for(Place place in places){
      if(id == place.id){
        isValid = false;
        break;
      }
    }
    state = isValid;
  }

}

final idProvider = StateNotifierProvider<IdProvider,bool >((ref) {
  return IdProvider();
});
