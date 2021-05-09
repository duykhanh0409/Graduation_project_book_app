import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/widgets/search_inbox.dart';

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
          image: AssetImage('assets/images/bghome.jpg'),
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
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchInbox()),
                  );
                },
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.white, width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.8,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Search by area,style room',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 15,
                            letterSpacing: 0.8),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Color(0xFFE85B00), shape: BoxShape.circle),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
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
