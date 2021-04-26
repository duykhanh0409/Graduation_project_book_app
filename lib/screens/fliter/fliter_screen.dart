import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FliterScreen extends StatefulWidget {
  @override
  _FliterScreenState createState() => _FliterScreenState();
}

class _FliterScreenState extends State<FliterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Icon(Icons.close),
            SizedBox(height: 30,),
            Text('Popular filter',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text('These are some of the filters looking accommodation in Ho Chi Minh city use most often',style: TextStyle(fontSize: 18),),
            SizedBox(height:20 ,)
            ],
        ),
      ),
    ));
  }
}
