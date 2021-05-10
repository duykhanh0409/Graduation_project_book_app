import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInbox extends StatefulWidget {
  @override
  _SearchInboxState createState() => _SearchInboxState();
}

class _SearchInboxState extends State<SearchInbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: Colors.blue,
        child: Container(
          margin: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_outlined)),
                Container(
                  height: 30,
                  width: 300,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Where are you going?'),
                  ),
                )
              ],
            ),
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Colors.grey.withOpacity(0.3)))),
                    child: FlatButton(
                      onPressed: () {
                        print('khanh');
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(Icons.location_city_rounded),
                          ),
                          Text('Thảo Điền,Quận 2, Ho Chi Minh city')
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
