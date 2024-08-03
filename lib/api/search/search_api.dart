import 'package:http/http.dart' as http;

import '../../model/product/feature_product_model.dart';
import '../../unit.dart';

class SearchApi {
  static var client = http.Client();
  static Future<FeatureProductModel?> search({String? keyword}) async {
    var response = await client
        .get(Uri.parse('$url/api/v1/product?keywords=$keyword'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return featureProductModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
