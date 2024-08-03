// To parse this JSON data, do
//
//     final blogModel = blogModelFromJson(jsonString);

import 'dart:convert';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  int? status;
  String? message;
  List<Datum>? data;

  BlogModel({
    this.status,
    this.message,
    this.data,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? title;
  String? slug;
  String? featureImage;
  String? excerpt;
  DateTime? postedAt;

  Datum({
    this.id,
    this.title,
    this.slug,
    this.featureImage,
    this.excerpt,
    this.postedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        featureImage: json["feature_image"],
        excerpt: json["excerpt"],
        postedAt: DateTime.parse(json["posted_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "feature_image": featureImage,
        "excerpt": excerpt,
        "posted_at": postedAt!.toIso8601String(),
      };
}
