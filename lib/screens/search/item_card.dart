import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/api.dart';
import 'package:graduation_project_book_app/models/user.dart';
import 'package:graduation_project_book_app/models/vdp.dart';
import 'package:intl/intl.dart';

class ItemCard extends StatefulWidget {
  final VdpItem item;
  const ItemCard({
    Key key,
    this.item,
  }) : super(key: key);
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int _current = 0;
  User userHost;
  Future<User> getData() async {
    var result = await Api.getUser(widget.item?.host?.hostId);
    if (result != null)
      setState(() {
        userHost = result;
      });
    //return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var imageItem = widget.item.image.url;
    var itemTitle = widget.item.address;
    return Container(
      // height: 300,
      margin: EdgeInsets.fromLTRB(
          10, 10, 10, 10), //remmeber when merge searchScreen
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0.3,
            blurRadius: 0.5,
            offset: Offset(0.5, 0.5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              //flex: 2,
              height: 200,
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      // height: height,
                      viewportFraction: 1,

                      onPageChanged: (index, reason) {
                        // print(index);
                        print(_current);
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: imageItem.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                image: NetworkImage(i),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Positioned(
                    bottom: 10,
                    left: MediaQuery.of(context).size.width / 2 -
                        (imageItem.length * 10 + imageItem.length * 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var index = 0; index < imageItem.length; index++)
                          Container(
                            alignment: Alignment.center,
                            width: 10,
                            height: 10,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 10),
                            decoration: BoxDecoration(
                              color: _current == index
                                  ? Colors.white
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: userHost?.avatar != null
                                ? NetworkImage(userHost.avatar)
                                : NetworkImage(
                                    'https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png'),
                            fit: BoxFit.cover,
                          ),
                        )),
                  )
                ],
              )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.item.type.toUpperCase(),
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text:
                            '${NumberFormat('#,###').format(int.parse(widget.item.price.room))}', //dùng number fortmat mà chưa dùng đc '${NumberFormat('#,###').format(widget.listingPrice)}'
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' VND/Month',
                            style: DefaultTextStyle.of(context).style,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: widget.item.roomAvailable == true?Colors.orange[500]:Colors.blue,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text(widget.item.roomAvailable == true
                            ? "Available"
                            : "out of room",style: TextStyle(fontSize: 8),))
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '${itemTitle.addressNumber},${itemTitle.ward},district ${itemTitle.district},${itemTitle.city}',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF4C3B3B),
                  ),
                ),
                //them thong tin thi optional
                // Icon(Icons.tune)
              ],
            ),
          ))
        ],
      ),
    );
  }
}
