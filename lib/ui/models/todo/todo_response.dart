// To parse this JSON data, do
//
//     final empTodoDetailResponse = empTodoDetailResponseFromJson(jsonString);

import 'dart:convert';

List<EmpTodoDetailResponse> empTodoDetailResponseFromJson(String str) => new List<EmpTodoDetailResponse>.from(json.decode(str).map((x) => EmpTodoDetailResponse.fromJson(x)));

String empTodoDetailResponseToJson(List<EmpTodoDetailResponse> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class EmpTodoDetailResponse {
  int userId;
  int id;
  String title;
  bool completed;

  EmpTodoDetailResponse({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory EmpTodoDetailResponse.fromJson(Map<String, dynamic> json) => new EmpTodoDetailResponse(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
