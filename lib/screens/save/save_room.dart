import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/models/user.dart';
import 'package:graduation_project_book_app/models/vdp.dart';
import 'package:graduation_project_book_app/screens/search/item_card.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_Screen.dart';
import 'package:graduation_project_book_app/styles/colors.dart';

class SaveRoom extends StatefulWidget {
  @override
  _SaveRoomState createState() => _SaveRoomState();
}

class _SaveRoomState extends State<SaveRoom> {
  User user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getListSave(context);
    });
    print(
        '----------------------------------------------------------------------------------------------------------initatiState Save');
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


  //RefreshIndicator
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
        body: techMobile.listSaveUser.length == 0
            ? Scaffold(
                body: Center(
                  child: Text("You don't have save room"),
                ),
              )
            : techMobile.listSaveUser == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    // padding: EdgeInsets.only(top: 30),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: RefreshIndicator(
                      onRefresh: () {
                        return techMobile.getListSave();
                      },
                      child: ListView.builder(
                        itemCount: techMobile?.listSaveUser?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          //print(state.vdpItem[index].type);
                          return FlatButton(
                            onPressed: () async {
                              List<VdpItem> s = await techMobile.getListSave();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return VdpScreens(
                                  listSave: s,
                                  user: techMobile.user,
                                  item: techMobile?.listSaveUser[index] ?? {},
                                );
                              }));
                            },
                            child: ItemCard(
                              item: techMobile?.listSaveUser[index] ?? {},
                            ),
                          );
                        },
                      ),
                    ),
                  ));
  }
}
