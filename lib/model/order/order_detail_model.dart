import 'dart:convert';

OrderDetail orderDetailFromJson(String str) =>
    OrderDetail.fromJson(json.decode(str));

String orderDetailToJson(OrderDetail data) => json.encode(data.toJson());

class OrderDetail {
  int? status;
  String? message;
  Data? data;

  OrderDetail({this.status, this.message, this.data});

  OrderDetail.fromJson(Map<String, dynamic> json) {
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
  String? customerFullname;
  String? customerPhone;
  String? customerEmail;
  String? shippingAddress;
  int? subTotal;
  int? discount;
  int? total;
  Null? paymentCode;
  int? status;
  Null? note;
  String? createdAt;
  List<Details>? details;

  Data(
      {this.id,
      this.customerFullname,
      this.customerPhone,
      this.customerEmail,
      this.shippingAddress,
      this.subTotal,
      this.discount,
      this.total,
      this.paymentCode,
      this.status,
      this.note,
      this.createdAt,
      this.details});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerFullname = json['customer_fullname'];
    customerPhone = json['customer_phone'];
    customerEmail = json['customer_email'];
    shippingAddress = json['shipping_address'];
    subTotal = json['sub_total'];
    discount = json['discount'];
    total = json['total'];
    paymentCode = json['payment_code'];
    status = json['status'];
    note = json['note'];
    createdAt = json['created_at'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_fullname'] = this.customerFullname;
    data['customer_phone'] = this.customerPhone;
    data['customer_email'] = this.customerEmail;
    data['shipping_address'] = this.shippingAddress;
    data['sub_total'] = this.subTotal;
    data['discount'] = this.discount;
    data['total'] = this.total;
    data['payment_code'] = this.paymentCode;
    data['status'] = this.status;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? id;
  String? name;
  int? qty;
  int? unitPrice;
  int? unitPricePurchaseQty;
  String? slug;
  String? featureImage;

  Details(
      {this.id,
      this.name,
      this.qty,
      this.unitPrice,
      this.unitPricePurchaseQty,
      this.slug,
      this.featureImage});

  Details.fromJson(Map<String, dynamic> json) {
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
