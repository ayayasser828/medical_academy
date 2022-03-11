// To parse this JSON data, do
//
//     final sessionModel = sessionModelFromJson(jsonString);

import 'dart:convert';

SessionModel sessionModelFromJson(String str) => SessionModel.fromJson(json.decode(str));

String sessionModelToJson(SessionModel data) => json.encode(data.toJson());

class SessionModel {
  SessionModel({
    this.session,
  });

  Session? session;

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
    session: Session.fromJson(json["session"]),
  );

  Map<String, dynamic> toJson() => {
    "session": session!.toJson(),
  };
}

class Session {
  Session({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.courseId,
    this.sessionLink,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? slug;
  String? description;
  int? courseId;
  String? sessionLink;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    description: json["description"],
    courseId: json["course_id"],
    sessionLink: json["session_link"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "description": description,
    "course_id": courseId,
    "session_link": sessionLink,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
