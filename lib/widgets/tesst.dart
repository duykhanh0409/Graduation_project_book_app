import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart' as a;
import 'package:graduation_project_book_app/models/vdp.dart';

class GeocodeView extends StatefulWidget {
  GeocodeView();

  @override
  _GeocodeViewState createState() => new _GeocodeViewState();
}

class _GeocodeViewState extends State<GeocodeView> {
  _GeocodeViewState();

  final TextEditingController _controller = new TextEditingController();

  dynamic results = [];

  bool isLoading = false;

  Future search() async {
    this.setState(() {
      this.isLoading = true;
    });

    try {
      /// var geocoding = AppState.of(context).mode;
      final query = "1600 Amphiteatre Parkway, Mountain View";
      var results = await a.Geocoder.local.findAddressesFromQuery(query);

      this.setState(() {
        this.results = results;
      });
    } catch (e) {
      print("Error occured: $e");
    } finally {
      this.setState(() {
        this.isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var b = results;
    print("${b.featureName} : ${b.coordinates}");
    return Scaffold(
      body: Text('khanh'),
    );
  }
}
