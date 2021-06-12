import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/models/vdp.dart';

class MapScreen extends StatefulWidget {
  final List<VdpItem> item;
  LatLng location;
  MapScreen({this.item, this.location});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _latLng = LatLng(10.849690, 106.773916);

  List<Marker> _markers = [];
  List<Coordinates> coordinators = [];
  @override
  void dispose() {
    super.dispose();
  }

  Future<List<Coordinates>> getCurrentLocation() async {
    var data = widget.item;
    for (var i = 0; i < data.length; i++) {
      var itemTitle = data[i]?.address;
      final query =
          '${itemTitle?.addressNumber},${itemTitle?.ward},quận ${itemTitle?.district},${itemTitle?.city}' ??
              '111 Lê văn Chí,Linh Chiểu,Thủ Đức, thành phố hồ chí minh';
      print('${query}------------địa chỉ--------');
      var addresses = await Geocoder.local.findAddressesFromQuery(query);
      print(addresses[0].coordinates.latitude);
      setState(() {
        coordinators.add(addresses[0].coordinates);
      });
    }
    print(coordinators.length);

    return coordinators;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _latLng = widget.location;
    });
    // Future.delayed(Duration(seconds: 2), () {
    //   getCurrentLocation();
    // }); // chạy đây trước
  }

  List<LatLng> test = [LatLng(10.85110, 106.77512)];
  void _onMapCreated(GoogleMapController controller) async {
    await getCurrentLocation();
    for (var i = 0; i < coordinators.length; i++) {
      print('chay hàm này kh -----------------------------');
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('${coordinators[i].latitude}'),
            position:
                LatLng(coordinators[i].latitude, coordinators[i].longitude),
            infoWindow: InfoWindow(title: 'Room ${i.toString()}'),
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
        //4 vô đây
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        initialCameraPosition: CameraPosition(target: _latLng, zoom: 13.5),
        onMapCreated: _onMapCreated, //2 vô đây
        markers: Set.from(_markers), //3 vô đây
      ),
    );
  }
}
