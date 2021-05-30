import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FacilityType extends StatefulWidget {
  @override
  _FacilityTypeState createState() => _FacilityTypeState();
}

class _FacilityTypeState extends State<FacilityType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      child: Column(
        children: [
          Text('What facility will you offer?'),
          Text(
              "You'll be able to add more amenities after you publish your listing"),
          Text('Facilitys'),
          Container(
            child: Row(
              children: [],
            ),
          )
        ],
      ),
    )));
  }
}
