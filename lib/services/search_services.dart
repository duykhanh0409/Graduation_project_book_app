import 'dart:convert';

import 'package:graduation_project_book_app/models/vdp.dart';
import 'package:http/http.dart' as http;

class SearchService {
  Future<List<VdpItem>> fetchData() async {
    List<VdpItem> list = [];
    String url = 'https://book-room-app.herokuapp.com/api/read';
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
}
