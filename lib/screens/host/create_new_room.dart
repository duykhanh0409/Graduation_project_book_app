import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          SizedBox(
            height: 20,
          ),
          PropertyRoom(
            propertyName: 'Property Room Type',
            navigatorName: 'roomType',
          ),
        ],
      ),
    );
  }
}

class PropertyRoom extends StatelessWidget {
  final String propertyName;
  final String navigatorName;
  const PropertyRoom({
    Key key,
    this.propertyName,
    this.navigatorName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/roomType');
      },
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
