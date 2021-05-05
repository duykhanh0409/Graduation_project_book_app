import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HostRoomListing extends StatefulWidget {
  @override
  _HostRoomListingState createState() => _HostRoomListingState();
}

class _HostRoomListingState extends State<HostRoomListing> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      //statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              'How would you like to start?',
              style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.grey.withOpacity(0.4))),
              child: FlatButton.icon(
                  onPressed: () {  Navigator.of(context).pushNamed('/createNewRoom');},
                  icon: Icon(Icons.add),
                  label: Text('Create')),
            )
          ],
        ),
      ),
    );
  }
}
