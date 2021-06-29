import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/screens/home/become_host.dart';
import 'package:graduation_project_book_app/screens/home/explore_nearby.dart';
import 'package:graduation_project_book_app/screens/home/keyword_search.dart';
import 'package:graduation_project_book_app/screens/home/live_anywhere.dart';

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
    'assets/images/img7.jpg',
    'assets/images/img8.jpg',
    'assets/images/img7.jpg',
    'assets/images/img8.jpg',
  ];
  var listImage = [
    'assets/images/item1.jpg',
    'assets/images/item2.jpg',
  ];
  var listTitle = ['Entire homes', 'Rooms'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData(context);
      getListSave(context);
    });
  }

  void getData(BuildContext context) {
    print('chay lai khong');
    var techMobile = TechMobile.of(context);
    var result;

    result = techMobile.getData();
    // }
    if (result != null) {
      // setState(() {
      //   isLoading = false;
      // });
    }
  }

  void getListSave(BuildContext context) {
    print('chay lai khong');
    var techMobile = TechMobile.of(context);
    var result;
    // if (techMobile.listSaveUser?.length ?? 0 == 0) {
    result = techMobile.getListSave();
    // }
    if (result != null) {}
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    var techmobile = TechMobile.of(context);
    print(
        "${techmobile?.vdpList?.length} co dai đálsakdkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    return Scaffold(
      body: ListView(children: [
        //TitleBar(),
        KeywordSearch(),
        ExploreNearby(listimg: listimg),
        LiveAnywhere(listImage: listImage, listTitle: listTitle),
        BecomeHost()
      ]),
    );
  }
}
