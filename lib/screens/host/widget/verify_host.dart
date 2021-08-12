import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/screens/host/create_new_room.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class VerifyHost extends StatefulWidget {
  const VerifyHost({Key key}) : super(key: key);

  @override
  _VerifyHostState createState() => _VerifyHostState();
}

class _VerifyHostState extends State<VerifyHost> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  bool showLoading = false;
  String verificationId;

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

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    var techMobile = TechMobile.of(context);
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential?.user != null) {
        techMobile.verifyHost = true;
        if (techMobile?.user?.email == null &&
            techMobile?.user?.phoneNumber == null) {
          techMobile.emailHost = _emailcontroller.text;
          techMobile.phoneHost = _phonecontroller.text;
        }
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreateNewRoom()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      // _scaffoldKey.currentState
      //     .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  getMobileFormWidget(context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Image.asset(
          'assets/images/holding-phone.png',
          height: 150,
        ),
        Container(
          width: size.width,
          height: 50,
          child: TextFormField(
              controller: _emailcontroller,
              cursorColor: Color(0xffE67805),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Color(0xffE67805), width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                hintStyle: TextStyle(color: Colors.grey),
                disabledBorder: InputBorder.none,
                hintText: 'Email',
                contentPadding: EdgeInsets.only(left: 10),
              )),
        ),
        Container(
          width: size.width,
          height: 50,
          child: TextFormField(
            cursorColor: Color(0xffE67805),
            controller: _phonecontroller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Color(0xffE67805), width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                hintStyle: TextStyle(color: Colors.grey),
                disabledBorder: InputBorder.none,
                hintText: 'Nhập số điện thoại',
                contentPadding: EdgeInsets.all(5),
                prefixIcon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icons/vietnam.png',
                        width: 15,
                        height: 15,
                        fit: BoxFit.cover,
                      ),
                      Text(' +84   '),
                      Container(
                        height: 20,
                        color: Colors.grey,
                        width: 1,
                      )
                    ],
                  ),
                )),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            setState(() {
              showLoading = true;
            });

            await _auth.verifyPhoneNumber(
              phoneNumber: "+84${_phonecontroller.text}",
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
                //signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed) async {
                setState(() {
                  showLoading = false;
                });
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
          child: Text("SEND"),
          color: Colors.orange[900],
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Image.asset(
          'assets/images/holding-phone.png',
          height: 150,
        ),
        Container(
          width: size.width,
          height: 50,
          child: TextFormField(
              controller: _otpcontroller,
              cursorColor: Color(0xffE67805),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Color(0xffE67805), width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                hintStyle: TextStyle(color: Colors.grey),
                disabledBorder: InputBorder.none,
                hintText: 'Nhập mã otp',
                contentPadding: EdgeInsets.all(5),
              )),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: _otpcontroller.text);
            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text("VERIFY"),
          color: Colors.orange[900],
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var techMobile = TechMobile.of(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[900],
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Verify Host',
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
          padding: const EdgeInsets.all(16),
        ));
  }
}
