import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/screens/fliter/fliter_screen.dart';
import 'package:graduation_project_book_app/screens/search/item_card.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_Screen.dart';
import 'package:graduation_project_book_app/widgets/google_map.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String latti = "";
  String longitu = "";
  bool isShow = false;
  bool isLoading = true;
  bool isCheckEntireRoom = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 3), () {
      getData(context);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void getData(BuildContext context) {
    print('chay lai khong');
    var techMobile = TechMobile.of(context);
    var result;
    if (techMobile.vdpList?.length ?? 0 == 0) {
      setState(() {
        isLoading = true;
      });
      result = techMobile.getData();
    }
    if (result != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      //statusBarBrightness: Brightness.dark,
    ));
    var techMobile = TechMobile.of(context);
    print(isLoading);
    return techMobile.vdpList == null
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            body: Stack(
              children: [
                GestureDetector(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue,
                      child: MapScreen(
                        item: techMobile?.vdpList,
                      )),
                ),
                Container(
                  // cái mới làm nè
                  margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                  padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                  alignment: isShow ? Alignment.topCenter : Alignment.center,
                  height: isShow ? 100 : 50,
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
                                      showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 600,
                                            color: Colors.amber,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  const Text(
                                                      'Modal BottomSheet'),
                                                  ElevatedButton(
                                                    child: const Text(
                                                        'Close BottomSheet'),
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Icon(Icons.tune))
                              ],
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 10, right: 10, left: 10),
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
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return FliterScreen();
                                  }));
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
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return Container(
                          // padding: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: techMobile.vdpList?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              //print(state.vdpItem[index].type);
                              return FlatButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return VdpScreens(
                                      item: techMobile?.vdpList[index] ?? {},
                                    );
                                  }));
                                },
                                child: ItemCard(
                                  item: techMobile?.vdpList[index] ?? {},
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ))
              ],
            ));
  }
}
