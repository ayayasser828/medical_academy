// To parse this JSON data, do
//
//     final allCoursesModel = allCoursesModelFromJson(jsonString);

import 'dart:convert';

AllCoursesModel allCoursesModelFromJson(String str) => AllCoursesModel.fromJson(json.decode(str));

String allCoursesModelToJson(AllCoursesModel data) => json.encode(data.toJson());

class AllCoursesModel {
  AllCoursesModel({
    this.the0,
    this.the1,
    this.courses,
  });

  String? the0;
  List<int>? the1;
  List<Course>? courses;

  factory AllCoursesModel.fromJson(Map<String, dynamic> json) => AllCoursesModel(
    the0: json["0"],
    the1: List<int>.from(json["1"].map((x) => x)),
    courses: List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "1": List<dynamic>.from(the1!.map((x) => x)),
    "courses": List<dynamic>.from(courses!.map((x) => x.toJson())),
  };
}

class Course {
  Course({
    this.id,
    this.name,
    this.slug,
    this.instructorName,
    this.imagePath,
    this.description,
    this.status,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.sessionsCount,
  });

  int? id;
  String? name;
  String? slug;
  String? instructorName;
  String? imagePath;
  String? description;
  String? status;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? sessionsCount;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    instructorName: json["instructor_name"],
    imagePath: json["image_path"],
    description: json["description"],
    status: json["status"],
    price: json["price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    sessionsCount: json["sessions_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "instructor_name": instructorName,
    "image_path": imagePath,
    "description": description,
    "status": status,
    "price": price,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "sessions_count": sessionsCount,
  };
}
