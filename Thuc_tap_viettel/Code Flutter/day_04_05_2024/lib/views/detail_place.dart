import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/place.dart';

class DetailPlace extends ConsumerWidget{
   DetailPlace({super.key,required this.place });

  Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text("Detail",style: TextStyle(color: Colors.white),),
          ),
          body: Center(
            child: Card(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Id : ${place.id}"),
                    Text("Name : ${place.namePlace}"),
                    Text("Address : ${place.address}"),
                    Text("Description : ${place.description}",),
                  ],
                ),
              ),

            ),
          ),
        )
    );
  }

}