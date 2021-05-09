import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveAnywhere extends StatelessWidget {
  const LiveAnywhere({
    Key key,
    @required this.listImage,
    @required this.listTitle,
  }) : super(key: key);

  final List<String> listImage;
  final List<String> listTitle;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 20, bottom: 20),
          child: Text('Live anywhere',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF012169)))),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        padding: EdgeInsets.only(left: 20,bottom: 10),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listImage.length,
            itemBuilder: (context, index) {
              return FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  print('khanh');
                },
                child: Container(
                  padding: EdgeInsets.only(
                    right: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          listImage[index],
                          height: 250,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            '${listTitle[index]}',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ))
                    ],
                  ),
                ),
              );
            }),
      ),
    ]);
  }
}
