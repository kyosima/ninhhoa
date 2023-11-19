import 'dart:convert';

FeatureProductModel featureProductModelFromJson(String str) =>
    FeatureProductModel.fromJson(json.decode(str));

String featureProductModelToJson(FeatureProductModel data) =>
    json.encode(data.toJson());

class FeatureProductModel {
  int? status;
  String? message;
  List<Data>? data;

  FeatureProductModel({this.status, this.message, this.data});

  FeatureProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? slug;
  String? sku;
  int? inStock;
  int? feature;
  int? news;
  String? featureImage;
  double? price;
  int? viewed;
  String? shortDesc;
  double? pricePromotion;

  Data(
      {this.id,
      this.name,
      this.slug,
      this.sku,
      this.inStock,
      this.feature,
      this.news,
      this.featureImage,
      this.price,
      this.viewed,
      this.shortDesc,
      this.pricePromotion});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    slug = json['sku'];
    inStock = json['in_stock'];
    feature = json['feature'];
    news = json['new'];
    featureImage = json['feature_image'];
    price = json['price'] == null
        ? json['price']
        : double.parse(json['price'].toString());
    viewed = json['viewed'];
    shortDesc = json['short_desc'];
    pricePromotion = json['price_promotion'] == null
        ? json['price_promotion']
        : double.parse(json['price_promotion'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['sku'] = this.sku;
    data['in_stock'] = this.inStock;
    data['feature'] = this.feature;
    data['new'] = this.news;
    data['feature_image'] = this.featureImage;
    data['price'] = this.price;
    data['viewed'] = this.viewed;
    data['short_desc'] = this.shortDesc;
    data['price_promotion'] = this.pricePromotion;
    return data;
  }
}
