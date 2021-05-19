import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
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

  // List<LatLng> locations;
  List<Marker> _markers = [];
  List<Coordinates> coordinators;
  //Coordinates coordinator;
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  getCurrentLocation() async {
    // hàm này sai setState chỉ đang lấy đc 1 thằng cuối

    for (var i = 0; i < widget?.item?.length; i++) {
      var itemTitle = widget?.item[i]?.address;
      final query =
          '${itemTitle?.addressNumber},${itemTitle?.ward},quận ${itemTitle?.district},${itemTitle?.city}' ??
              '111 Lê văn Chí,Linh Chiểu,Thủ Đức, thành phố hồ chí minh';
      print('${query}------------địa chỉ--------');
      var addresses = await Geocoder.local.findAddressesFromQuery(query);
      setState(() {
        coordinators.add(addresses[i].coordinates);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  List<LatLng> test = [
    LatLng(10.857702, 106.777149),
    LatLng(10.846741, 106.778264)
  ];
  void _onMapCreated(GoogleMapController controller) {
    for (var i = 0; i < widget?.item?.length; i++) {
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('${i}'),
            position: LatLng(test[i]?.latitude, test[i]?.longitude),
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
   // print('${coordinators[0].latitude}---------------giá trị');
    return Scaffold(
      body: GoogleMap(
          myLocationButtonEnabled: true,
          zoomControlsEnabled: true,
          initialCameraPosition: _cameraPosition,
          onMapCreated: _onMapCreated,
          markers: Set.from(_markers)),
    );
  }
}

