import 'package:http/http.dart' as http;

import '../../model/auth/banner_model.dart';
import '../../model/auth/login_model.dart';
import '../../model/auth/register_model.dart';
import '../../model/auth/status_model.dart';
import '../../unit.dart';

class AuthApi {
  static var client = http.Client();
  static Future<RegisterModel?> register(
      {String? phone,
      String? fullName,
      String? email,
      String? passWord,
      String? confirmPassword}) async {
    var response = await client.post(Uri.parse('$url/api/v1/register'), body: {
      "fullname": fullName,
      "phone": phone,
      "email": email,
      "password": passWord,
      "password_confirmation": confirmPassword,
    }, headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });

    if (response.statusCode == 200 || response.statusCode == 400) {
      return registerModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<LoginModel?> login({String? userName, String? password}) async {
    var response = await client.post(Uri.parse('$url/api/v1/login'), body: {
      "username": userName,
      "password": password,
    }, headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return loginModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<StatusModel?> resetPassword({String? email}) async {
    var response =
        await client.post(Uri.parse('$url/api/v1/reset-password'), body: {
      'email': email,
    }, headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<BannerModel?> getBanner({String? token}) async {
    var response =
        await client.get(Uri.parse('$url/api/v1/slider/show/slider'), headers: {
      'Authorization': 'Bearer $token',
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return bannerModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
