import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInbox extends StatefulWidget {
  @override
  _SearchInboxState createState() => _SearchInboxState();
}

class _SearchInboxState extends State<SearchInbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blue,
      child: Container(
        margin: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_outlined)),
              Container(
                height: 30,
                width: 300,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Where are you going?'),
                ),
              )
            ],
          )
        ]),
      ),
    ));
  }
}
