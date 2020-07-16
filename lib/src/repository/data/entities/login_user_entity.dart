import 'package:dio/dio.dart';

class LoginUserEntity {
  final String username;
  final String password;

  LoginUserEntity({this.username, this.password});

  Map<String, Object> toJson()=>
      {"username": username, "password": password, "grant_type": "password"};

  static LoginUserEntity fromJson(Map<String, Object> json) {
    return LoginUserEntity(
      username: json["username"] as String,
      password: json["password"] as String,
    );
  }

  @override
  String toString() {
    return 'LoginUserEntity{username: $username, password: $password}';
  }
}
