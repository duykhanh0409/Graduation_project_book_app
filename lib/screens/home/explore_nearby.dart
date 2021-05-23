import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/constants/near_location.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_Screen.dart';

class ExploreNearby extends StatelessWidget {
  const ExploreNearby({
    Key key,
    @required this.listimg,
  }) : super(key: key);

  final List<String> listimg;

  @override
  Widget build(BuildContext context) {
    List<String> widgetList = ['A', 'B', 'C', 'A', 'B', 'C', 'A', 'B', 'C'];
    final controller = ScrollController();

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 30,
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
        child: Text(
          'Explore nearby',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF012169)),
        ),
      ),
      Container(
          height: 230,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.55,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
            ),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: listimg.length,
            controller: controller,
            itemBuilder: (context, index) {
              return FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VdpScreens();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
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
              );
            },
          )),
    ]);
  }
}
