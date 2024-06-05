import 'dart:async';

import 'package:day_05_06_2024_2/requet_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {


  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  late Position position;

   LatLng center = const LatLng(21.0300103, 105.785749);
  //final LatLng center = const LatLng(45.521563, -

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  const EdgeInsets.all(12),
          child: GoogleMap(
            mapType: MapType.hybrid,
            onMapCreated:(GoogleMapController controller) {
              _controller.complete(controller);
            },
              initialCameraPosition: CameraPosition(
                target: center,
                zoom: 11
              ),
            markers: <Marker>{
                Marker(
                    markerId: const MarkerId("My position"),
                  position: center,
                  icon: BitmapDescriptor.defaultMarker,

                )
              },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
             position = await determinePosition();
           setState(() {
             center = LatLng(position.latitude, position.longitude);
           });
          },
        ),
      ),
    );
  }
}
