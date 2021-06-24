import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp/flutter_otp.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();
  FlutterOtp otp = FlutterOtp();
  String result;
  int enteredOtp;

  @override
  Widget build(BuildContext context) {
    bool yesOrNo;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text('Get New Password'),
              TextField(
                controller: _phonecontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Enter email',
                    labelText: 'number Phone',
                    suffixIcon: TextButton(
                      child: Text("Send OTP"),
                      onPressed: () {
                        otp.sendOtp(_phonecontroller.text);
                      },
                    )),
              ),
              TextField(
                  controller: _otpcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      InputDecoration(hintText: 'Enter OTP', labelText: 'OTP')),
              FlatButton(
                onPressed: () {
                  setState(() {
                    yesOrNo = otp.resultChecker(enteredOtp);
                  });
                },
                child: Text('Verify OTP'),
                color: Colors.orange[900],
              )
            ],
          ),
        ),
      ),
    );
  }
}
