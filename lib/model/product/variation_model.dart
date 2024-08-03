import 'dart:convert';

VariationModel variationModelFromJson(String str) =>
    VariationModel.fromJson(json.decode(str));

String variationModelToJson(VariationModel data) => json.encode(data.toJson());

class VariationModel {
  int? status;
  String? message;
  Data? data;

  VariationModel({this.status, this.message, this.data});

  VariationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? price;
  int? promotionPrice;
  String? image;

  Data({this.id, this.price, this.promotionPrice, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    promotionPrice = json['promotion_price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['promotion_price'] = promotionPrice;
    data['image'] = image;
    return data;
  }
}
