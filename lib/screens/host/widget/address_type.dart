import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressType extends StatefulWidget {
  @override
  _AddressTypeState createState() => _AddressTypeState();
}

class _AddressTypeState extends State<AddressType> {
  TextEditingController streetController = new TextEditingController();
  TextEditingController wardController = new TextEditingController();
  TextEditingController districtController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  void fillInforLocation(){
    if(streetController.text!=""){
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlatButton.icon(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back),
                  label: Text('')),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 10),
                child: Text(
                  "Where's your place located?",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
              Text(
                  "Only confirmed guests will get your exact address after they book. We'll show everyone else an approximate location"),
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
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Continues',
        child: Icon(Icons.arrow_right_alt_sharp,size: 30,),
      ), //
    );
  }
}

class AddressField extends StatelessWidget {
  final String addressField;
  final TextEditingController controler;
  const AddressField({
    Key key,
    this.addressField,this.controler
  }) : super(key: key);

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
            
            addressField,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
          ),
          Container(
              height: 30,
              child: TextField(
                controller:controler ,
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
