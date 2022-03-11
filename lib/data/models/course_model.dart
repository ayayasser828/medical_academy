// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

CourseModel courseModelFromJson(String str) => CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  CourseModel({
    this.course,
    this.sessions,
    this.ifEnrolled,
  });

  Course? course;
  List<Session>? sessions;
  bool? ifEnrolled;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    course: Course.fromJson(json["course"]),
    sessions: List<Session>.from(json["sessions"].map((x) => Session.fromJson(x))),
    ifEnrolled: json["if_enrolled"],
  );

  Map<String, dynamic> toJson() => {
    "course": course!.toJson(),
    "sessions": List<dynamic>.from(sessions!.map((x) => x.toJson())),
    "if_enrolled": ifEnrolled,
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
  };
}

class Session {
  Session({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
