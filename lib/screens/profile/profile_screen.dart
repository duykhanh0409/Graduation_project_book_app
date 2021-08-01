import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/screens/signIn/signin.dart';
import 'package:graduation_project_book_app/widgets/SettingPage.dart';
import 'package:graduation_project_book_app/widgets/appbar_normal.dart';
import 'package:graduation_project_book_app/widgets/contactPage.dart';
import 'package:graduation_project_book_app/widgets/personal_infor.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List listSupport = [
    {
      'icon': Icons.star_outline_rounded,
      'title': 'Đánh giá Dịch vụ',
      'screen': SettingPage()
    },
    {
      'icon': Icons.chat_bubble_outline,
      'title': 'Liên hệ và góp ý',
      'screen': ContactAndComment()
    },
  ];
  List listAccount = [
    {
      'icon': Icons.person_outline_rounded,
      'title': 'Thông tin cá nhân',
      'screen': PersonalInfor()
    },
    {
      'icon': Icons.sanitizer,
      'title': 'Địa chỉ đã lưu',
      'screen': SettingPage()
    },
    {
      'icon': Icons.settings_outlined,
      'title': 'Cài đặt',
      'screen': SettingPage()
    },
    {
      'icon': Icons.single_bed_outlined,
      'title': 'Đăng nhập',
      'screen': LoginScreen()
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var techMobile = TechMobile.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.3))),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.only(left: 0, right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(techMobile?.user?.avatar),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(techMobile?.user?.username,
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(size.width * 0.03),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //service(size, context),
                    support(context, size, listSupport),
                    account(context, size, listAccount)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget support(BuildContext context, Size size, List list) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: size.width * 0.03),
      textTile('Hỗ trợ'),
      SizedBox(
        height: 5,
      ),
      item(context, size, list)
    ],
  );
}

Widget account(BuildContext context, Size size, List list) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: size.width * 0.03),
      textTile('Tài khoản'),
      SizedBox(
        height: 5,
      ),
      item(context, size, list)
    ],
  );
}

Widget item(BuildContext context, Size size, List list) {
  return Card(
    child: Container(
      child: Column(
          children: List.generate(
              list.length,
              (index) => InkWell(
                    onTap: () {
                      index == 3
                          ? Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => list[index]['screen']),
                            )
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => list[index]['screen']),
                            );
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        size.width * 0.05,
                        size.width * 0.03,
                        size.width * 0.05,
                      ),
                      margin: EdgeInsets.only(left: size.width * 0.03),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey,
                                  width: index != list.length - 1 ? 0.2 : 0))),
                      child: Row(
                        children: [
                          Icon(
                            list[index]['icon'],
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Expanded(child: Text(list[index]['title'])),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                  ))),
    ),
  );
}

Widget card(String title, Icon icon, Size size, VoidCallback function) {
  return Expanded(
    child: Card(
      child: InkWell(
        splashColor: Colors.white,
        focusColor: Colors.white,
        hoverColor: Colors.white,
        highlightColor: Colors.white,
        onTap: function,
        child: Container(
            padding: EdgeInsets.all(size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon,
                SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                )
              ],
            )),
      ),
    ),
  );
}

Widget textTile(String title) {
  return Text(
    title,
    style: TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
  );
}
