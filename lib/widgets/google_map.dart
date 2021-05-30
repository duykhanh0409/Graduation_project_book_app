import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  List<Coordinates> item;
  LatLng location;
  MapScreen({this.item, this.location});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _latLng = LatLng(10.849690, 106.773916);

  GoogleMapController _googleMapController;

  // List<LatLng> locations;
  List<Marker> _markers = [];
  List<Coordinates> coordinators = [];
  @override
  void dispose() {
    // _googleMapController.dispose();
    super.dispose();
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
      ));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _latLng = widget.location;
    });
  }

  List<LatLng> test = [LatLng(10.85110, 106.77512)];
  void _onMapCreated(GoogleMapController controller) {
    for (var i = 0; i < test.length; i++) {
      print('chay hàm này kh -----------------------------');
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('${i.toString()}'),
            position: test[i],
            infoWindow: InfoWindow(title: 'khanh'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueViolet,
            ),
          ),
          // MapMarker()
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("${coordinators.length} nay quan trong");
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        initialCameraPosition: CameraPosition(target: _latLng, zoom: 13.5),
        onMapCreated: _onMapCreated,
        markers: Set.from(_markers),
      ),
    );
  }
}
