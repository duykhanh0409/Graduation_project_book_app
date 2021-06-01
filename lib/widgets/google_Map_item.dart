import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project_book_app/models/vdp.dart';

class MapItem extends StatefulWidget {
  final VdpItem item;
  MapItem({Key key, this.item}) : super(key: key);

  @override
  _MapItemState createState() => _MapItemState();
}

class _MapItemState extends State<MapItem> {
  static const _cameraPosition =
      CameraPosition(target: LatLng(10.845509, 106.755292), zoom: 10.5);
  GoogleMapController _googleMapController;
  Future<Widget> reloadCurrentLocation;
  // List<LatLng> locations;
  //List<Marker> _markers = [];
  Coordinates coordinators;
  // Position myLocation;
  //Coordinates coordinator;
  @override
  void dispose() {
   // _googleMapController.dispose();
    super.dispose();
  }

  getCurrentLocation() async {
    var itemTitle = widget?.item?.address;
    final query =
        '${itemTitle?.addressNumber},${itemTitle?.ward},quận ${itemTitle?.district},${itemTitle?.city}' ??
            '111 Lê văn Chí,Linh Chiểu,Thủ Đức, thành phố hồ chí minh';
    print('${query}------------địa chỉ--------');
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    setState(() {
      coordinators = addresses?.first?.coordinates;
      // myLocation = position;
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
    //print('${myLocation?.latitude}---------------giá trị');
    return Scaffold(
        body: GoogleMap(
      myLocationButtonEnabled: true,
      zoomControlsEnabled: true,
      initialCameraPosition: _cameraPosition,
      onMapCreated: (controler) => _googleMapController = controler,
      // polylines: {
      //   Polyline(
      //       polylineId: PolylineId('Overview'),
      //       color: Colors.red,
      //       width: 5,
      //       points: [
      //         LatLng(coordinators?.latitude, coordinators?.longitude),
      //         LatLng(myLocation?.latitude, myLocation?.longitude)
      //       ])
      // },
      markers: {
        Marker(
          markerId: MarkerId('khanh'),
          position: LatLng(
              coordinators?.latitude ?? 10.8773221, coordinators?.longitude),
          infoWindow: InfoWindow(title: 'khanh'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueViolet,
          ),
        ),
        //  Marker(
        //   markerId: MarkerId('My Location'),
        //   position: LatLng(myLocation?.latitude??10.8773221, myLocation?.longitude),
        //   infoWindow: InfoWindow(title: 'khanh'),
        //   icon: BitmapDescriptor.defaultMarkerWithHue(
        //     BitmapDescriptor.hueViolet,
        //   ),
        // ),
      },
    ));
  }
}
