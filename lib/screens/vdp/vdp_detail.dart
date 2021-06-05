import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart' as Images;
import 'package:graduation_project_book_app/logic/api.dart';
import 'package:graduation_project_book_app/models/user.dart';
import 'package:graduation_project_book_app/models/vdp.dart';
import 'package:intl/intl.dart';

class VdpDetail extends StatefulWidget {
  final VdpItem item;
  final User userHost;
  const VdpDetail({
    Key key,
    this.item,
    this.userHost,
  }) : super(key: key);

  @override
  _VdpDetailState createState() => _VdpDetailState();
}

class _VdpDetailState extends State<VdpDetail> {
  @override
  Widget build(BuildContext context) {
    var itemTitle = widget.item.address;
    // print(userHost?.username);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 160,
                  child: Text(
                    '${itemTitle.addressNumber},${itemTitle.ward},district ${itemTitle.district},${itemTitle.city}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              Column(
                children: [
                  Text(
                    "${NumberFormat('#,###').format(int.parse(widget.item.price.room))} VDN",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('Per month')
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(thickness: 1, color: Color(0xFFE4D9D9)),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: Text(
              'Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Text(
            widget.item.discription,
            textAlign: TextAlign.start,
            style: TextStyle(color: Color(0xFF6D4E4E)),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 100,
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Color(0xFFE4D9D9), width: 1),
                  bottom: BorderSide(color: Color(0xFFE4D9D9), width: 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(right: 13),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        '8.9',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Very Good',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          '${widget.item.reviews.length} reviews',
                          style: TextStyle(color: Color(0xFF464E46)),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: widget.userHost?.avatar != null
                                ? NetworkImage(widget.userHost?.avatar)
                                : NetworkImage(
                                    'https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Verify Host',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          widget.userHost?.username != null
                              ? "${widget.userHost?.username} Host"
                              : "N/A Host",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text('Facility Detail',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DescriptionDetail(
                icon: Icons.home_outlined,
                title: widget.item.type,
                total: '1',
                subtitle:
                    'Căn hộ cung cấp không gian đầy đủ cho việc sinh hoạt',
              ),
              DescriptionDetail(
                icon: Icons.wifi,
                title: 'Wifi',
                total: widget.item.facility.wife == "1" ? 'Yes' : 'No',
                subtitle: 'Cung cấp Wifi cho người thuê sử dụng',
              ),
              DescriptionDetail(
                icon: Icons.bathtub,
                title: 'Bath',
                total: widget.item.facility.bath != Null
                    ? '${widget.item.facility.bath}'
                    : 'N/A',
                subtitle: 'Cung cấp phòng tắm cho người thuê',
              ),
              DescriptionDetail(
                icon: Icons.archive_sharp,
                title: 'Acreage',
                total: '${widget.item.facility.square}',
                subtitle: 'Diện tích sàn',
              ),
              DescriptionDetail(
                icon: Icons.account_balance,
                title: 'mezzanine',
                total: widget.item.facility.bath != Null
                    ? '${widget.item.facility.mezzanine}'
                    : 'N/A',
                subtitle: 'Gác cho người thuê',
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1,
            color: Color(0xFFE4D9D9),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'More Detail',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Giá Điện:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text('${widget.item.price.electricity} VND/kg')
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Giá Nước:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text('${widget.item.price.water} VND/M3')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class DescriptionDetail extends StatelessWidget {
  final String title;
  final String subtitle;
  final String total;
  final IconData icon;
  const DescriptionDetail(
      {Key key, this.title, this.subtitle, this.total, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: title == 'Acreage'
          ? Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/area.png'),
                  fit: BoxFit.cover,
                ),
              ))
          : Icon(
              icon,
              size: 30,
              color: Color(0xFF000000),
            ),
      title: Text('${title.toUpperCase()}: ${total}'),
      subtitle: Text(subtitle),
    );
  }
}
