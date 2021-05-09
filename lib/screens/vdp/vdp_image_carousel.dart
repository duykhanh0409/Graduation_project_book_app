import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/styles/colors.dart';

class VdpImageCarousel extends StatefulWidget {
  const VdpImageCarousel({
    Key key,
  }) : super(key: key);

  @override
  _VdpImageCarouselState createState() => _VdpImageCarouselState();
}

class _VdpImageCarouselState extends State<VdpImageCarousel> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;

    List img = [
      'assets/images/item2.jpg',
      'assets/images/item1.jpg',
      'assets/images/item3.jpg'
    ];
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: height,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              // print(index);
              print(_current);
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
                            image: AssetImage(i), fit: BoxFit.cover)));
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var index = 0; index < img.length; index++)
                Container(
                  alignment: Alignment.center,
                  width: 10,
                  height: 10,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                  decoration: BoxDecoration(
                    color: _current == index ? Colors.white : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                )
            ],
          ),
        ), // this was the part the I had to add

        Positioned(
          top: 70,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/home'),
                  child: Container(
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
