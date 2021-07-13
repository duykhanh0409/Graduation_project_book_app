import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/api.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
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
  TextEditingController commentController = new TextEditingController();
  User userHost;
  bool test = false;
  List<Review> listComment = [];
  DateTime _date = DateTime.now();
  Future<User> getData() async {
    var result = await Api.getUser(widget.item?.host?.hostId);
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
    setState(() {
      if (widget?.item?.reviews != null) {
        listComment = widget?.item?.reviews;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    var address = widget.item.address;
    print("${userHost?.username} có phai null kh");
    var techMobile = TechMobile.of(context);
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
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Reviews about Room',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          side:
                                              BorderSide(color: Colors.red)))),
                              onPressed: () async {
                                await buildShowModalBottomSheet(
                                    context, techMobile, item);
                              },
                              child: Text('Add Comments')),
                        ),
                        listComment.length == 0 //tạo  []comment==item.reviews
                            ? Container() // sao đó ở dưới đây []comment.leng
                            : Container(
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: listComment.length != null
                                      ? listComment.length
                                      : 0,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          margin: EdgeInsets.only(
                                              right: 5, bottom: 5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(listComment[
                                                          index]
                                                      .image ??
                                                  'https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(listComment[index].username ??
                                                'N/A'),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(listComment[index].comment)
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Location',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${address.addressNumber},${address.ward},district ${address.district},${address.city}',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 240,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return MapItem(item: item);
                              }));
                            },
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
                  // ElevatedButton(
                  //   child: Text("Reservation".toUpperCase(),
                  //       style: TextStyle(fontSize: 14)),
                  //   style: ButtonStyle(
                  //       foregroundColor:
                  //           MaterialStateProperty.all<Color>(Colors.white),
                  //       backgroundColor:
                  //           MaterialStateProperty.all<Color>(Colors.red),
                  //       shape:
                  //           MaterialStateProperty.all<RoundedRectangleBorder>(
                  //               RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(7),
                  //                   side: BorderSide(color: Colors.red)))),
                  //   onPressed: () {
                  //     _modalBottomSheetMenu();
                  //   },
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildShowModalBottomSheet(
      BuildContext context, TechMobileState techMobile, VdpItem item) async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return SingleChildScrollView(
            child: new Container(
              height: 390.0,
              //could change this to Color(0xFF737373),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child: new Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      // Text(
                      //   'Review Room',
                      //   style: Theme.of(context).textTheme.subtitle1.copyWith(
                      //       fontSize: 15, fontWeight: FontWeight.bold),
                      // ),
                      Container(
                        height: 60,
                        width: 60,
                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: techMobile?.user?.avatar == null
                                ? NetworkImage(
                                    'https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png')
                                : NetworkImage(techMobile?.user?.avatar),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        techMobile?.user?.username,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        minLines:
                            6, // any number you need (It works as the rows for the textarea)
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: commentController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      ElevatedButton(
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
                        onPressed: () async {
                          await Api.addCommentRoom(
                              item?.id,
                              techMobile?.user?.id,
                              commentController.text,
                              techMobile?.user?.username,
                              techMobile?.user?.avatar);

                          setState(() {
                            listComment.add(Review(
                                reviewerId: techMobile?.user?.id,
                                comment: commentController.text,
                                username: techMobile?.user?.username,
                                image: techMobile?.user?.avatar));
                          });
                          commentController.text = '';
                        },
                        child: Container(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Comment'),
                              Icon(Icons.send_outlined),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          );
        });
  }
}
