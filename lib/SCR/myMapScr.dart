import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MyMapScr extends StatefulWidget {
 late LatLng loc;
  late String name;
  MyMapScr({required this.loc,this.name='' });

  @override
  _MyMapScrState createState() => _MyMapScrState();
}

class _MyMapScrState extends State<MyMapScr> {
  List<Marker> _markers = <Marker>[];
  Completer<GoogleMapController> _controller = Completer();

 late CameraPosition _kGooglePlex ;

  @override
  void initState() {
    super.initState();
    _kGooglePlex = CameraPosition(
      target: widget.loc,
      zoom: 15,
    );
    _markers.add(      Marker(
      markerId: MarkerId('1'),
      position: widget.loc,
      infoWindow: InfoWindow(
          title: widget.name
      )
    ));
  }

  @override
  Widget build(BuildContext context) {

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,markers: Set<Marker>.of(_markers),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
