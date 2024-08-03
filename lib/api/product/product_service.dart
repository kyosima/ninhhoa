import 'package:http/http.dart' as http;

import '../../model/auth/status_model.dart';
import '../../model/product/category_detail_model.dart';
import '../../model/product/category_model.dart';
import '../../model/product/category_product_model.dart';
import '../../model/product/feature_product_model.dart';
import '../../model/product/product_detail_model.dart';
import '../../model/product/review_model.dart';
import '../../model/product/variation_model.dart';
import '../../unit.dart';

class ProductApi {
  static final client = http.Client();
  static Future<CategoryModel?> getCategory() async {
    var response =
        await client.get(Uri.parse(('$url/api/v1/product-category')), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return categoryModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<ProductDetailModel?> getProductDetail(
      {String? id, String? token}) async {
    var response = await client.get(Uri.parse('$url/api/v1/product/show/$id'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
          'Authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      return productDetailModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<CategoryProductModel?> getCategoryProduct(
      {String? token}) async {
    var response =
        await client.get(Uri.parse('$url/api/v1/product-category'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return categoryProductModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<VariationModel?> getVariation(
      {String? id,
      String? variationCapacity,
      String? variationColors,
      String? token}) async {
    var response = await client.get(
        Uri.parse(variationCapacity == ''
            ? '$url/api/v1/product/auth/variation/show?product_id=$id&variation_id[]=$variationColors'
            : variationColors == ''
                ? '$url/api/v1/product/auth/variation/show?product_id=$id&variation_id[]=$variationCapacity'
                : '$url/api/v1/product/auth/variation/show?product_id=$id&variation_id[]=$variationCapacity&variation_id[]=$variationColors'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return variationModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<CategoryDetailModel?> getCategoryDetail({String? id}) async {
    var response = await client
        .get(Uri.parse('$url/api/v1/product-category/show/$id'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return categoryDetailModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<FeatureProductModel?> getFeatureProduct(
      {String? status}) async {
    var response = await client
        .get(Uri.parse('$url/api/v1/product?feature=$status'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return featureProductModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<ReviewModel?> getReview({String? id}) async {
    var response = await client
        .get(Uri.parse('$url/api/v1/reviews?product_id=$id'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return reviewModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<StatusModel?> reviewProduct(
      {String? token, String? id, String? rating, String? content}) async {
    var response =
        await client.post(Uri.parse('$url/api/v1/reviews/store'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
      'Authorization': 'Bearer $token',
    }, body: {
      "product_id": id,
      "rating": rating,
      "content": content,
    });
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
