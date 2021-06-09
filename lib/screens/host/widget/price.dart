import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/screens/host/create_new_room.dart';

class PriceRoom extends StatefulWidget {
  @override
  _PriceRoomState createState() => _PriceRoomState();
}

class _PriceRoomState extends State<PriceRoom> {
  TextEditingController priceRoomController = new TextEditingController();
  TextEditingController eletricController = new TextEditingController();
  TextEditingController waterController = new TextEditingController();
  void fillFacility() {
    var techMobile = TechMobile.of(context);
    if (priceRoomController.text != "") {
      techMobile.priceRoom = priceRoomController.text;
    }
    if (eletricController.text != "") {
      techMobile.priceElec = eletricController.text;
    }
    if (waterController.text != "") {
      techMobile.priceWater = waterController.text;
    }

    if (priceRoomController.text != "" &&
        eletricController.text != "" &&
        waterController.text != "") {
      techMobile.isShowPrice = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Text(
                'Description Price Room',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              PriceFiled(
                priceField: "Price Room",
                controler: priceRoomController,
              ),
              PriceFiled(
                priceField: "electricity",
                controler: eletricController,
              ),
              PriceFiled(
                priceField: "Water",
                controler: waterController,
              ),
            ],
          ),
        ),
      ),

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

class PriceFiled extends StatelessWidget {
  final String priceField;
  final TextEditingController controler;
  const PriceFiled({Key key, this.priceField, this.controler})
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
            priceField,
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
