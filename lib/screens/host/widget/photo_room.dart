import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/screens/host/create_new_room.dart';
import 'dart:async';

import 'package:multi_image_picker2/multi_image_picker2.dart';

class PhotoRoom extends StatefulWidget {
  @override
  _PhotoRoomState createState() => _PhotoRoomState();
}

class _PhotoRoomState extends State<PhotoRoom> {
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    //String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  List<MultipartFile> fileImages = new List<MultipartFile>();
  _saveImage() async {
    var techMobile = TechMobile.of(context);
    if (images != null) {
      for (var i = 0; i < images.length; i++) {
        int maxWidth = MediaQuery.of(context).size.width.round();
        int maxHight = (MediaQuery.of(context).size.height / 2).round();
        ByteData byteData =
            await images[i].getThumbByteData(maxWidth, maxHight, quality: 80);
        List<int> imageData = byteData.buffer.asInt8List();
        MultipartFile multipartFile = MultipartFile.fromBytes(
          imageData,
          filename: images[i].name,
        );
        fileImages.add(multipartFile);
      }
      techMobile.isShowPhoto = true;
      techMobile.listPhoto = fileImages;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(images.length > 0 ? images[1] : images);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Room Image',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text('Upload ảnh về phòng',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w300)),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Pick images"),
              onPressed: loadAssets,
            ),
            Expanded(
              child: buildGridView(),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await _saveImage();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CreateNewRoom();
            }));
          },
          tooltip: 'Continues',
          child: Icon(
            Icons.arrow_right_alt_sharp,
            size: 30,
          ),
        ),
      ),
    );
  }
}
