// To parse this JSON data, do
//
//     final registerSuccessModel = registerSuccessModelFromJson(jsonString);

import 'dart:convert';

RegisterSuccessModel registerSuccessModelFromJson(String str) => RegisterSuccessModel.fromJson(json.decode(str));

String registerSuccessModelToJson(RegisterSuccessModel data) => json.encode(data.toJson());

class RegisterSuccessModel {
  RegisterSuccessModel({
    this.user,
  });

  User? user;

  factory RegisterSuccessModel.fromJson(Map<String, dynamic> json) => RegisterSuccessModel(
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
  };
}

class User {
  User({
    this.name,
    this.email,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? name;
  String? email;
  String? status;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    status: json["status"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "status": status,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
