import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VdpScreens extends StatefulWidget {
  @override
  _VdpScreensState createState() => _VdpScreensState();
}

class _VdpScreensState extends State<VdpScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/item1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.only(left: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF181212).withOpacity(0.41)),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 5,
              color: Color(0xFFE85B00),
            ),
            Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                margin:
                                    EdgeInsets.only(top: 5, right: 5, left: 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/khanh.jpg'),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Verify Host',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    'khanh Host',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '1.500.000 VND',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Per month')
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                                color: (Color(0xFF71DFD3)),
                                borderRadius: BorderRadius.circular(25)),
                            child: Icon(Icons.message),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 7, bottom: 5),
                        child: Text(
                          'Information',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF012169),
                          ),
                        ),
                      ),
                      Text(
                        'Housed in a three-storied semi-detached apartment our homestay is well managed and has been a leading  homestay choice for many local and.',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Color(0xFF6D4E4E)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Color(0xFFE4D9D9), width: 1),
                              bottom: BorderSide(
                                  color: Color(0xFFE4D9D9), width: 1)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    padding: EdgeInsets.only(top: 13),
                                    margin: EdgeInsets.only(right: 13),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF012169),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      '8.9',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Very Good',
                                        style: TextStyle(
                                            color: Color(0xFF012169),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      Text(
                                        '234 reviews',
                                        style:
                                            TextStyle(color: Color(0xFF464E46)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                      Text('Accommodation'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [Icon(Icons.fit_screen), Text('70m')],
                          ),
                          Column(
                            children: [Icon(Icons.bedtime_sharp), Text('70m')],
                          ),
                          Column(
                            children: [Icon(Icons.bathtub), Text('70m')],
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
