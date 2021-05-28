import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController rePassController = new TextEditingController();
  var userInval = true;
  var passInval = true;
  var rePassInval = true;
  // PickedFile _imageFile;
  // final ImagePicker _picker = ImagePicker();

  File _image;
  //final _picker = ImagePicker();
  Dio dio = new Dio();
  void takePhoto(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future<dynamic> _upload() async {
    if (_image == null) return;
    String fileName = _image.path.split('/').last;
    Map<String, dynamic> formData = {
      'username': userController.text,
      'password': passController.text,
      "image": await MultipartFile.fromFile(_image.path, filename: fileName),
    };
    return await Dio()
        .post('https://book-room-app.herokuapp.com/user/api/registerUser',
            data: formData)
        .then((dynamic result) {
      print(result.toString());
    });
  }

  void onClickButtonSignUp() {
    if (userController.text.length > 6) {
      setState(() {
        userInval = true;
      });
    } else {
      setState(() {
        userInval = false;
      });
    }
    if (passController.text.length > 6) {
      setState(() {
        passInval = true;
      });
    } else {
      setState(() {
        passInval = false;
      });
    }
    if (rePassController.text.contains(passController.text)) {
      setState(() {
        rePassInval = true;
      });
    } else {
      setState(() {
        rePassInval = false;
      });
    }
    if (userInval && passInval && rePassInval && _image != null) {
      print('do chua ');
      _upload();
    }
  }

  Future<http.Response> createAlbum() async {
    print('ddddddddddddddddddd');
    // var image = File(_image?.path);
    //var image = _image?.path;
    final bytes = File(_image.path).readAsBytesSync();
    final response = await http.post(
        Uri.parse('https://book-room-app.herokuapp.com/user/api/registerUser'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': userController.text,
          'password': passController.text,
          'image': bytes
        }));
    if (response.statusCode == 201) {
      print('posst thanh cong');
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
      body: Container(
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
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: _image == null
                                  ? AssetImage('assets/images/khanh.jpg')
                                  : FileImage(File(_image.path)),
                              backgroundColor: Colors.transparent,
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
                                                    style:
                                                        TextStyle(fontSize: 20),
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
                                                          label:
                                                              Text('Camera')),
                                                      FlatButton.icon(
                                                          onPressed: () {
                                                            takePhoto(
                                                                ImageSource
                                                                    .gallery);
                                                          },
                                                          icon:
                                                              Icon(Icons.image),
                                                          label:
                                                              Text('Gallery'))
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
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: TextField(
                                  controller: userController,
                                  decoration: InputDecoration(
                                    hintText: "UserName",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                    errorText: userInval
                                        ? null
                                        : 'vui long nhap dung email',
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: TextField(
                                  controller: passController,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                    errorText: passInval
                                        ? null
                                        : 'password khong hop le',
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: TextField(
                                  controller: rePassController,
                                  decoration: InputDecoration(
                                      hintText: "RePassword",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Text(
                        //   "Forgot Password?",
                        //   style: TextStyle(color: Colors.grey),
                        // ),
                        SizedBox(
                          height: 40,
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
    );
  }
}
