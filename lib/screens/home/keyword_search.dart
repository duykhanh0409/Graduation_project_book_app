import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeywordSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var heightBg = MediaQuery.of(context).size.height * 0.63;
    return Column(children: [
      Container(
        height: heightBg,
        width: double.infinity,
        padding: EdgeInsets.only(top: 30),
        //color: Color(0xFF012169),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/bg1.png'),
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'What are you looking for?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              alignment: Alignment.center,
              height: 55,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              padding: EdgeInsets.only(
                left: 15,
                right: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search by area,style room'),
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 17,
                          letterSpacing: 0.8),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color(0xFFE85B00), shape: BoxShape.circle),
                    child: Icon(Icons.search),
                  )
                ],
              ),
            ),
            // Text(
            //   'Start with Explore Nearby,Live anywhere, style room',
            //   style: TextStyle(color: Colors.white, fontSize: 12),
            // ),
            // Text(
            //   'All rooms',
            //   style: TextStyle(color: Color(0xFFE85B00)),
            // )
          ],
        ),
      ),
      Container(
        height: 2,
        color: Color(0xFFE85B00),
      )
    ]);
  }
}
