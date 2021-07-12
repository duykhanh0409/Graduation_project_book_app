import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_book_app/bloc/searchBloc/search_bloc.dart';
import 'package:graduation_project_book_app/bloc/searchBloc/search_state.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/models/user.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TechMobileState techMobilea;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // var techMobile = TechMobile.of(context);
    // techMobile.getData();
    //techMobilea = TechMobile.of(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 3), () {
      getData(context);
    });
  }

  void getData(BuildContext context) {
    var techMobile = TechMobile.of(context);
    techMobile.getData();
  }

  @override
  Widget build(BuildContext context) {
    var techMobile = TechMobile.of(context);
    var validInfor = "chưa có thông tin ";
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image.asset('assets/images/host.jpg')
                    Container(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.only(left: 20, right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(techMobile?.user?.avatar),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(techMobile?.user?.username,
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(
                          height: 8,
                        ),
                        Text('View profile',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(color: Colors.lightGreen))
                      ],
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1, color: Colors.grey.withOpacity(0.4)),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ACCOUNT SETTINGS',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20)),
                    SizedBox(
                      height: 3,
                    ),
                    ProfileInfor(
                      infor: 'Personal information',
                      icon: Icons.person_outline,
                      onTab: (context) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Container(
                                  constraints: BoxConstraints(maxHeight: 250),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'userName: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    '${techMobile?.user?.username ?? validInfor}',
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Password: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    '${techMobile?.user?.password ?? validInfor}',
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Số điện thoại: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    '${techMobile?.user?.phoneNumber ?? validInfor}',
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Email: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    '${techMobile?.user?.email ?? validInfor}',
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                    ProfileInfor(
                      infor: 'Lists your book',
                      icon: Icons.list_alt_outlined,
                      onTab: (context) {},
                    ),

                    ProfileInfor(
                      infor: 'Learn about user',
                      icon: Icons.home_outlined,
                      onTab: (context) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Text('ABOUT HOST',
                    //     style: Theme.of(context).textTheme.headline6.copyWith(
                    //         color: Colors.black.withOpacity(0.8),
                    //         fontSize: 20)),
                    // ProfileInfor(
                    //     infor: 'Host Schedule', icon: Icons.list_alt_outlined),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    Text('LEGAL',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20)),
                    ProfileInfor(
                      infor: 'App Information',
                      icon: Icons.notifications_active_outlined,
                      onTab: (context) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Container(
                                  constraints: BoxConstraints(maxHeight: 250),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Version 1.0'),
                                        Text('Author : Nguyễn Ngọc Duy Khánh')
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                    ProfileInfor(
                      infor: 'Terms of Service',
                      icon: Icons.list_alt_outlined,
                      onTab: (context) {
                        print('khanh');
                      },
                    ),
                    FlatButton(
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Are you sure want to logout?'),
                          //content: const Text('AlertDialog description'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('CANCEL'),
                            ),
                            TextButton(
                              onPressed: () {
                                techMobile.user = User(
                                    username: null,
                                    password: null,
                                    avatar: null,
                                    favouriteList: null,
                                    email: null,
                                    id: null,
                                    phoneNumber: null);
                                Navigator.of(context).pushNamed('/login');
                              },
                              child: const Text(
                                'LOG OUT',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Log Out',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                      //fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      fontSize: 19),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInfor extends StatelessWidget {
  final String infor;
  final IconData icon;
  final Function onTab;
  const ProfileInfor({
    Key key,
    this.infor,
    this.icon,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        onTab(context);
      },
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              infor,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  //fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 19),
            ),
            Icon(
              icon,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
