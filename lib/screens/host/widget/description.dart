import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/screens/host/create_new_room.dart';

class DescriptionRoom extends StatefulWidget {
  @override
  _DescriptionRoomState createState() => _DescriptionRoomState();
}

class _DescriptionRoomState extends State<DescriptionRoom> {
  TextEditingController descriptionController = new TextEditingController();
  void filterDescription(BuildContext context) {
    var techMobile = TechMobile.of(context);
    if (descriptionController.text != "") {
      techMobile.descriptionRoom = descriptionController.text;
      techMobile.isShowDescription = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Text(
                'Description Room',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1, color: Colors.grey.withOpacity(0.1)))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                    Container(
                        height: 30,
                        child: TextField(
                          controller: descriptionController,
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          filterDescription(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateNewRoom();
          }));
        },
        tooltip: 'Continues',
        child: Icon(
          Icons.arrow_right_alt_sharp,
          size: 30,
        ),
      ),
    );
  }
}
