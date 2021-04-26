import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_detail.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_image_carousel.dart';

class VdpScreens extends StatefulWidget {
  @override
  _VdpScreensState createState() => _VdpScreensState();
}

class _VdpScreensState extends State<VdpScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  VdpImageCarousel(),
                  Container(
                    height: 2,
                    color: Color(0xFFE85B00),
                  ),
                  VdpDetail(),
                  Container(
                    height: 100,
                    color: Colors.white,
                  )
                ],
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
                        child: Text("Buy now".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
      ),
    );
  }
}
