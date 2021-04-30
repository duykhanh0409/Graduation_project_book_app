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
          body: SingleChildScrollView(
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
                  FilterItem(
                    title: 'WIFI',
                    subtitle: '',
                  ),
                  FilterItem(
                    title: 'KITCHEN',
                    subtitle: '',
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Type of place',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  FilterItem(
                    title: 'Entire Place',
                    subtitle: 'Have a place to yourself',
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  FilterItem(
                    title: 'Private Room',
                    subtitle: 'Have your own room and share some common spaces',
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  FilterItem(
                    title: 'Shared Room',
                    subtitle: 'Stay in a shared space, like a common room',
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
                ],
              ),
            ),
          )),
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
