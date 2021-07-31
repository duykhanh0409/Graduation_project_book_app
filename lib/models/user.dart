// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.avatar,
    this.password,
    this.phoneNumber,
    this.favouriteList,
    this.email,
    this.username,
    this.id,
  });

  String avatar;
  String password;
  String phoneNumber;
  List<dynamic> favouriteList;
  String email;
  String username;
  String id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        avatar: json["avatar"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        favouriteList: json["favouriteList"] == null
            ? null
            : List<dynamic>.from(json["favouriteList"].map((x) => x)),
        email: json["email"],
        username: json["username"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "password": password,
        "phoneNumber": phoneNumber,
        "favouriteList": List<dynamic>.from(favouriteList.map((x) => x)),
        "email": email,
        "username": username,
        "id": id,
      };
}
