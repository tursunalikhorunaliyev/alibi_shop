import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoTest extends StatefulWidget {
  static const String routeName = "/geo_test_screen";
  const GeoTest({super.key});

  @override
  State<GeoTest> createState() => _GeoTestState();
}

class _GeoTestState extends State<GeoTest> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(40.5243129431211, 72.0668756532196),
    zoom: 14,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        onMapCreated: (onMapCreatedController) {
          _controller.complete(onMapCreatedController);
        },
      ),
    );
  }
}
