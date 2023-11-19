import 'package:http/http.dart' as http;

import '../../model/order/order_detail_model.dart';
import '../../model/order/order_model.dart';
import '../../unit.dart';

class OrderApi {
  static final client = http.Client();
  static Future<OrderModel?> getOrder({String? status, String? token}) async {
    var response = await client
        .get(Uri.parse('$url/api/v1/order?status=$status'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return orderModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<OrderDetail?> getOrderDetail(
      {String? id, String? token}) async {
    var response =
        await client.get(Uri.parse('$url/api/v1/order/show/$id'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return orderDetailFromJson(response.body);
    } else {
      return null;
    }
  }
}
