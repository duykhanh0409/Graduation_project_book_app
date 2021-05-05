import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project_book_app/screens/fliter/fliter_screen.dart';
import 'package:graduation_project_book_app/screens/host/create_new_room.dart';
import 'package:graduation_project_book_app/screens/host/host_room_listing.dart';
import 'package:graduation_project_book_app/screens/host/host_screen.dart';
import 'package:graduation_project_book_app/screens/host/widget/room_type.dart';
import 'package:graduation_project_book_app/screens/navigation_screen.dart';
import 'package:graduation_project_book_app/screens/search/search_screen.dart';
import 'package:graduation_project_book_app/screens/signIn/signin.dart';
import 'package:graduation_project_book_app/screens/signUp/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          appBarTheme: Theme.of(context)
              .appBarTheme
              .copyWith(brightness: Brightness.light)),
      //home: NavigationScreen());
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => NavigationScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/host': (BuildContext context) => HostScreen(),
        '/hostRoomListing': (BuildContext context) => HostRoomListing(),
        '/createNewRoom': (BuildContext context) => CreateNewRoom(),
        '/roomType': (BuildContext context) => RoomType(),
        '/fliterScreen': (BuildContext context) => FliterScreen(),
        'signUp':(BuildContext context)=>SignUpScreen()
      },
    );
  }
}

class Criterias extends StatefulWidget {
  CriteriaState createState() => new CriteriaState();
}

class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Icon iconpic;
  NewItem(this.isExpanded, this.header, this.body, this.iconpic);
}

double discretevalue = 2.0;
double hospitaldiscretevalue = 25.0;

class CriteriaState extends State<Criterias> {
  List<NewItem> items = <NewItem>[
    new NewItem(
        false,
        'Schools',
        new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new Column(children: <Widget>[
              //put the children here
            ])),
        new Icon(Icons.add)),
    //give all your items here
  ];

  ListView List_Criteria;
  Widget build(BuildContext context) {
    List_Criteria = new ListView(
      children: [
        new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                items[index].isExpanded = !items[index].isExpanded;
              });
            },
            children: items.map((NewItem item) {
              return new ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return new ListTile(
                      leading: item.iconpic,
                      title: new Text(
                        item.header,
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ));
                },
                isExpanded: item.isExpanded,
                body: item.body,
              );
            }).toList(),
          ),
        )
      ],
    );

    Scaffold scaffold = new Scaffold(
      appBar: new AppBar(
        title: new Text("Criteria Selection"),
      ),
      body: List_Criteria,
      persistentFooterButtons: <Widget>[
        new ButtonBar(children: <Widget>[
          new FlatButton(
            color: Colors.blue,
            onPressed: null,
            child: new Text(
              'Apply',
              textAlign: TextAlign.left,
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ])
      ],
    );
    return scaffold;
  }
}
