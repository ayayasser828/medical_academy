// To parse this JSON data, do
//
//     final registerErrorModel = registerErrorModelFromJson(jsonString);

import 'dart:convert';

RegisterErrorModel registerErrorModelFromJson(String str) => RegisterErrorModel.fromJson(json.decode(str));

String registerErrorModelToJson(RegisterErrorModel data) => json.encode(data.toJson());

class RegisterErrorModel {
  RegisterErrorModel({
    this.message,
    this.errors,
  });

  String? message;
  Errors? errors;

  factory RegisterErrorModel.fromJson(Map<String, dynamic> json) => RegisterErrorModel(
    message: json["message"],
    errors: Errors.fromJson(json["errors"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "errors": errors?.toJson(),
  };
}

class Errors {
  Errors({
    this.password,
  });

  List<String>? password;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
    password: List<String>.from(json["password"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "password": List<dynamic>.from(password!.map((x) => x)),
  };
}
