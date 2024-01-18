import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;

class LocationScreen extends StatefulWidget {
  static const String routeName = "/geo_test_screen";
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  location.Location locationController = location.Location();
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(40.5243129431211, 72.0668756532196),
    zoom: 14,
  );

  List<Marker> myMarkers = [];

  @override
  void initState() {
    super.initState();
    getLocationService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getLocationService();
        },
        child: const Icon(Icons.radio_button_off),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        onMapCreated: (onMapCreatedController) {
          _controller.complete(onMapCreatedController);
        },
        markers: Set<Marker>.of(myMarkers),
        onTap: (argument) async {
          List<Placemark> placeMarks = await placemarkFromCoordinates(
              argument.latitude, argument.longitude);
          print(placeMarks);
          myMarkers.clear();
          myMarkers.add(
            Marker(
              markerId: MarkerId(UniqueKey().toString()),
              position: LatLng(argument.latitude, argument.longitude),
            ),
          );
          setState(() {});
        },
        zoomControlsEnabled: false,
      ),
    );
  }

  Future<void> getLocationService() async {
    bool serviceEnabled;
    location.PermissionStatus permissionStatus;

    serviceEnabled = await locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    }
    permissionStatus = await locationController.hasPermission();
    if (permissionStatus == location.PermissionStatus.denied) {
      permissionStatus = await locationController.requestPermission();
    }
    location.LocationData locationData = await locationController.getLocation();
    print("Laaaaaaaat${locationData.latitude!}");
    print("Loooooong${locationData.longitude!}");

    Marker currentLocationMarker = Marker(
      markerId: MarkerId(
        UniqueKey().toString(),
      ),
      infoWindow: const InfoWindow(title: "My Current Location"),
      position: LatLng(locationData.latitude!, locationData.latitude!),
    );
    myMarkers.add(currentLocationMarker);
    final CameraPosition cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude!, locationData.longitude!),
      zoom: 14,
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    setState(() {});
  }
}
