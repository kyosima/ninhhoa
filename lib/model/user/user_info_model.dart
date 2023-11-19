import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) =>
    UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  int? status;
  String? message;
  Data? data;

  UserInfoModel({this.status, this.message, this.data});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
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
  String? username;
  String? fullname;
  String? email;
  String? phone;
  String? birthday;
  int? gender;
  String? avatar;
  String? address;
  String? createdAt;
  Level? level;

  Data(
      {this.id,
      this.username,
      this.fullname,
      this.email,
      this.phone,
      this.birthday,
      this.gender,
      this.avatar,
      this.address,
      this.createdAt,
      this.level});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    birthday = json['birthday'];
    gender = json['gender'];
    avatar = json['avatar'];
    address = json['address'];
    createdAt = json['created_at'];
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['avatar'] = this.avatar;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    if (this.level != null) {
      data['level'] = this.level!.toJson();
    }
    return data;
  }
}

class Level {
  String? name;
  int? typeDiscount;
  int? plainValue;

  Level({this.name, this.typeDiscount, this.plainValue});

  Level.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    typeDiscount = json['type_discount'];
    plainValue = json['plain_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type_discount'] = this.typeDiscount;
    data['plain_value'] = this.plainValue;
    return data;
  }
}
