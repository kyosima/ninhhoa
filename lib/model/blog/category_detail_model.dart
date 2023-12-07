// To parse this JSON data, do
//
//     final blogCategoryDetailModel = blogCategoryDetailModelFromJson(jsonString);

import 'dart:convert';

BlogCategoryDetailModel blogCategoryDetailModelFromJson(String str) =>
    BlogCategoryDetailModel.fromJson(json.decode(str));

String blogCategoryDetailModelToJson(BlogCategoryDetailModel data) =>
    json.encode(data.toJson());

class BlogCategoryDetailModel {
  int? status;
  String? message;
  Data? data;

  BlogCategoryDetailModel({
    this.status,
    this.message,
    this.data,
  });

  factory BlogCategoryDetailModel.fromJson(Map<String, dynamic> json) =>
      BlogCategoryDetailModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? name;
  String? slug;

  List<Post>? posts;

  Data({
    this.id,
    this.name,
    this.slug,
    this.posts,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
      };
}

class Post {
  int? id;
  String? title;
  String? slug;
  String? featureImage;
  String? excerpt;
  DateTime? postedAt;

  Post({
    this.id,
    this.title,
    this.slug,
    this.featureImage,
    this.excerpt,
    this.postedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
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
        "posted_at": postedAt?.toIso8601String(),
      };
}
