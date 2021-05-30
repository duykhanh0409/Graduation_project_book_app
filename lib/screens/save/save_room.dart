import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/styles/colors.dart';

class SaveRoom extends StatefulWidget {
  @override
  _SaveRoomState createState() => _SaveRoomState();
}

class _SaveRoomState extends State<SaveRoom> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData(context);
    });
  }

  void getData(BuildContext context) {
    print('chay lai khong');
    var techMobile = TechMobile.of(context);
    var result;
    if (techMobile.listSaveUser?.length ?? 0 == 0) {
      result = techMobile.getListSave();
    }
    if (result != null) {}
  }

  @override
  Widget build(BuildContext context) {
    var techMobile = TechMobile.of(context);
    print(techMobile?.listSaveUser?.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('YOUR SAVE'),
        backgroundColor: AtcColors.mainColor,
        centerTitle: true,
      ),
    );
  }
}
