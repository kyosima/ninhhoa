import 'dart:convert';

CategoryDetailModel categoryDetailModelFromJson(String str) =>
    CategoryDetailModel.fromJson(json.decode(str));

String categoryDetailModelToJson(CategoryDetailModel data) =>
    json.encode(data.toJson());

class CategoryDetailModel {
  int? status;
  String? message;
  Data? data;

  CategoryDetailModel({this.status, this.message, this.data});

  CategoryDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? desc;
  String? titleSeo;
  String? descSeo;

  List<Childrens>? childrens;
  List<Products>? products;

  Data(
      {this.id,
      this.name,
      this.slug,
      this.desc,
      this.titleSeo,
      this.descSeo,
      this.childrens,
      this.products});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    desc = json['desc'];
    titleSeo = json['title_seo'];
    descSeo = json['desc_seo'];

    if (json['childrens'] != null) {
      childrens = <Childrens>[];
      json['childrens'].forEach((v) {
        childrens!.add(new Childrens.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['desc'] = this.desc;
    data['title_seo'] = this.titleSeo;
    data['desc_seo'] = this.descSeo;

    if (this.childrens != null) {
      data['childrens'] = this.childrens!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Childrens {
  int? id;
  String? name;
  String? slug;

  Childrens({this.id, this.name, this.slug});

  Childrens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Products {
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

  Products(
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

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    slug = json['sku'];
    inStock = json['in_stock'];
    feature = json['feature'];
    news = json['new'];
    featureImage = json['feature_image'];
    price = double.parse(json['price'].toString());
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
