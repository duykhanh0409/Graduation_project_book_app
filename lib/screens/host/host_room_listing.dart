import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';

class HostRoomListing extends StatefulWidget {
  @override
  _HostRoomListingState createState() => _HostRoomListingState();
}

class _HostRoomListingState extends State<HostRoomListing> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      //statusBarBrightness: Brightness.dark,
    ));
    var listHostRoom = TechMobile.of(context)?.listHostRoom;
    print("${listHostRoom?.length} list phong cua host");
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              'How would you like to start?',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.grey.withOpacity(0.4))),
              child: FlatButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/createNewRoom');
                  },
                  icon: Icon(Icons.add),
                  label: Text('Create')),
            ),
            Container(
                height: MediaQuery.of(context).size.height - 250,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.zero,
                color: Colors.red,
                child: ListView.builder(
                  itemCount: listHostRoom?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 120,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 0.7,
                            blurRadius: 1,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                '${listHostRoom[index]?.address?.addressNumber},${listHostRoom[index]?.address?.ward},district ${listHostRoom[index]?.address?.district},${listHostRoom[index]?.address?.city}',
                                softWrap: true,
                                maxLines: 3,
                              ),
                            ),
                          ),
                          Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      listHostRoom[index].image.url[0]),
                                  fit: BoxFit.cover,
                                ),
                              ))
                        ],
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
