import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project_book_app/screens/search/item_card.dart';
import 'package:graduation_project_book_app/widgets/google_map.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      //statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
        // appBar: appBar(context),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Stack(
          children: [
            GestureDetector(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: MapScreen()),
            ),
            Container(
              // cái mới làm nè
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              padding: EdgeInsets.only(left: 10, right: 10, top: 5),
              alignment: isShow ? Alignment.topCenter : Alignment.center,
              height: isShow ? 100 : 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 3,
                    offset: Offset(1, 0),
                  ),
                ],
              ),
              child: isShow
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isShow ? isShow = false : isShow = true;
                                  });
                                },
                                child: Icon(Icons.close)),
                            Text(
                              'Ho chi minh',
                            ),
                            GestureDetector(
                                onTap: () {
                                  print('fliter screen');
                                  Navigator.of(context)
                                      .pushNamed('/fliterScreen');
                                  print('khanh');
                                },
                                child: Icon(Icons.tune))
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.grey.withOpacity(0.4))),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              Text(
                                'Ho Chi Minh',
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isShow ? isShow = false : isShow = true;
                            });
                          },
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back),
                              Text(
                                'Ho chi minh',
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              print('fliter screen');
                              Navigator.of(context).pushNamed('/fliterScreen');
                              print('khanh');
                            },
                            child: Icon(Icons.tune))
                      ],
                    ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: DraggableScrollableSheet(
                //bottomsheet
                maxChildSize: 1,
                minChildSize: 0.1,
                initialChildSize: .5,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    padding: EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 25,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemCard();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

