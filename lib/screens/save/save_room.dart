import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/styles/colors.dart';

class SaveRoom extends StatefulWidget {
  @override
  _SaveRoomState createState() => _SaveRoomState();
}

class _SaveRoomState extends State<SaveRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YOUR SAVE'),
        backgroundColor: AtcColors.mainColor,
        centerTitle: true,
      ),
    );
  }
}
