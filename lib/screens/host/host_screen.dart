import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';

class HostScreen extends StatefulWidget {
  @override
  _HostScreenState createState() => _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height * 0.1;
    var widthButton = MediaQuery.of(context).size.width * 0.75;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.36,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/host.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Welcome what's next",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Enjoy the flexibility of being your own boss, earn extra income, and make lifelong connections through hosting',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(fontWeight: FontWeight.normal, fontSize: 16),
                  ))
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
                height: height,
                width: width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: 1, color: Colors.grey.withOpacity(0.4)))),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  child: ElevatedButton(
                      child: Text('Get Started',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2)),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.pink),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      side: BorderSide(color: Colors.red)))),
                      onPressed: () {
                        var techMobile = TechMobile.of(context);
                        techMobile.filterHostRoom();
                        Navigator.of(context).pushNamed('/hostRoomListing');
                      }),
                )),
          )
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text('Flat Button'),
      ),
    );
  }
}
