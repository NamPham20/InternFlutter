import 'package:day_04_05_2024/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceProvider extends StateNotifier<List<Place>>{
  PlaceProvider() : super([]);

  void createPlace (Place place){
    state = [...state,place];
  }

  void updatePlace(int index, Place place){
    List<Place> places = [...state];
    places[index] = place;
    state = places;
  }

  void deletePlace(int index){
    List<Place> places = [...state];
    places.removeAt(index);
    state = places;
  }

}

final placeProvider = StateNotifierProvider<PlaceProvider,List<Place> >((ref) {
  return PlaceProvider();
});
