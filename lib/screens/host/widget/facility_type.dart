import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: [
            Text('What facility will you offer?'),
            Text(
                "You'll be able to add more amenities after you publish your listing"),
            Text('Facilitys'),
            CheckboxListTile(
              title: const Text('Wifi'),
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
            ),
            FacilityField(
              facilityField: "Gac",
              controler: gacController,
            ),
            FacilityField(
              facilityField: "Bath Room",
              controler: bathController,
            ),
            FacilityField(
              facilityField: "bedRoom",
              controler: bedController,
            )
          ],
        ),
      )),
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
  final TextEditingController controler;
  const FacilityField({Key key, this.facilityField, this.controler})
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
          Text(
            facilityField,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
          ),
          Container(
              height: 30,
              child: TextField(
                controller: controler,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
