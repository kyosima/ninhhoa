import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  int? status;
  String? message;
  List<Data>? data;

  CartModel({this.status, this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
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
  int? qty;
  Product? product;

  Data({this.id, this.qty, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qty = json['qty'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qty'] = this.qty;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? slug;
  int? inStock;
  String? featureImage;
  double? price;
  double? pricePromotion;
  PurchaseQty? purchaseQty;

  Product(
      {this.id,
      this.name,
      this.slug,
      this.inStock,
      this.featureImage,
      this.price,
      this.pricePromotion,
      this.purchaseQty});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    inStock = json['in_stock'];
    featureImage = json['feature_image'];
    price = double.parse(json['price'].toString());
    pricePromotion = json['price_promotion'] == null
        ? json['price_promotion']
        : double.parse(json['price_promotion'].toString());
    purchaseQty = json['purchase_qty'] != null
        ? new PurchaseQty.fromJson(json['purchase_qty'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['in_stock'] = this.inStock;
    data['feature_image'] = this.featureImage;
    data['price'] = this.price;
    data['price_promotion'] = this.pricePromotion;
    if (this.purchaseQty != null) {
      data['purchase_qty'] = this.purchaseQty!.toJson();
    }
    return data;
  }
}

class PurchaseQty {
  int? type;
  int? qty;
  int? plainValue;

  PurchaseQty({this.type, this.qty, this.plainValue});

  PurchaseQty.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    qty = json['qty'];
    plainValue = json['plain_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['qty'] = this.qty;
    data['plain_value'] = this.plainValue;
    return data;
  }
}
