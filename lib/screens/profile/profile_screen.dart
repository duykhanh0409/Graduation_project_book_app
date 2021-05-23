import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_book_app/bloc/searchBloc/search_bloc.dart';
import 'package:graduation_project_book_app/bloc/searchBloc/search_state.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';

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
    print(techMobile?.test);
    // print(techMobile?.vdpList[0]?.type);
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
                              image: AssetImage(
                                'assets/images/host.jpg',
                              ),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Duy',
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
                    ),
                    ProfileInfor(
                      infor: 'Lists your book',
                      icon: Icons.list_alt_outlined,
                    ),
                    ProfileInfor(
                      infor: 'Notifications',
                      icon: Icons.notifications_active_outlined,
                    ),
                    ProfileInfor(
                      infor: 'Learn about user',
                      icon: Icons.home_outlined,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('ABOUT HOST',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20)),
                    ProfileInfor(
                        infor: 'Host Schedule', icon: Icons.list_alt_outlined),
                    SizedBox(
                      height: 5,
                    ),
                    Text('LEGAL',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20)),
                    ProfileInfor(
                        infor: 'Terms of Service',
                        icon: Icons.list_alt_outlined),
                    ProfileInfor(
                      infor: 'Log out',
                      icon: null,
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
  const ProfileInfor({
    Key key,
    this.infor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        print('khanh');
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
