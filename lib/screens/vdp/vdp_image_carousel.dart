import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/api.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/models/vdp.dart';
import 'package:graduation_project_book_app/styles/colors.dart';

class VdpImageCarousel extends StatefulWidget {
  final VdpItem item;
  const VdpImageCarousel({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  _VdpImageCarouselState createState() => _VdpImageCarouselState();
}

class _VdpImageCarouselState extends State<VdpImageCarousel> {
  int _current = 0;
  bool isColorSave = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;
    var imageItem = widget.item.image.url;
    var techMobile = TechMobile.of(context);
    print(techMobile?.listSaveUser?.length);
    var check = techMobile.listSaveUser.length != 0
        ? techMobile.listSaveUser.where((e) {
            print(e.id);
            return e.id.contains(widget.item.id);
          }).toList()
        : [];
    print("${check.length} tra ve cai gì");
    if (check.length > 0) {
      setState(() {
        isColorSave = true;
      });
    }
    print(isColorSave);
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
          items: imageItem.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(i),
                        fit: BoxFit.cover,
                      ),
                    ));
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
              for (var index = 0; index < imageItem.length; index++)
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
                  onTap: () => Navigator.of(context).pop(),
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
                GestureDetector(
                  onTap: () {
                    if (isColorSave == false) {
                      // fliter thằng item tap vô có nằm trong list
                      print('chọn save');
                      Api.postListSave(
                          'FIlLcwZvGN010VsFBTBz', "${widget.item.id}");
                      setState(() {
                        isColorSave = true; // cái biến is này phải xử lý nòg
                      });
                    }
                    // if (isColorSave == true) {
                    //   print('click cho het do');
                    //   setState(() {
                    //     isColorSave = false;
                    //   });
                    // }
                    // if (isColorSave = true) {
                    //   print('remove save');
                    //   Api.removeListSave(
                    //       'FIlLcwZvGN010VsFBTBz', "${widget.item.id}");
                    //   setState(() {
                    //     isColorSave = false;
                    //   });
                    // }
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: isColorSave ? Colors.red : Colors.black,
                    ),
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
//tab vô có id product này, có thông tin user, tab dô trái tim post lên, Nhưng vẫn phải có biến true false rồi
//if(ele=> ele.id.contans(id){ isSave=true})
//isSave=true thì trái tim đỏ
// tab dô trái tim, isSave chuyển thành true và gọi hàm post , oke

//issave =false
//lúc đầu isSave== false gọi hàm post
//isSave==true gọi hàm remove
