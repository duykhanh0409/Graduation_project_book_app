import 'dart:convert';
import 'package:graduation_project_book_app/models/user.dart';
import 'package:graduation_project_book_app/models/vdp.dart';
import 'package:graduation_project_book_app/screens/navigation_screen.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<List<VdpItem>> fetchData() async {
    List<VdpItem> list = [];
    String url = 'https://book-room-app.herokuapp.com/product/api/read';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      for (int i = 0; i < json.decode(response.body).length; i++) {
        list.add(VdpItem.fromJson(json.decode(response.body)[i]));
      }
      print(list[0].type);
      return list;
    } else {
      throw Exception(" Lỗi khi load Json");
    }
  }

  static Future<User> getUser(var id) async {
    String url = 'https://book-room-app.herokuapp.com/user/api/read/$id';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var result = User.fromJson(json.decode(response.body));
      return result;
    } else {
      print('loi');
    }
  }

  static postListSave(var idUser, var idProduct) async {
    String url = 'https://book-room-app.herokuapp.com/user/api/addFavourite';
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'idUser': idUser,
          'idProduct': idProduct,
        }));
    if (response.statusCode == 201) {
      print('post list save ');
    }
  }

  static getListSave(var idUser) async {
    List<VdpItem> list = [];
    String url =
        'https://book-room-app.herokuapp.com/user/api/getListFavourite/$idUser';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      for (int i = 0; i < json.decode(response.body).length; i++) {
        list.add(VdpItem.fromJson(json.decode(response.body)[i]));
      }
      // print(list[0].type);
      return list;
    } else {
      throw Exception(" Lỗi khi load Json");
    }
  }

  static removeListSave(var idUser, var idProduct) async {
    String url =
        'https://book-room-app.herokuapp.com/user/api/removeProductInListFavourite';
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'idUser': idUser,
          'idProduct': idProduct,
        }));
    if (response.statusCode == 201) {
      print('remove list save ');
    }
  }

  static addCommentRoom(String productID, String userID, String comment,
      String username, String image) async {
    String url = 'https://book-room-app.herokuapp.com/product/api/comment';
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'productId': productID,
          'userId': userID,
          'comment': comment,
          'username': username,
          'image': image
        }));
    if (response.statusCode == 201) {
      Api.fetchData();
      print('remove list save ');
    }
  }

  static registerHost(String phoneNumber, String email, String userID) async {
    String url = 'https://book-room-app.herokuapp.com/user/api/registerHost';
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'phone': phoneNumber,
          'email': email,
          'userID': userID
        }));
    if (response.statusCode == 201) {
      print('register Host');
    }
  }

  static updatePassword(String username, String newPassword) async {
    String url = 'https://book-room-app.herokuapp.com/user/api/updatePassword';
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': username,
          'newpassword': newPassword
        }));
    if (response.statusCode == 201) {
      print('new password succedd');
    }
  }
}
