import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/screens/host/create_new_room.dart';

class AddressType extends StatefulWidget {
  @override
  _AddressTypeState createState() => _AddressTypeState();
}

class _AddressTypeState extends State<AddressType> {
  TextEditingController streetController = new TextEditingController();
  TextEditingController wardController = new TextEditingController();
  TextEditingController districtController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    cityController.text = 'Hồ Chí Mính';
    super.initState();
  }

  void fillInforLocation(BuildContext context) {
    var techMobile = TechMobile.of(context);
    if (streetController.text != "") {
      techMobile.address = streetController.text;
    }
    if (wardController.text != "") {
      techMobile.ward = wardController.text;
    }
    if (districtController.text != "") {
      techMobile.district = districtController.text;
    }
    if (cityController.text != "") {
      techMobile.city = cityController.text;
    }
    if (streetController.text != "" &&
        wardController.text != "" &&
        districtController.text != "" &&
        cityController.text != "") {
      techMobile.isShowAddress = true;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CreateNewRoom();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      "Where's your place located?",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Only confirmed guests will get your exact address after they book. We'll show everyone else an approximate location",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AddressField(
                controler: streetController,
                addressField: 'Street',
              ),
              AddressField(
                controler: wardController,
                addressField: 'Ward',
              ),
              AddressField(
                controler: districtController,
                addressField: 'District',
              ),
              AddressField(
                controler: cityController,
                addressField: 'City',
              )
            ],
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fillInforLocation(context);
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

class AddressField extends StatelessWidget {
  final String addressField;
  final TextEditingController controler;
  const AddressField({Key key, this.addressField, this.controler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Colors.grey.withOpacity(0.1)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            addressField,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
          ),
          Container(
              height: 30,
              child: TextField(
                controller: controler,
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
