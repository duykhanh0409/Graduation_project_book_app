import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_Screen.dart';

class ExploreNearby extends StatelessWidget {
  const ExploreNearby({
    Key key,
    @required this.listimg,
  }) : super(key: key);

  final List<String> listimg;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 30,
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 15, 28),
        child: Text(
          'Explore nearby',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF012169)),
        ),
      ),
      Container(
          width: MediaQuery.of(context).size.width,
          height: 190,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.only(
                      right: 50,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return VdpScreens();
                              }));
                            },
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    listimg[index],
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Ho Chi Minh',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5),
                                      ),
                                      Text('1.5 hour drive')
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  listimg[index + 1],
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      'Ho Chi Minh',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5),
                                    ),
                                    Text('1.5 hour drive')
                                  ],
                                ),
                              )
                            ],
                          ),
                        ]));
              })),
    ]);
  }
}
