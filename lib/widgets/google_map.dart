import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project_book_app/models/vdp.dart';

class MapScreen extends StatefulWidget {
  final List<VdpItem> item;
  MapScreen({Key key, this.item}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _cameraPosition =
      CameraPosition(target: LatLng(10.849690, 106.773916), zoom: 11.5);
  GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;
  Location test1;
  Set<Marker> _markers = {};
  //Coordinates coordinator;
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  getCurrentLocation() async {
    var itemTitle = widget.item.first.address;
    final query =
        '${itemTitle.addressNumber},${itemTitle.ward},quận ${itemTitle.district},${itemTitle.city}';
    List<Location> locations = await locationFromAddress(query);
    print(" gia tri dau tien ${locations}");
    setState(() {
      test1 = locations[0];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('khanh'),
          position: LatLng(test1.latitude, test1.longitude),
          infoWindow: InfoWindow(title: 'khanh'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueViolet,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print('-----------------------------------------------------------------');
    return Scaffold(
      body: GoogleMap(
          myLocationButtonEnabled: true,
          zoomControlsEnabled: true,
          initialCameraPosition: _cameraPosition,
          onMapCreated: _onMapCreated,
          markers: Set<Marker>.of(_markers)),
    );
  }
}

Marker gramercyMarker = Marker(
  markerId: MarkerId('gramercy'),
  position: LatLng(10.845694, 106.758342),
  infoWindow: InfoWindow(title: 'Gramercy Tavern'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker bernardinMarker = Marker(
  markerId: MarkerId('bernardin'),
  position: LatLng(10.85059, 106.77188),
  infoWindow: InfoWindow(title: 'Le Bernardin'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker blueMarker = Marker(
  markerId: MarkerId('bluehill'),
  position: LatLng(10.846664613902156, 106.77834887046636),
  infoWindow: InfoWindow(title: 'Blue Hill'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
