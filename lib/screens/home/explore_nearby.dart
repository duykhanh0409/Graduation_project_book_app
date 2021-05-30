import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project_book_app/constants/near_location.dart';
import 'package:graduation_project_book_app/screens/search/search_screen.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_Screen.dart';

class ExploreNearby extends StatelessWidget {
  const ExploreNearby({
    Key key,
    @required this.listimg,
  }) : super(key: key);

  final List<String> listimg;

  @override
  Widget build(BuildContext context) {
    List<String> widgetList = [
      'A',
      'B',
      'C',
      'A',
      'B',
      'C',
      'B',
      'C',
    ];
    List title = [
      {
        'title': 'Tăng Nhơn Phú A',
        'time': '1.5',
        'lat': '10.84582',
        'long': '106.79453'
      },
      {
        'title': 'Hiệp Phú',
        'time': '1.5',
        'lat': '10.846751',
        'long': '106.782023'
      },
      {
        'title': 'Linh Chiểu',
        'time': '1.5',
        'lat': '10.851934',
        'long': '106.766493'
      },
      {
        'title': 'Linh Đông',
        'time': '1.5',
        'lat': '10.851457',
        'long': '106.745018'
      },
      {
        'title': 'Thảo Điền',
        'time': '1.5',
        'lat': '10.804136',
        'long': '106.743508'
      },
      {
        'title': 'Long Thạnh Mỹ',
        'time': '1.5',
        'lat': '10.848265,',
        'long': ' 106.814921'
      },
      {
        'title': 'Linh Xuân',
        'time': '1.5',
        'lat': '10.873552,',
        'long': '106.769959'
      },
      {
        'title': 'Thủ Thiên',
        'time': '1.5',
        'lat': '10.768714',
        'long': '106.713654'
      },
    ];
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
              childAspectRatio: 0.50,
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
                    return SearchScreen(
                      searchLocation: LatLng(double.parse(title[index]['lat']),
                          double.parse(title[index]['long'])),
                    );
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title[index]['title'],
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.5),
                          ),
                          Text("${title[index]['time']} Hour drive")
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
