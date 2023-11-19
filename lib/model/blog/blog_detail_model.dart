import 'dart:convert';

BlogDetailModel blogDetailModelFromJson(String str) =>
    BlogDetailModel.fromJson(json.decode(str));

String blogDetailModelToJson(BlogDetailModel data) =>
    json.encode(data.toJson());

class BlogDetailModel {
  int? status;
  String? message;
  Data? data;

  BlogDetailModel({this.status, this.message, this.data});

  BlogDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? slug;
  String? featureImage;
  String? excerpt;
  String? content;
  String? postedAt;
  String? titleSeo;
  String? descSeo;

  Data(
      {this.id,
      this.title,
      this.slug,
      this.featureImage,
      this.excerpt,
      this.content,
      this.postedAt,
      this.titleSeo,
      this.descSeo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    featureImage = json['feature_image'];
    excerpt = json['excerpt'];
    content = json['content'];
    postedAt = json['posted_at'];
    titleSeo = json['title_seo'];
    descSeo = json['desc_seo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['feature_image'] = this.featureImage;
    data['excerpt'] = this.excerpt;
    data['content'] = this.content;
    data['posted_at'] = this.postedAt;
    data['title_seo'] = this.titleSeo;
    data['desc_seo'] = this.descSeo;
    return data;
  }
}
