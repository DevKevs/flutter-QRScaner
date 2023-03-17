import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_scaner/models/scan_model.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition startPoint = CameraPosition(
      target: scan.getLatLgn(),
      zoom: 17.5,
      tilt: 50,
    );
    final Set<Marker> markers = <Marker>{};
    markers.add(Marker(
      markerId: const MarkerId('geo-location'),
      position: scan.getLatLgn(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller
                    .animateCamera(CameraUpdate.newCameraPosition(startPoint));
              },
              icon: const Icon(Icons.location_searching_outlined))
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        initialCameraPosition: startPoint,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mapType == MapType.normal) {
            setState(() {
              mapType = MapType.satellite;
            });
          } else {
            setState(() {
              mapType = MapType.normal;
            });
          }
        },
        child: const Icon(Icons.layers),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
