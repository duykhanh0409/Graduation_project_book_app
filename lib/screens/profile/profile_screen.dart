import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
              Divider(thickness: 1, color: Colors.grey.withOpacity(0.3)),
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
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.grey, fontSize: 18)),
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
                  ],
                ),
              )
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            infor,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w300, color: Colors.black),
          ),
          Icon(icon)
        ],
      ),
    );
  }
}
