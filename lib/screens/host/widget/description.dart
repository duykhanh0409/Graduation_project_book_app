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
          'Description Room',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
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
                        'Describe your room in detail in terms of location, space in the room or current costs, problems of the room',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300)),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: TextFormField(
                        minLines:
                            10, // any number you need (It works as the rows for the textarea)
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: descriptionController,
                        decoration: InputDecoration(
                          hintText: "Mô tả chi tiết về phòng",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    )
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
