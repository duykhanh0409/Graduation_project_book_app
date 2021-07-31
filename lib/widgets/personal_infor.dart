import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';

import 'appbar_normal.dart';

class PersonalInfor extends StatefulWidget {
  @override
  _PersonalInforState createState() => _PersonalInforState();
}

class _PersonalInforState extends State<PersonalInfor> {
  bool isNotify = true;
  // List listSetting = [
  //   {'title': 'Tài khoản:', 'content': ''},
  //   {'title': 'Số điện thoại:', 'content': 'Chưa cập nhật'},
  //   {'title': 'Email:', 'content': 'Chưa cập nhật'},
  // ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var techMobile = TechMobile.of(context);
    List listSetting = [
      {'title': 'Tài khoản:', 'content': techMobile.user.username},
      {'title': 'Số điện thoại:', 'content': techMobile.user.phoneNumber??'Chưa cập nhật'},
      {'title': 'Email:', 'content': techMobile.user.email??'Chưa cập nhật'},
    ];
    return Scaffold(
        appBar: appbarNormal(context, 'Thông tin cá nhân'),
        body: Container(
          margin: EdgeInsets.all(size.width * 0.03),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Container(
                        width: size.width,
                        child: Column(
                          children: List.generate(
                            listSetting.length,
                            (index) => InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           listSetting[index]['screen']),
                                // );
                              },
                              child: Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  size.width * 0.05,
                                  size.width * 0.03,
                                  size.width * 0.05,
                                ),
                                margin:
                                    EdgeInsets.only(left: size.width * 0.03),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey,
                                            width:
                                                index != listSetting.length - 1
                                                    ? 0.2
                                                    : 0))),
                                child: Row(
                                  children: [
                                    // Icon(
                                    //   index == 0
                                    //       ? isNotify
                                    //           ? listSetting[index]['title']
                                    //           : Icons.notifications_off_outlined
                                    //       : listSetting[index]['title'],
                                    //   color: Colors.black,
                                    //   size: 20,
                                    // ),
                                    Text(listSetting[index]['title']),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Expanded(
                                        child: Text(
                                            listSetting[index]['content'])),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.black,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
