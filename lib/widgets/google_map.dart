import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
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
  Coordinates coordinator;
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  getCurrentLocation() async {
    var itemTitle = widget.item.first.address;
    final query =
        '${itemTitle.addressNumber},${itemTitle.ward},quận ${itemTitle.district},${itemTitle.city}';
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = addresses.first;
    print(
        " gia tri dau tien 22${first.featureName} : gia tri thu22 2${first.coordinates}");
    setState(() {
      coordinator = first.coordinates;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    print('-----------------------------------------------------------------');
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        initialCameraPosition: _cameraPosition,
        onMapCreated: (controler) => _googleMapController = controler,
        markers: {
          Marker(
            markerId: MarkerId('khanh'),
            position: LatLng(coordinator.latitude, coordinator.longitude),
            infoWindow: InfoWindow(title: 'khanh'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueViolet,
            ),
          ),
          gramercyMarker,
          bernardinMarker,
          blueMarker
        },
      ),
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
