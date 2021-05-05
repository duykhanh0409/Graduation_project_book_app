import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_detail.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_image_carousel.dart';
import 'package:graduation_project_book_app/widgets/google_map.dart';

class VdpScreens extends StatefulWidget {
  @override
  _VdpScreensState createState() => _VdpScreensState();
}

class _VdpScreensState extends State<VdpScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  VdpImageCarousel(),
                  Container(
                    height: 2,
                    color: Color(0xFFE85B00),
                  ),
                  VdpDetail(),
                  Divider(
                    thickness: 1,
                    color: Color(0xFFE4D9D9),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                         SizedBox(height: 10,),
                        Text(
                          '58/2 Thao Dien, Quan 2',
                        ),
                         SizedBox(height: 10,),
                        Container(
                          height: 240,
                          child: MapScreen(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: .1,
                    blurRadius: 2,
                    offset: Offset(0, -1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('1.500.000'),
                  ElevatedButton(
                      child: Text("Reservation".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      side: BorderSide(color: Colors.red)))),
                      onPressed: () => null)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
