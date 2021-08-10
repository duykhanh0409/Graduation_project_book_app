import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/api.dart';
import 'package:graduation_project_book_app/screens/signIn/signin.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key key}) : super(key: key);

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController passController = new TextEditingController();
  TextEditingController rePassController = new TextEditingController();
  TextEditingController userController = new TextEditingController();
  bool isShowPassword = true;
  var passInval = '';
  var userInval = '';
  var rePassInval = '';
  var isLoading = false;
  Future<dynamic> submit() async {
    FormData formData = FormData.fromMap({
      'username': userController.text,
      'newpassword': passController.text,
    });
    try {
      Response response = await Dio().post(
          'https://book-room-app.herokuapp.com/user/api/updatePassword',
          data: formData);
      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 500) {
        print(e.response.data);
        final snackBar = SnackBar(
            padding: EdgeInsets.all(10),
            content: Text(
              e.response.data,
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void onClickButtonSubmit() async {
    if (userController.text.length < 6) {
      setState(() {
        userInval = 'UserName must be more than 6 characters';
      });
    } else {
      setState(() {
        userInval = '';
      });
    }
    if (passController.text.length < 6) {
      setState(() {
        passInval = 'Password must be more than 6 characters';
      });
    } else {
      setState(() {
        passInval = '';
      });
    }
    if (rePassController.text.contains(passController.text)) {
      setState(() {
        rePassInval = '';
      });
    } else {
      setState(() {
        rePassInval = 'rePassword does not match password';
      });
    }
    if (passInval == '' && rePassInval == '' && userInval == '') {
      print('do chua ');
      setState(() {
        isLoading = true;
      });
      submit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[900],
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'New Password',
            textAlign: TextAlign.center,
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10)),
                          ],
                          border:
                              Border.all(width: 1, color: Colors.grey[200])),
                      child: TextField(
                        controller: userController,
                        decoration: InputDecoration(
                          hintText: "UserName",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    userInval != ''
                        ? Text(userInval,
                            style: TextStyle(color: Colors.red, fontSize: 10))
                        : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10)),
                          ],
                          border:
                              Border.all(width: 1, color: Colors.grey[200])),
                      child: TextField(
                        obscureText: isShowPassword,
                        controller: passController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isShowPassword = !isShowPassword;
                              });
                            },
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.only(end: 0, bottom: 5),
                              child: Icon(Icons.remove_red_eye),
                            ),
                          ),
                        ),
                      ),
                    ),
                    passInval != ''
                        ? Text(passInval,
                            style: TextStyle(color: Colors.red, fontSize: 10))
                        : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10)),
                          ],
                          border:
                              Border.all(width: 1, color: Colors.grey[200])),
                      child: TextField(
                        obscureText: true,
                        controller: rePassController,
                        decoration: InputDecoration(
                            hintText: "RePassword",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    ),
                    rePassInval != ''
                        ? Text(rePassInval,
                            style: TextStyle(color: Colors.red, fontSize: 10))
                        : SizedBox(),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        onClickButtonSubmit();
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.orange[900]),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            isLoading
                ? Positioned(
                    child: Container(
                      color: Colors.grey.withOpacity(0.7),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : Container(),
          ],
        ));
  }
}
