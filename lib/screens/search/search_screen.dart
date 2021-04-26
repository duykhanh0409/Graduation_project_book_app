import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/screens/search/item_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    print(isShow);
    return SafeArea(
      child: Scaffold(
          appBar: appBar(context),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child:FlatButton(onPressed: (){print('khanh');}, child: Text('map'))
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: DraggableScrollableSheet( //bottomsheet
                    maxChildSize: 1,
                    minChildSize: 0.1,
                    initialChildSize: .5,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Container(
                        padding: EdgeInsets.only(top: 50),
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight:Radius.circular(25) )
                       ),
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
                )
              ],
            ),
          )),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
          backgroundColor: Colors.white,
          bottom: isShow ? search(context) : null,
          flexibleSpace: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Container(
                height: double.infinity,
                width: 300,
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: isShow
                    ? null
                    : EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(isShow ? 0 : 16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 3,
                      offset: Offset(1, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: isShow
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isShow ? isShow = false : isShow = true;
                                    });
                                  },
                                  child: Icon(Icons.close)),
                              Text('Edit your search',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(fontSize: 18)),
                              Icon(Icons.tune)
                            ])
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
                                  Icon(isShow
                                      ? Icons.close
                                      : Icons.arrow_back),
                                  Text('Ho chi minh')
                                ],
                              ),
                            ),
                            Icon(Icons.tune),
                          ],
                        ),
                )),
          ),
        );
  }

  PreferredSize search(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: .4),
              borderRadius: BorderRadius.circular(12)),
          margin: EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: .4))),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 5),
                      Text('Ho Chi Minh City'),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border(right: BorderSide(width: .2))),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today_rounded),
                              SizedBox(width: 5),
                              Text('khanh'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border(left: BorderSide(width: .2))),
                          child: Row(
                            children: [
                              Icon(Icons.people_alt_rounded),
                              SizedBox(width: 5),
                              Text('khanh'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
