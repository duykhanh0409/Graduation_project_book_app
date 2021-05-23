// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.phoneNumber,
    this.username,
    this.avatar,
    this.email,
    this.password,
    this.id,
  });

  String phoneNumber;
  String username;
  String avatar;
  String email;
  String password;
  String id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        phoneNumber: json["phoneNumber"],
        username: json["username"],
        avatar: json["avatar"],
        email: json["email"],
        password: json["password"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "username": username,
        "avatar": avatar,
        "email": email,
        "password": password,
        "id": id,
      };
}
