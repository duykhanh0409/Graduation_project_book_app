import 'package:email_auth/email_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/screens/host/create_new_room.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyHost extends StatefulWidget {
  const VerifyHost({Key key}) : super(key: key);

  @override
  _VerifyHostState createState() => _VerifyHostState();
}

class _VerifyHostState extends State<VerifyHost> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  void sendOtp() async {
    EmailAuth.sessionName = "Company Name";
    bool result =
        await EmailAuth.sendOtp(receiverMail: _emailcontroller.value.text);
    if (result) {
      print('sent succed');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var techMobile = TechMobile.of(context);
      techMobile?.user?.email != null
          ? _emailcontroller.text = techMobile?.user?.email
          : _emailcontroller.text = '';
    });
  }

  void verify() {
    var techMobile = TechMobile.of(context);
    if (_phonecontroller.text != null) {
      techMobile.phoneHost = _phonecontroller.text;
    }
    if (_emailcontroller.text != null) {
      techMobile.emailHost = _emailcontroller.text;
    }
    var res = EmailAuth.validate(
        receiverMail: _emailcontroller.value.text,
        userOTP: _otpcontroller.value.text);

    if (res) {
      techMobile.verifyHost = true;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CreateNewRoom();
      }));
    } else {
      final snackBar = SnackBar(
          padding: EdgeInsets.all(10),
          content: Text(
            "OTP invalid",
            style: TextStyle(color: Colors.red, fontSize: 15),
          ),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    var techMobile = TechMobile.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 120,
              color: Colors.blueGrey,
              alignment: Alignment.center,
              child: Text(
                "Verify Host Information",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 130, 20, 0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/splash_bg.png',
                    height: 200,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  techMobile?.user?.phoneNumber != null
                      ? Container()
                      : TextField(
                          controller: _phonecontroller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'Phone Number', labelText: 'Phone')),
                  TextField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Enter email',
                        labelText: 'Email',
                        suffixIcon: TextButton(
                          child: Text("Send OTP"),
                          onPressed: () {
                            sendOtp();
                          },
                        )),
                  ),
                  TextField(
                      controller: _otpcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Enter OTP', labelText: 'OTP')),
                  SizedBox(
                    height: 30,
                  ),
                  FlatButton(
                    onPressed: () {
                      verify();
                    },
                    child: Text('Verify OTP'),
                    color: Colors.orange[900],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
