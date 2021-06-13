import 'package:dio/dio.dart';
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
import 'package:graduation_project_book_app/screens/navigation_screen.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_detail.dart';

class CreateNewRoom extends StatefulWidget {
  @override
  _CreateNewRoomState createState() => _CreateNewRoomState();
}

class _CreateNewRoomState extends State<CreateNewRoom> {
  var isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('chayj laij di');
  }

  Future<dynamic> _uploadRoom() async {
    var techMobile = TechMobile.of(context);
    // var address = {
    //   'district': techMobile.district,
    //   'ward': techMobile.ward,
    //   'city': techMobile.city,
    //   'addr_number': techMobile.address
    // };
    // var facility = {
    //   'squareMeters': techMobile.square,
    //   'wife': techMobile.wifi,
    //   'bedroom': techMobile.bedRoom,
    //   'bath': techMobile.bathRoom,
    //   'mezzanine': techMobile.gac
    // };
    // var host = {'host_id': techMobile?.user?.id};
    // var price = {
    //   'room': techMobile.priceRoom,
    //   'electricity': techMobile.priceElec,
    //   'water': techMobile.priceWater
    // };
    // var image = {"alt": 'phong', "url": techMobile.listPhoto};

    FormData formData = FormData.fromMap({
      'type': techMobile.typeRoom,
      'district': techMobile.district,
      'ward': techMobile.ward,
      'city': techMobile.city,
      'addr_number': techMobile.address,
      'description': techMobile.descriptionRoom,
      'squareMeters': techMobile.square,
      'wifi': techMobile.wifi,
      'bedroom': techMobile.bedRoom,
      'bath': techMobile.bathRoom,
      'mezzanine': techMobile.gac,
      'host_id': techMobile?.user?.id,
      'room': techMobile.priceRoom,
      'electricity': techMobile.priceElec,
      'water': techMobile.priceWater,
      'image': techMobile.listPhoto,
      'alt': 'phong'
    });
    return await Dio()
        .post('https://book-room-app.herokuapp.com/product/api/create',
            data: formData)
        .then((dynamic result) {
      setState(() {
        isLoading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NavigationScreen();
      }));
    });
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
                    propertyName: 'Photos', //ghi thêm hướng dẫn
                    navigatorName: PhotoRoom(),
                    isVisible: techMobile.isShowPhoto),
                PropertyRoom(
                  propertyName: 'Description',
                  navigatorName: DescriptionRoom(),
                  isVisible: techMobile.isShowDescription,
                ),
                PropertyRoom(
                  propertyName: 'Facility', //ghi thêm hướng dẫn
                  navigatorName: FacilityType(),
                  isVisible: techMobile.isShowFacility,
                ),
                PropertyRoom(
                  propertyName: 'Price', //ghi thêm hướng dẫn
                  navigatorName: PriceRoom(),
                  isVisible: techMobile.isShowPrice,
                ),
                SizedBox(
                  height: 30,
                ),
                techMobile.verifyHost
                    ? FlatButton(
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          _uploadRoom();
                        },
                        child: Text('POST ROOM'),
                        color: Colors.orange[900],
                      )
                    : Container()
              ],
            ),
          ),
          isLoading
              ? Positioned(
                  child: Container(
                    color: Colors.grey.withOpacity(0.7),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
      floatingActionButton: techMobile.verifyHost
          ? null
          : FloatingActionButton(
              onPressed: () {
                if (techMobile.isShowRoomType == true &&
                    techMobile.isShowAddress == true &&
                    techMobile.isShowPhoto == true &&
                    techMobile.isShowDescription == true &&
                    techMobile.isShowFacility == true &&
                    techMobile.isShowPrice == true) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VerifyHost();
                  }));
                } else {
                  final snackBar = SnackBar(
                      padding: EdgeInsets.all(10),
                      content: Text(
                        "Vui Lòng điền đủ thông tin",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
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
