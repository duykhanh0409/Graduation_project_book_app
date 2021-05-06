import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FliterScreen extends StatefulWidget {
  @override
  _FliterScreenState createState() => _FliterScreenState();
}

class _FliterScreenState extends State<FliterScreen> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Icon(Icons.close),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Popular filter',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
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
                      DynamicallyCheckbox(),
                      SizedBox(
                        height: 7,
                      ),
                      Text('Prices',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      RangeSlider(
                        values: _currentRangeValues,
                        min: 0,
                        max: 100,
                        divisions: 5,
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString(),
                          _currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.withOpacity(0.3),
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Rooms and beds',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      FliterFacility(
                        title: 'Beds',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FliterFacility(
                        title: 'Bedrooms',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FliterFacility(
                        title: 'Bathrooms',
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
                      ElevatedButton(
                          child: Text("30+place".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      side: BorderSide(color: Colors.red)))),
                          onPressed: () => null)
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
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
        Row(
          children: [
            Container(
              height: 35,
              width: 35,
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey)),
              child: Text('-'),
            ),
            Text('0'),
            Container(
              height: 35,
              width: 35,
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey)),
              child: Text('+'),
            ),
          ],
        )
      ],
    );
  }
}

class DynamicallyCheckbox extends StatefulWidget {
  final String subtitle;

  const DynamicallyCheckbox({Key key, this.subtitle}) : super(key: key);
  @override
  DynamicallyCheckboxState createState() => new DynamicallyCheckboxState();
}

class DynamicallyCheckboxState extends State {
  Map<String, bool> List = {
    'Wifi': false,
    'Ketchen': false,
    'Entire Place': false,
    'Private Room': false,
    'Shared Room': false,
  };

  var holder_1 = [];

  getItems() {
    List.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });
    print(holder_1);
    holder_1.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        children: List.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
            value: List[key],
            activeColor: Colors.deepPurple[400],
            checkColor: Colors.white,
            onChanged: (bool value) {
              setState(() {
                List[key] = value;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}

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
