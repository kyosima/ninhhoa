import 'package:http/http.dart' as http;

import '../../model/auth/status_model.dart';
import '../../model/user/user_info_model.dart';
import '../../unit.dart';

class UserService {
  static var client = http.Client();
  static Future<UserInfoModel?> getUserInfo({String? accessToken}) async {
    var response = await client.get(Uri.parse('$url/api/v1/auth'), headers: {
      "Authorization": "Bearer $accessToken",
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return userInfoModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<StatusModel?> updatePassword(
      {String? oldPassword,
      String? newPassword,
      String? confirmPassword,
      String? token}) async {
    var response =
        await client.put(Uri.parse('$url/api/v1/auth/update-password'), body: {
      "old_password": oldPassword,
      "password": newPassword,
      "password_confirmation": confirmPassword
    }, headers: {
      'Authorization': "Bearer $token",
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<StatusModel?> updateUserInfo(
      {String? fullName, String? email, String? address, String? token}) async {
    var response = await client.put(Uri.parse('$url/api/v1/auth'), body: {
      "fullname": fullName,
      "email": email,
      "address": address,
      "gender": '1'
    }, headers: {
      'Authorization': "Bearer $token",
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
