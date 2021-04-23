import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFF012169),
            flexibleSpace: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  Text(
                    '135.000 Results',
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        'Save Search',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverAppBar(
            backgroundColor: Color(0xFF012169),
            flexibleSpace: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 1, color: Colors.grey.withOpacity(0.7)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Icon(Icons.tune, color: Colors.white),
                                  Text('Fliter',
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                            )),
                        VerticalDivider(
                          width: 7,
                          color: Colors.white,
                        ),
                        Flexible(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Icon(Icons.tune, color: Colors.white),
                                  Text('Fliter',
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
