import 'package:http/http.dart' as http;

import '../../model/auth/status_model.dart';
import '../../model/checkout/cart_model.dart';
import '../../unit.dart';

class CheckoutApi {
  static var client = http.Client();
  static Future<CartModel?> getCart({String? token}) async {
    var response = await client.get(Uri.parse('$url/api/v1/shopping-cart'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      return cartModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<StatusModel?> addToCart({
    String? id,
    String? token,
    String? qty,
  }) async {
    var response = await client
        .post(Uri.parse('$url/api/v1/shopping-cart/store'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
      'Authorization': 'Bearer $token'
    }, body: {
      'product_id[]': id,
      'qty[]': qty,
    });
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<StatusModel?> deleteProductCart(
      {String? token, String? id}) async {
    var response = await client
        .delete(Uri.parse('$url/api/v1/shopping-cart/delete'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
      'Authorization': 'Bearer $token',
    }, body: {
      'id[]': id,
    });

    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<StatusModel?> updateCart(
      {String? id, String? qty, String? token}) async {
    var response = await client
        .post(Uri.parse('$url/api/v1/shopping-cart/update'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
      'Authorization': 'Bearer $token',
      'X-HTTP-Method-Override': 'PUT',
    }, body: {
      'id[]': id,
      'qty[]': qty,
    });

    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<StatusModel?> checkout(
      {String? fullName,
      String? phone,
      String? email,
      String? address,
      String? token}) async {
    var response =
        await client.post(Uri.parse('$url/api/v1/order/store'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
      'Authorization': 'Bearer $token',
    }, body: {
      "customer_fullname": fullName,
      "customer_phone": phone,
      "customer_email": email,
      "shipping_address": address
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
