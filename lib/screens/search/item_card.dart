import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,

        margin: EdgeInsets.symmetric(
            horizontal: 20, vertical: 70), //remmeber when merge searchScreen
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                            image: AssetImage('assets/images/item1.jpg'),
                            fit: BoxFit.cover,
                          )),
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
            Flexible(
                flex: 1,
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
                        style: TextStyle(
                            color: Color(0xFF012169),
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        '1.500.000 VND/Month',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF4C3B3B),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        '53/2 Thao Dien, Quan 2, HCM',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF4C3B3B),
                            fontWeight: FontWeight.w600),
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
