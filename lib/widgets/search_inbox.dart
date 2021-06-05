import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/screens/search/search_screen.dart';

class SearchInbox extends StatefulWidget {
  @override
  _SearchInboxState createState() => _SearchInboxState();
}

class _SearchInboxState extends State<SearchInbox> {
  List title = [
    {
      'title': 'Tăng Nhơn Phú A',
      'time': '1.5',
      'lat': '10.84582',
      'long': '106.79453'
    },
    {
      'title': 'Hiệp Phú',
      'time': '1.5',
      'lat': '10.846751',
      'long': '106.782023'
    },
    {
      'title': 'Linh Chiểu',
      'time': '1.5',
      'lat': '10.851934',
      'long': '106.766493'
    },
    {
      'title': 'Linh Đông',
      'time': '1.5',
      'lat': '10.851457',
      'long': '106.745018'
    },
    {
      'title': 'Thảo Điền',
      'time': '1.5',
      'lat': '10.804136',
      'long': '106.743508'
    },
    {
      'title': 'Long Thạnh Mỹ',
      'time': '1.5',
      'lat': '10.848265',
      'long': ' 106.814921'
    },
    {
      'title': 'Linh Xuân',
      'time': '1.5',
      'lat': '10.873552',
      'long': '106.769959'
    },
    {
      'title': 'Thủ Thiên',
      'time': '1.5',
      'lat': '10.768714',
      'long': '106.713654'
    },
    {
      'title': 'Phước Long A',
      'time': '1.5',
      'lat': '10.821309',
      'long': '106.763276'
    },
    {
      'title': 'Hiệp Bình Phước',
      'time': '1.5',
      'lat': '10.8483',
      'long': '106.720319'
    },
    {'title': 'An Phú', 'time': '1.5', 'lat': '10.79238', 'long': '105.090486'},
  ];
  @override
  Widget build(BuildContext context) {
    var techMobile = TechMobile.of(context);
    return Scaffold(
        body: Container(
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
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: title.length,
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
                        techMobile.fliterRoomLocation(title[index]['title']);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SearchScreen(
                            searchLocation: LatLng(
                                double.parse(title[index]['lat']),
                                double.parse(title[index]['long'])),
                          );
                        }));
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(Icons.location_city_rounded),
                          ),
                          Expanded(
                            child: Text(
                              "${title[index]['title']},Thành phố Thủ Đức",
                              softWrap: true,
                              maxLines: 3,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
