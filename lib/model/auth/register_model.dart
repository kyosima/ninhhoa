import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));
String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  int? status;
  String? message;
  MessageValidate? messageValidate;

  RegisterModel({this.status, this.message, this.messageValidate});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageValidate = json['message_validate'] != null
        ? MessageValidate.fromJson(json['message_validate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (messageValidate != null) {
      data['message_validate'] = messageValidate!.toJson();
    }
    return data;
  }
}

class MessageValidate {
  List<String>? fullname;
  List<String>? phone;
  List<String>? email;
  List<String>? password;
  List<String>? passwordConfirmation;

  MessageValidate(
      {this.fullname,
      this.phone,
      this.email,
      this.password,
      this.passwordConfirmation});

  MessageValidate.fromJson(Map<String, dynamic> json) {
    if (json['phone'] != null) {
      phone = json['phone'].cast<String>();
    } else {
      phone = [''];
    }
    if (json['email'] != null) {
      email = json['email'].cast<String>();
    } else {
      email = [''];
    }

    if (json['fullname'] != null) {
      fullname = json['fullname'].cast<String>();
    } else {
      fullname = [''];
    }
    if (json['password'] != null) {
      password = json['password'].cast<String>();
    } else {
      password = [''];
    }
    if (json['password_confirmation'] != null) {
      passwordConfirmation = json['password_confirmation'].cast<String>();
    } else {
      passwordConfirmation = [''];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = fullname;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    return data;
  }
}
