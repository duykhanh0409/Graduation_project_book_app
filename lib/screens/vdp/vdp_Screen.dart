import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/api.dart';
import 'package:graduation_project_book_app/models/user.dart';
import 'package:graduation_project_book_app/models/vdp.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_detail.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_image_carousel.dart';
import 'package:graduation_project_book_app/widgets/google_Map_item.dart';
import 'package:url_launcher/url_launcher.dart';

class VdpScreens extends StatefulWidget {
  final List<VdpItem> listSave;
  final User user;
  final VdpItem item;
  const VdpScreens({
    Key key,
    this.item,
    this.user,
    this.listSave,
  }) : super(key: key);
  @override
  _VdpScreensState createState() => _VdpScreensState();
}

class _VdpScreensState extends State<VdpScreens> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController sdtController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  User userHost;
  DateTime _date = DateTime.now();
  Future<User> getData() async {
    var result = await Api.getUser(widget.item.host?.hostId);
    if (result != null)
      setState(() {
        userHost = result;
      });
    //return result;
  }

  Future<Null> _selecteDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1947),
        lastDate: DateTime(2030));
    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    print(_date);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  VdpImageCarousel(
                      listSave: widget.listSave,
                      item: widget.item,
                      user: widget.user),
                  Container(
                    height: 2,
                    color: Color(0xFFE85B00),
                  ),
                  VdpDetail(
                    userHost: userHost,
                    item: item,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '58/2 Thao Dien, Quan 2',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MapItem(item: item);
                            }));
                          },
                          child: Container(
                            height: 240,
                            child: MapItem(
                              item: item,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: .1,
                    blurRadius: 2,
                    offset: Offset(0, -1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      child: Row(
                        children: [
                          Icon(Icons.phone_iphone_outlined),
                          Text(' 0814358398')
                        ],
                      ),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      side: BorderSide(color: Colors.red)))),
                      onPressed: () =>
                          launch(('tel://${userHost?.phoneNumber}'))),
                  ElevatedButton(
                    child: Text("Reservation".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    side: BorderSide(color: Colors.red)))),
                    onPressed: () {
                      _modalBottomSheetMenu();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return new Container(
            height: 450.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                padding: EdgeInsets.only(top: 40),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('Đặt Lịch Hẹn',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 60,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1,
                                color: Colors.black.withOpacity(0.6))),
                        child: TextField(
                          controller: userNameController,
                          decoration: InputDecoration(
                              hintText: "Full Name",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        height: 60,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1,
                                color: Colors.black.withOpacity(0.6))),
                        child: TextField(
                          controller: sdtController,
                          decoration: InputDecoration(
                              hintText: "Email or Phone number",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        height: 60,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1,
                                color: Colors.black.withOpacity(0.6))),
                        child: TextField(
                          readOnly: true,
                          onTap: () {
                            setState(() {
                              _selecteDate(context);
                            });
                          },
                          decoration: InputDecoration(
                              hintText: _date.toString(),
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                      ElevatedButton(
                        child: Text("Gửi Lịch Hẹn".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    side: BorderSide(color: Colors.red)))),
                        onPressed: () {
                          print('gui lịch');
                        },
                      )
                    ],
                  ),
                )),
          );
        });
  }
}
