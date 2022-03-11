// To parse this JSON data, do
//
//     final loginErrorModel = loginErrorModelFromJson(jsonString);

import 'dart:convert';

LoginErrorModel loginErrorModelFromJson(String str) => LoginErrorModel.fromJson(json.decode(str));

String loginErrorModelToJson(LoginErrorModel data) => json.encode(data.toJson());

class LoginErrorModel {
  LoginErrorModel({
    this.message,
  });

  String? message;

  factory LoginErrorModel.fromJson(Map<String, dynamic> json) => LoginErrorModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
