import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  int? status;
  String? message;
  List<Data>? data;

  OrderModel({this.status, this.message, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
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
  int? total;
  int? status;
  String? createdAt;
  Product? product;

  Data({this.id, this.total, this.status, this.createdAt, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    status = json['status'];
    createdAt = json['created_at'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  int? qty;
  int? unitPrice;
  int? unitPricePurchaseQty;
  String? slug;
  String? featureImage;

  Product(
      {this.id,
      this.name,
      this.qty,
      this.unitPrice,
      this.unitPricePurchaseQty,
      this.slug,
      this.featureImage});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    qty = json['qty'];
    unitPrice = json['unit_price'];
    unitPricePurchaseQty = json['unit_price_purchase_qty'];
    slug = json['slug'];
    featureImage = json['feature_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['qty'] = this.qty;
    data['unit_price'] = this.unitPrice;
    data['unit_price_purchase_qty'] = this.unitPricePurchaseQty;
    data['slug'] = this.slug;
    data['feature_image'] = this.featureImage;
    return data;
  }
}
