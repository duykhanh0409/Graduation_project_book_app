import 'dart:convert';
import 'package:graduation_project_book_app/models/user.dart';
import 'package:graduation_project_book_app/models/vdp.dart';
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
    final response = await http.post(
        Uri.parse(url),
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
}
