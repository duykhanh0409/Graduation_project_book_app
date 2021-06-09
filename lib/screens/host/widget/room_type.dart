// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/screens/host/create_new_room.dart';

class RoomType extends StatefulWidget {
  @override
  _RoomTypeState createState() => _RoomTypeState();
}

class _RoomTypeState extends State<RoomType> {
  var selectedRoom;

  void selectedTypeRoom() {
    var techMobile = TechMobile.of(context);
    if (selectedRoom == 1) {
      techMobile.typeRoom = "Entire Room";
      techMobile.isShowRoomType = true;
    }
    if (selectedRoom == 2) {
      techMobile.typeRoom = "Room";
      techMobile.isShowRoomType = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'What Type your room',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: 'ENTIRE ROOM:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' this is kind of a mini apartment',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.normal,
                            fontSize: 18)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: 'ROOM:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'This is a single room, smaller than a mini apartment ',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.normal,
                            fontSize: 18)),
                  ],
                ),
              ),
              RadioListTile(
                value: 1,
                groupValue: selectedRoom,
                title: Text('Entire Home'),
                onChanged: (val) {
                  setState(() {
                    selectedRoom = 1;
                  });
                },
                activeColor: Colors.grey,
                selected: false,
              ),
              RadioListTile(
                value: 2,
                groupValue: selectedRoom,
                title: Text('Room'),
                onChanged: (val) {
                  setState(() {
                    selectedRoom = 2;
                  });
                },
                activeColor: Colors.grey,
                selected: false,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectedTypeRoom();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateNewRoom();
          }));
        },
        tooltip: 'Continues',
        child: Icon(
          Icons.arrow_right_alt_sharp,
          size: 30,
        ),
      ), //
    );
  }
}
