import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/screens/signIn/signin.dart';

import 'package:http/http.dart' as http;

//import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController rePassController = new TextEditingController();
  var userInval = '';
  var passInval = '';
  var rePassInval = '';
  var imageInval = '';
  var isLoading = false;

  File _image;
  Dio dio = new Dio();
  void takePhoto(ImageSource source) async {
    final pickedFile =
        await ImagePicker().getImage(source: source, imageQuality: 5);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future<dynamic> _upload() async {
    if (_image == null) return;
    String fileName = _image.path.split('/').last;
    FormData formData = FormData.fromMap({
      'username': userController.text,
      'password': passController.text,
      "image": _image != null
          ? await MultipartFile.fromFile(_image.path, filename: fileName)
          : '',
    });
    return await Dio()
        .post('https://book-room-app.herokuapp.com/user/api/registerUser',
            data: formData)
        .then((dynamic result) {
      setState(() {
        isLoading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }));
    });
  }

  void onClickButtonSignUp() {
    if (_image != null) {
      setState(() {
        imageInval = '';
      });
    } else {
      setState(() {
        imageInval = 'avatar is required';
      });
    }
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
    if (userInval == '' &&
        passInval == '' &&
        rePassInval == '' &&
        _image != null) {
      print('do chua ');
      setState(() {
        isLoading = true;
      });
      _upload();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("${_image?.path} giá trị  ");
    print(
        "${userInval} ${passInval} ${rePassInval}  giá trị -------------------  ");
    print(
        "${userController.text} ${passController.text} ${rePassController.text}  giá trị ---------------- ");
    return Scaffold(
      //ishow check ở đây
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
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Sign Up",
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
                            Stack(
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: _image == null
                                          ? AssetImage(
                                              'assets/images/avatar.jpg')
                                          : FileImage(_image),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    imageInval != ''
                                        ? Text(imageInval,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 10))
                                        : SizedBox(),
                                  ],
                                ),
                                Positioned(
                                  top: 40,
                                  left: 40,
                                  child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (builder) => Container(
                                                  height: 100,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  margin: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 20,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Choose profile photo",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          FlatButton.icon(
                                                              onPressed: () {
                                                                takePhoto(
                                                                    ImageSource
                                                                        .camera);
                                                              },
                                                              icon: Icon(
                                                                  Icons.camera),
                                                              label: Text(
                                                                  'Camera')),
                                                          FlatButton.icon(
                                                              onPressed: () {
                                                                takePhoto(
                                                                    ImageSource
                                                                        .gallery);
                                                              },
                                                              icon: Icon(
                                                                  Icons.image),
                                                              label: Text(
                                                                  'Gallery'))
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ));
                                      },
                                      child: Icon(Icons.camera_alt,
                                          color: Colors.teal, size: 20)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
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
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  userInval != ''
                                      ? Text(userInval,
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 10))
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
                                              color: Color.fromRGBO(
                                                  225, 95, 27, .3),
                                              blurRadius: 20,
                                              offset: Offset(0, 10)),
                                        ],
                                        border: Border.all(
                                            width: 1, color: Colors.grey[200])),
                                    child: TextField(
                                      controller: passController,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  passInval != ''
                                      ? Text(passInval,
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 10))
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
                                              color: Color.fromRGBO(
                                                  225, 95, 27, .3),
                                              blurRadius: 20,
                                              offset: Offset(0, 10)),
                                        ],
                                        border: Border.all(
                                            width: 1, color: Colors.grey[200])),
                                    child: TextField(
                                      controller: rePassController,
                                      decoration: InputDecoration(
                                          hintText: "RePassword",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            rePassInval != ''
                                ? Text(rePassInval,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 10))
                                : SizedBox(),

                            SizedBox(
                              height: 20,
                            ),
                            // Text(
                            //   "Forgot Password?",
                            //   style: TextStyle(color: Colors.grey),
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: onClickButtonSignUp,
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.orange[900]),
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
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
