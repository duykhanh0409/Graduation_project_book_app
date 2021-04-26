import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VdpDetail extends StatelessWidget {
  const VdpDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/khanh.jpg'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Verify Host',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            'khanh Host',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '1.500.000 VND',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text('Per month')
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(thickness: 1, color: Color(0xFFE4D9D9)),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  'Information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Text(
                'Housed in a three-storied semi-detached apartment our homestay is well managed and has been a leading  homestay choice for many local and.',
                textAlign: TextAlign.start,
                style: TextStyle(color: Color(0xFF6D4E4E)),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 100,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Color(0xFFE4D9D9), width: 1),
                      bottom: BorderSide(color: Color(0xFFE4D9D9), width: 1)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(right: 13),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            '8.9',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Very Good',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              '234 reviews',
                              style: TextStyle(color: Color(0xFF464E46)),
                            )
                          ],
                        )
                      ],
                    ),
                    Icon(Icons.navigate_next)
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Accommodation',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.fit_screen,
                        size: 40,
                        color: Color(0xFF012169),
                      ),
                      Text('70m')
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.bedtime_sharp,
                        size: 40,
                        color: Color(0xFF012169),
                      ),
                      Text('70m')
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.bathtub,
                        size: 40,
                        color: Color(0xFF012169),
                      ),
                      Text('70m')
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
