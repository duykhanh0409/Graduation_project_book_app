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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
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
          "What Type your room",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              // Stack(
              //   children: [
              //     Container(
              //       height: 150,
              //       color: Colors.blueGrey,
              //       alignment: Alignment.center,
              //       child: Text(
              //         "What Type your room",
              //         style: Theme.of(context).textTheme.subtitle1.copyWith(
              //             color: Colors.white,
              //             fontWeight: FontWeight.bold,
              //             fontSize: 22),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
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
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
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
              )
            ],
          ),
        )
      ]),
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
