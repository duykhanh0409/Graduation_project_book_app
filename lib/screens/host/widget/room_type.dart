import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomType extends StatefulWidget {
  @override
  _RoomTypeState createState() => _RoomTypeState();
}

class _RoomTypeState extends State<RoomType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [Text('Type Room ')],
        ),
      ),
    );
  }
}
