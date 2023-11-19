import 'package:http/http.dart' as http;

import '../../model/blog/blog_detail_model.dart';
import '../../model/blog/blog_model.dart';
import '../../unit.dart';

class BlogApi {
  static var client = http.Client();
  static Future<BlogModel?> getBlog({String? token}) async {
    var response = await client.get(Uri.parse('$url/api/v1/posts'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      return blogModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<BlogDetailModel?> getBlogDetail(
      {String? token, String? id}) async {
    var response = await client.get(Uri.parse('$url/api/v1/posts/show/$id'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
          'Authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      return blogDetailModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
