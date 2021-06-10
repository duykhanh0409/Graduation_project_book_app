import 'package:email_auth/email_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/screens/host/create_new_room.dart';

class VerifyHost extends StatefulWidget {
  const VerifyHost({Key key}) : super(key: key);

  @override
  _VerifyHostState createState() => _VerifyHostState();
}

class _VerifyHostState extends State<VerifyHost> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();
  void sendOtp() async {
    EmailAuth.sessionName = "Company Name";
    bool result =
        await EmailAuth.sendOtp(receiverMail: _emailcontroller.value.text);
    if (result) {
      print('sent succed');
    }
  }

  void verify() {
    var res = EmailAuth.validate(
        receiverMail: _emailcontroller.value.text,
        userOTP: _otpcontroller.value.text);
    if (res) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CreateNewRoom();
      }));
    } else {
      print('invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Verify Host',
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
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
                  decoration:
                      InputDecoration(hintText: 'Enter OTP', labelText: 'OTP')),
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
      ),
    );
  }
}
