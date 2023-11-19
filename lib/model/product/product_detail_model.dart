import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

class ProductDetailModel {
  int? status;
  String? message;
  Data? data;

  ProductDetailModel({this.status, this.message, this.data});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? slug;
  String? sku;
  int? inStock;
  int? feature;
  int? news;
  String? featureImage;
  List<String>? gallery;
  String? shortDesc;
  String? contentSpecification;
  String? contentApplication;
  String? contentDownload;
  String? desc;
  String? titleSeo;
  String? descSeo;
  double? price;
  int? viewed;
  double? pricePromotion;
  List<PurchaseQty>? purchaseQty;

  Data(
      {this.id,
      this.name,
      this.slug,
      this.sku,
      this.inStock,
      this.feature,
      this.news,
      this.featureImage,
      this.gallery,
      this.shortDesc,
      this.contentSpecification,
      this.contentApplication,
      this.contentDownload,
      this.desc,
      this.titleSeo,
      this.descSeo,
      this.price,
      this.viewed,
      this.pricePromotion,
      this.purchaseQty});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    sku = json['sku'];
    inStock = json['in_stock'];
    feature = json['feature'];
    news = json['new'];
    featureImage = json['feature_image'];
    gallery = json['gallery'].cast<String>();
    shortDesc = json['short_desc'];
    contentSpecification = json['content_specification'];
    contentApplication = json['content_application'];
    contentDownload = json['content_download'];
    desc = json['desc'];
    titleSeo = json['title_seo'];
    descSeo = json['desc_seo'];
    price = double.parse(json['price'].toString());
    viewed = json['viewed'];
    pricePromotion = json['price_promotion'] == null
        ? json['price_promotion']
        : double.parse(json['price_promotion'].toString());
    if (json['purchase_qty'] != null) {
      purchaseQty = <PurchaseQty>[];
      json['purchase_qty'].forEach((v) {
        purchaseQty!.add(new PurchaseQty.fromJson(v));
      });
    }
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
    data['gallery'] = this.gallery;
    data['short_desc'] = this.shortDesc;
    data['content_specification'] = this.contentSpecification;
    data['content_application'] = this.contentApplication;
    data['content_download'] = this.contentDownload;
    data['desc'] = this.desc;
    data['title_seo'] = this.titleSeo;
    data['desc_seo'] = this.descSeo;
    data['price'] = this.price;
    data['viewed'] = this.viewed;
    data['price_promotion'] = this.pricePromotion;
    if (this.purchaseQty != null) {
      data['purchase_qty'] = this.purchaseQty!.map((v) => v.toJson()).toList();
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
