import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project_book_app/screens/host/widget/address_type.dart';
import 'package:graduation_project_book_app/screens/host/widget/facility_type.dart';
import 'package:graduation_project_book_app/screens/host/widget/room_type.dart';

class CreateNewRoom extends StatefulWidget {
  @override
  _CreateNewRoomState createState() => _CreateNewRoomState();
}

class _CreateNewRoomState extends State<CreateNewRoom> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      //statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                color: Colors.blueGrey,
                alignment: Alignment.center,
                child: Text(
                  "Let's set up your listing",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
              Positioned(
                top: 30,
                left: 30,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          PropertyRoom(
            propertyName: 'Property Room Type',
            navigatorName: RoomType(),
          ),
          PropertyRoom(propertyName: 'Address', navigatorName: AddressType()),
          PropertyRoom(
            propertyName: 'Photos',
            navigatorName: RoomType(),
          ),
          PropertyRoom(
            propertyName: 'Description',
            navigatorName: RoomType(),
          ),
          PropertyRoom(
            propertyName: 'Facility',
            navigatorName: FacilityType(),
          ),
          PropertyRoom(
            propertyName: 'Price',
            navigatorName: RoomType(),
          ),
        ],
      ),
    );
  }
}

class PropertyRoom extends StatelessWidget {
  final String propertyName;
  final Widget navigatorName;
  const PropertyRoom({
    Key key,
    this.propertyName,
    this.navigatorName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigatorName),
        );
      },
      padding: EdgeInsets.zero,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.only(bottom: 17),
        decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.4)))),
        child: Row(
          children: [
            Text(
              propertyName,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                  fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
            )
          ],
        ),
      ),
    );
  }
}
