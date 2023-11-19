import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/order/order_service.dart';
import '../../model/order/order_detail_model.dart';

class OrderDetailBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => OrderDetailController());
  }
}

class OrderDetailController extends GetxController {
  final isLoading = false.obs;
  final orderDetail = OrderDetail().data.obs;
  final id = Get.arguments.toString();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getOrderDetail();
  }

  void getOrderDetail() async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var result = await OrderApi.getOrderDetail(id: id, token: token);
      orderDetail.value = result?.data;
    } finally {
      isLoading.value = false;
    }
  }
}
