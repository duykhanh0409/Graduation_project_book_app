import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VdpImageCarousel extends StatefulWidget {
  const VdpImageCarousel({
    Key key,
  }) : super(key: key);

  @override
  _VdpImageCarouselState createState() => _VdpImageCarouselState();
}

class _VdpImageCarouselState extends State<VdpImageCarousel> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;
    int _current = 0;
    List img = [
      'assets/images/item1.jpg',
      'assets/images/item1.jpg',
      'assets/images/item1.jpg'
    ];
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: height,
            viewportFraction: 1,
            onPageChanged: (index, CarouselPageChangedReason reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: img.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/item1.jpg'),
                            fit: BoxFit.cover)));
              },
            );
          }).toList(),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: map<Widget>(
        //     img,
        //     (index, url) {
        //       return Container(
        //         width: 8.0,
        //         height: 8.0,
        //         margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        //         decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //             color: _current == index
        //                 ? Color.fromRGBO(0, 0, 0, 0.9)
        //                 : Color.fromRGBO(0, 0, 0, 0.4)),
        //       );
        //     },
        //   ),
        // ),
        Positioned(
          top: 70,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
