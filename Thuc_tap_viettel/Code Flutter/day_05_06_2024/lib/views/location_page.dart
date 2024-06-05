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
  void initState() async{
    super.initState();
     position = await determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text("Location",style: TextStyle(color: Colors.white),),
          ),
          body: Column(
            children: [
              Text("Longitude : ${position!.longitude}"),
              Text("Latitude : ${position!.latitude}")
            ],
          ),
        )
    );
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }


}