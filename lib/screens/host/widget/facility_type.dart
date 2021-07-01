import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/screens/host/create_new_room.dart';

class FacilityType extends StatefulWidget {
  @override
  _FacilityTypeState createState() => _FacilityTypeState();
}

class _FacilityTypeState extends State<FacilityType> {
  TextEditingController gacController = new TextEditingController();
  TextEditingController squareController = new TextEditingController();
  TextEditingController bathController = new TextEditingController();
  TextEditingController bedController = new TextEditingController();
  bool ischeckWifi = false;

  void fillFacility() {
    var techMobile = TechMobile.of(context);
    if (gacController.text != "") {
      techMobile.gac = gacController.text;
    }
    if (squareController.text != "") {
      techMobile.square = squareController.text;
    }
    if (bathController.text != "") {
      techMobile.bathRoom = bathController.text;
    }
    if (bedController.text != "") {
      techMobile.bedRoom = bedController.text;
    }
    if (ischeckWifi = true) {
      techMobile.wifi = '1';
    }
    if (ischeckWifi = false) {
      techMobile.wifi = '0';
    }
    if (gacController.text != "" &&
        squareController.text != "" &&
        bathController.text != "" &&
        bedController.text != "" &&
        ischeckWifi != null) {
      techMobile.isShowFacility = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      //s
      //tatusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    color: Colors.blueGrey,
                    alignment: Alignment.center,
                    child: Text(
                      "What facility will you offer",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Facilitys',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Wifi',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: ischeckWifi,
                        onChanged: (bool value) {
                          setState(() {
                            ischeckWifi = value;
                          });
                        },
                      ),
                      FacilityField(
                        facilityField: "Square",
                        controler: squareController,
                        description: 'Diện tích phòng',
                        example: '(example: 25 m2)',
                      ),
                      FacilityField(
                        facilityField: "Gac",
                        controler: gacController,
                        description: 'Số lượng gác (Nếu có)',
                        example: '(example: 1)',
                      ),
                      FacilityField(
                        facilityField: "Bath Room",
                        controler: bathController,
                        description: 'Số lượng phòng tắm (Nếu có)',
                        example: '(example: 1)',
                      ),
                      FacilityField(
                        facilityField: "bedRoom",
                        controler: bedController,
                        description: 'Số lượng phòng ngủ (Nếu có)',
                        example: '(example: 1)',
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fillFacility();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateNewRoom();
          }));
        },
        tooltip: 'Continues',
        child: Icon(
          Icons.arrow_right_alt_sharp,
          size: 30,
        ),
      ), //
    );
  }
}

class FacilityField extends StatelessWidget {
  final String facilityField;
  final String description;
  final String example;
  final TextEditingController controler;
  const FacilityField(
      {Key key,
      this.facilityField,
      this.controler,
      this.description,
      this.example})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Colors.grey.withOpacity(0.1)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${description} ${example}"),
          Container(
              height: 50,
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: controler,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: facilityField,
                ),
              ))
        ],
      ),
    );
  }
}
