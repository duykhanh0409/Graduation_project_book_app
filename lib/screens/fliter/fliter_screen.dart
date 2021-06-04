import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';

class FliterScreen extends StatefulWidget {
  @override
  _FliterScreenState createState() => _FliterScreenState();
}

enum SingingCharacter { priceOption1, priceOption2, priceOption3 }

class _FliterScreenState extends State<FliterScreen> {
  //fliter ở đây
  var selectedPriceValue;

  void filterOptions(BuildContext context) {
    print('goi ham');
    var techMobile = TechMobile.of(context);
    // ignore: unused_local_variable
    var newList = techMobile?.listRoomFilterLocation;
    if (selectedPriceValue == 1) {
      newList = techMobile.vdpList
          .where(
              (element) => element.type.toUpperCase().contains("ENTIRE HOME"))
          .toList();
    }
    if (selectedPriceValue == 2) {
      newList = techMobile.vdpList
          .where((element) => element.type.toUpperCase().contains("ROOM"))
          .toList();
    }
    if (selectedPriceValue == 3) {
      newList = techMobile.vdpList
          .where((element) => int.parse(element.price.room) > 1000000)
          .toList();
    }
    if (selectedPriceValue == 4) {
      newList = techMobile.vdpList
          .where((element) => int.parse(element.price.room) > 2000000)
          .toList();
    }
    if (selectedPriceValue == 5) {
      newList = techMobile.vdpList
          .where((element) => int.parse(element.price.room) > 2000000)
          .toList();
    }
    return techMobile.setSelectedPrice(newList);
  }

  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      //statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
        // extendBodyBehindAppBar: true,
        // extendBody: true,
        body: SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Popular filter',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'These are some of the filters looking accommodation in Ho Chi Minh city use most often',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RadioListTile(
                    value: 1,
                    groupValue: selectedPriceValue,
                    title: Text('Entire Home'),
                    onChanged: (val) {
                      setState(() {
                        selectedPriceValue = 1;
                      });
                    },
                    activeColor: Colors.grey,
                    selected: false,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  RadioListTile(
                    value: 2,
                    groupValue: selectedPriceValue,
                    title: Text('Room'),
                    onChanged: (val) {
                      setState(() {
                        selectedPriceValue = 2;
                      });
                    },
                    activeColor: Colors.grey,
                    selected: false,
                  ),
                  Text('Prices',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.3),
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Prices',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  RadioListTile(
                    value: 3,
                    groupValue: selectedPriceValue,
                    title: Text('> 1.000.000 VND'),
                    onChanged: (val) {
                      setState(() {
                        selectedPriceValue = 3;
                      });
                    },
                    activeColor: Colors.grey,
                    selected: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RadioListTile(
                    value: 4,
                    groupValue: selectedPriceValue,
                    title: Text('> 2.000.000 VND'),
                    onChanged: (val) {
                      setState(() {
                        selectedPriceValue = 4;
                      });
                    },
                    activeColor: Colors.grey,
                    selected: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RadioListTile(
                    value: 5,
                    groupValue: selectedPriceValue,
                    title: Text('> 3.000.000 VND'),
                    onChanged: (val) {
                      setState(() {
                        selectedPriceValue = 5;
                      });
                    },
                    activeColor: Colors.grey,
                    selected: false,
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: .1,
                    blurRadius: 2,
                    offset: Offset(0, -1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Clear all'),
                  Container(
                    width: 180,
                    child: ElevatedButton(
                        child: Text("Fliter".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    side: BorderSide(color: Colors.red)))),
                        onPressed: () {
                          filterOptions(context);
                          Navigator.pop(context);
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class FliterFacility extends StatelessWidget {
  final String title;
  const FliterFacility({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                  onPressed: () {},
                  //color: Colors.white,
                  textColor: Colors.black,
                  child:
                      Container(alignment: Alignment.center, child: Text('-')),
                  padding: EdgeInsets.all(6),
                  shape: CircleBorder(
                      side: BorderSide(width: 1, color: Colors.grey))),
              Text('0'),
              MaterialButton(
                  onPressed: () {},
                  //color: Colors.white,
                  textColor: Colors.black,
                  child:
                      Container(alignment: Alignment.center, child: Text('+')),
                  padding: EdgeInsets.all(6),
                  shape: CircleBorder(
                      side: BorderSide(width: 1, color: Colors.grey))),
            ],
          ),
        )
      ],
    );
  }
}

class MyClass {
  String title;
  bool value;
  MyClass(this.title, this.value);
  @override
  String toString() {
    return 'MyClass{title: $title, value: $value}';
  }
}

// class DynamicallyCheckbox extends StatefulWidget {
//   final String subtitle;

//   const DynamicallyCheckbox({Key key, this.subtitle}) : super(key: key);
//   @override
//   DynamicallyCheckboxState createState() => new DynamicallyCheckboxState();
// }

// class DynamicallyCheckboxState extends State {
//   Map<String, bool> List = {
//     'Entire Room': false,
//     'Private Room': false,
//   };

//   var holder_1 = [];

//   getItems() {
//     List.forEach((key, value) {
//       if (value == true) {
//         holder_1.add(key);
//       }
//     });

//     print(holder_1);
//     holder_1.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var techMobile = TechMobile.of(context);
//     return Container(
//       height: 300,
//       child: ListView(
//         children: List.keys.map((String key) {
//           return new CheckboxListTile(
//             title: new Text(key),
//             value: List[key],
//             activeColor: Colors.deepPurple[400],
//             checkColor: Colors.white,
//             onChanged: (bool value) {
//               setState(() {
//                 List[key] = value;
//                 List.forEach((key, value) {
//                   if (value) {
//                     techMobile.onFilterEntireRoom(List[value]);
//                   }
//                 });
//               });
//             },
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

class FilterItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const FilterItem({
    Key key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title.toUpperCase()),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        Checkbox(value: false, onChanged: null)
      ],
    );
  }
}
