import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF012169),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              Text('Rental'),
              Image.asset(
              "assets/images/logo.png",
              height: 60,
              width: 60,
              fit: BoxFit.cover
              )
            ],
          )),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.account_circle,
                size: 28,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
