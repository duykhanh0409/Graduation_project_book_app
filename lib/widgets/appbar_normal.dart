import 'package:flutter/material.dart';

AppBar appbarNormal(BuildContext context, String title) {
  return AppBar(
    elevation: 1,
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
    ),
  );
}
