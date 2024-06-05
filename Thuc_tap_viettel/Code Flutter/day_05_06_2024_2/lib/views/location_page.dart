import 'package:day_05_06_2024_2/provider/loaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends ConsumerStatefulWidget{
  const LocationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => LocationPageState();

}

class LocationPageState extends ConsumerState<LocationPage> {

  Position? position ;


  @override
  Widget build(BuildContext context) {
    position = ref.watch(locationProvider);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text("Location",style: TextStyle(color: Colors.white),),
          ),
          body:
          Column(
            children: [
               position!=null ? Text("Longitude : ${position!.longitude}") : const Text("error"),
              position!=null ?  Text("Latitude : ${position!.latitude}"): const Text("error"),
              ElevatedButton(
                  onPressed: () async{
                    position = await ref.read(locationProvider.notifier).determinePosition();
                  },
                  child: const Text("Get Position"))

            ],
          ),
        )
    );
  }

  


}