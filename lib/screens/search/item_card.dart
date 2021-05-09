import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_Screen.dart';

class ItemCard extends StatefulWidget {
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int _current = 0;

  List img = [
    'assets/images/item2.jpg',
    'assets/images/item1.jpg',
    'assets/images/item3.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return VdpScreens();
        }));
      },
      child: Container(
        height: 280,
        margin: EdgeInsets.fromLTRB(
            10, 10, 10, 10), //remmeber when merge searchScreen
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.1),
          //     spreadRadius: 0.3,
          //     blurRadius: 0.5,
          //     offset: Offset(0.5, 0.5), // changes position of shadow
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                //flex: 2,
                height: 200,
                child: Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        // height: height,
                        viewportFraction: 1,

                        onPageChanged: (index, reason) {
                          // print(index);
                          print(_current);
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: img.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  image: DecorationImage(
                                    image: AssetImage(i),
                                    fit: BoxFit.cover,
                                  )),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Positioned(
                      bottom: 10,
                      left: MediaQuery.of(context).size.width / 2 -
                          (img.length * 10 + img.length * 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var index = 0; index < img.length; index++)
                            Container(
                              alignment: Alignment.center,
                              width: 10,
                              height: 10,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 10),
                              decoration: BoxDecoration(
                                color: _current == index
                                    ? Colors.white
                                    : Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/khanh.jpg'),
                              fit: BoxFit.cover,
                            ),
                          )),
                    )
                    
                  ],
                )),
            Container(
                child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Apartment',
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '1.500.000VND/',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Month',
                          style: DefaultTextStyle.of(context).style,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '53/2 Thao Dien, Quan 2, HCM',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF4C3B3B),
                    ),
                  ),
                  //them thong tin thi optional
                  // Icon(Icons.tune)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
