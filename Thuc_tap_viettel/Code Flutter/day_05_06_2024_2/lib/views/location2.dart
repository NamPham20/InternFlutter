import 'package:day_05_06_2024_2/provider/loaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class Location2 extends ConsumerStatefulWidget{
  const Location2({super.key});



  @override
  ConsumerState<ConsumerStatefulWidget> createState() => Location2State();

}

class Location2State extends ConsumerState<Location2> {

  @override
  Widget build(BuildContext context) {
   AsyncValue<Position> position = ref.watch(location1Provider);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text("Location",style: TextStyle(color: Colors.white),),
          ),
          body:
          Center(
            child: position.when(
                data: (position) {
                  return Column(
                    children: [
                      Text("longitude : ${position.longitude}"),
                      Text(" latitude: ${position.latitude}"),
                      Text(" heading: ${position.heading}"),
                      Text(" accuracy: ${position.accuracy}"),
                      Text(" altitude: ${position.altitude}"),

                    ],
                  );
                },
                error: (err,stack) => Text("$err"),
                loading: () => const Center(child: CircularProgressIndicator())),
          ),
        )
    );
  }




}