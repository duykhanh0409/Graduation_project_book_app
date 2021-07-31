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
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor:Colors.blueGrey,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Description Price Room",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              PriceFiled(
                priceField: "Price Room",
                controler: priceRoomController,
                description: 'Giá phòng (Tháng/VNĐ)',
              ),
              PriceFiled(
                  priceField: "electricity",
                  controler: eletricController,
                  description: 'Giá điện (Tháng/VNĐ)'),
              PriceFiled(
                  priceField: "Water",
                  controler: waterController,
                  description: 'Giá nước (Tháng/VNĐ)'),
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

class PriceFiled extends StatelessWidget {
  final String priceField;
  final String description;
  final TextEditingController controler;
  const PriceFiled({Key key, this.priceField, this.controler, this.description})
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
          Text(description),
          Container(
              height: 50,
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: controler,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: priceField,
                ),
              ))
        ],
      ),
    );
  }
}
