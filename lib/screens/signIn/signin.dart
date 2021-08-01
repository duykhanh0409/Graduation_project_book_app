import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/models/user.dart';
import 'package:graduation_project_book_app/screens/navigation_screen.dart';
import 'package:graduation_project_book_app/screens/signIn/forgot_password.dart';
import 'package:graduation_project_book_app/screens/signUp/signup.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  var userInval = false;
  var passInval = false;
  var isLoading = false;
  var loginError;

  Future<dynamic> signIn() async {
    FormData formData = FormData.fromMap({
      'username': userController.text.trim(),
      'password': passController.text.trim(),
    });

    try {
      Response response = await Dio().post(
          'https://book-room-app.herokuapp.com/user/api/validateLogin',
          data: formData);
      if (response.statusCode == 200) {
        final body = response.data;
        print(body);
        var techMobile = TechMobile.of(context);
        techMobile.user = User(
            avatar: body['avatar'],
            favouriteList: body['favouriteList'],
            email: body['email'],
            password: body['password'],
            username: body['username'],
            id: body['id'],
            phoneNumber: body['phoneNumber']);
        setState(() {
          isLoading = false;
        });
        return Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => NavigationScreen()));
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

  void onClickButtonLogin() {
    setState(() {
      if (userController.text.length < 6) {
        userInval = true;
      } else {
        userInval = false;
      }
      if (passController.text.length < 6) {
        passInval = true;
      } else {
        passInval = false;
      }

      if (!userInval && !passInval) {
        setState(() {
          isLoading = true;
        });
        signIn();
      }
    });
  }

  @override
  void initState() {
    userController.text = 'khanhNguyen';
    passController.text = '12345678';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400]
            ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Welcome Back",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                // BoxShadow(
                                //     color: Colors.black,
                                //     blurRadius: 2,
                                //     offset: Offset(1, 1))
                              ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  225, 95, 27, .3),
                                              blurRadius: 20,
                                              offset: Offset(0, 10)),
                                        ],
                                        border: Border.all(
                                            width: 1, color: Colors.grey[200])),
                                    child: TextField(
                                      controller: userController,
                                      decoration: InputDecoration(
                                          hintText: "UserName",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  userInval
                                      ? Text(
                                          'UserName must be more than 6 characters',
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 10))
                                      : SizedBox(
                                          height: 0,
                                        ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  225, 95, 27, .3),
                                              blurRadius: 20,
                                              offset: Offset(0, 10)),
                                        ],
                                        border: Border.all(
                                            width: 1, color: Colors.grey[200])),
                                    child: TextField(
                                      obscureText: true,
                                      controller: passController,
                                      decoration: InputDecoration(
                                          errorBorder: passInval
                                              ? OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white))
                                              : null,
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  passInval
                                      ? Text(
                                          'Password must be more than 6 characters',
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 10))
                                      : SizedBox(
                                          height: 0,
                                        )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ForgotPassword();
                                }));
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: onClickButtonLogin,
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.orange[900]),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()),
                                );
                              },
                              child: Text(
                                "You don't have account? Sign up",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Continue with social media",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blue),
                                  child: Center(
                                    child: Text(
                                      "Facebook",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                    child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black),
                                  child: Center(
                                    child: Text(
                                      "Email",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
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
      ),
    );
  }
}
