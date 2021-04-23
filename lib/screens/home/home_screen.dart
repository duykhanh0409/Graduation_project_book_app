import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/screens/home/become_host.dart';
import 'package:graduation_project_book_app/screens/home/explore_nearby.dart';
import 'package:graduation_project_book_app/screens/home/keyword_search.dart';
import 'package:graduation_project_book_app/screens/home/live_anywhere.dart';
import 'package:graduation_project_book_app/screens/home/title_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listimg = [
    'assets/images/img5.jpg',
    'assets/images/img6.jpg',
    'assets/images/img7.jpg',
    'assets/images/img8.jpg',
  ];
  var listImage = [
    'assets/images/item1.jpg',
    'assets/images/item2.jpg',
    'assets/images/item3.jpg',
    'assets/images/picture.jpg',
  ];
  var listTitle = ['Entire homes', 'Rooms', 'Motel', 'Motel'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(children: [
        TitleBar(),
        KeywordSearch(),
        ExploreNearby(listimg: listimg),
        LiveAnywhere(listImage: listImage, listTitle: listTitle),
        BecomeHost()
      ])),
    );
  }
}
