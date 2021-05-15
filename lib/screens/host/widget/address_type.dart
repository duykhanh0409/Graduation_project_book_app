import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressType extends StatefulWidget {
  @override
  _AddressTypeState createState() => _AddressTypeState();
}

class _AddressTypeState extends State<AddressType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              addressField: 'Street',
            ),
            AddressField(
              addressField: 'Ward',
            ),
            AddressField(
              addressField: 'District',
            ),
            AddressField(
              addressField: 'City',
            )
          ],
        ),
      )),
    );
  }
}

class AddressField extends StatelessWidget {
  final String addressField;
  const AddressField({
    Key key,
    this.addressField,
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
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
