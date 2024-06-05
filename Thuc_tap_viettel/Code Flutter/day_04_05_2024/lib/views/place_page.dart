import 'package:day_04_05_2024/provider/place_provider.dart';
import 'package:day_04_05_2024/views/add_new_place.dart';
import 'package:day_04_05_2024/views/detail_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/place.dart';

final textControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});


class PlacePage extends ConsumerWidget{
  const PlacePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Place> placeList =ref.watch(placeProvider);
    List<Place> places = placeList;

    TextEditingController controller = ref.watch(textControllerProvider);

    return SafeArea(
        child: Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.blueAccent,
           title: const Text("List Places",style: TextStyle(color: Colors.white),),
         ),

          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 18),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Search by Id",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)
                            )
                          ),
                        ),
                      ),
                      const SizedBox(width: 8,),
                      ElevatedButton(
                          onPressed: (){}
                          ,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)
                            )
                          ),
                          child: const Text("Search", style: TextStyle(color: Colors.white),)
                      )
                    ],
                  ),
                ),

                Expanded(
                    child: ListView.builder(
                      itemCount: places.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>  AddNewPlace(index: index,place: places[index],)));
                            },
                            child: Card(
                              margin: const EdgeInsets.all(8),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Id : ${places[index].id}"),
                                    Text("Name : ${places[index].namePlace}"),
                                    Text("Address : ${places[index].address}"),
                                    Text("Description : ${places[index].description}",
                                    maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPlace(place: places[index])));
                                      },
                                        child: Text("more",style: TextStyle(color: Colors.blue.withOpacity(0.8)),))
                                  ],
                                ),
                              ),

                            ),
                          );
                        }
                        )
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddNewPlace(type: "add",)) );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),

            backgroundColor: Colors.redAccent,
            child: const Icon(Icons.add),

          ),
        )
    );
  }

}