import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/screens/host/widget/address_type.dart';
import 'package:graduation_project_book_app/screens/host/widget/description.dart';
import 'package:graduation_project_book_app/screens/host/widget/facility_type.dart';
import 'package:graduation_project_book_app/screens/host/widget/photo_room.dart';
import 'package:graduation_project_book_app/screens/host/widget/price.dart';
import 'package:graduation_project_book_app/screens/host/widget/room_type.dart';
import 'package:graduation_project_book_app/screens/host/widget/verify_host.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_detail.dart';

class CreateNewRoom extends StatefulWidget {
  @override
  _CreateNewRoomState createState() => _CreateNewRoomState();
}

class _CreateNewRoomState extends State<CreateNewRoom> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('chayj laij di');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      //s
      //tatusBarBrightness: Brightness.dark,
    ));

    var techMobile = TechMobile.of(context);
    print(techMobile.typeRoom);
    print(techMobile.address);
    print(techMobile.wifi);
    print(techMobile?.listPhoto?.length);

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
              isVisible: techMobile.isShowRoomType),
          PropertyRoom(
              propertyName: 'Address',
              navigatorName: AddressType(),
              isVisible: techMobile.isShowAddress),
          PropertyRoom(
              propertyName: 'Photos',
              navigatorName: PhotoRoom(),
              isVisible: techMobile.isShowPhoto),
          PropertyRoom(
            propertyName: 'Description',
            navigatorName: DescriptionRoom(),
            isVisible: techMobile.isShowDescription,
          ),
          PropertyRoom(
            propertyName: 'Facility',
            navigatorName: FacilityType(),
            isVisible: techMobile.isShowFacility,
          ),
          PropertyRoom(
            propertyName: 'Price',
            navigatorName: PriceRoom(),
            isVisible: techMobile.isShowPrice,
          ),
          SizedBox(
            height: 30,
          ),
          FlatButton(
            onPressed: () {
             
            },
            child: Text('POST ROOM'),
            color: Colors.orange[900],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return VerifyHost();
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

class PropertyRoom extends StatelessWidget {
  final String propertyName;
  final Widget navigatorName;
  final bool isVisible;
  const PropertyRoom({
    Key key,
    this.propertyName,
    this.navigatorName,
    this.isVisible,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              propertyName,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                  fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            isVisible == true ? Icon(Icons.check_circle_outline) : Container()
          ],
        ),
      ),
    );
  }
}
