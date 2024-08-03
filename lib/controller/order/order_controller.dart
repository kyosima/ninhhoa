import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/order/order_service.dart';
import '../../model/order/order_model.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => OrderController());
  }
}

class OrderController extends GetxController {
  final isLoadingProcessingOrder = false.obs;
  final processingOrder = OrderModel().data.obs;
  final isLoadingProcessedOrder = false.obs;
  final processedOrder = OrderModel().data.obs;
  final isLoadingDoneOrder = false.obs;
  final doneOrder = OrderModel().data.obs;
  final isLoadingCancelOrder = false.obs;
  final cancelOrder = OrderModel().data.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProcessingOrder();
    getProcessedOrder();
    getDoneOrder();
    getCancelOrder();
  }

  void getProcessingOrder() async {
    try {
      isLoadingProcessingOrder.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var result = await OrderApi.getOrder(
        status: '1',
        token: token,
      );
      processingOrder.value = result?.data;
    } finally {
      isLoadingProcessingOrder.value = false;
    }
  }

  void getProcessedOrder() async {
    try {
      isLoadingProcessedOrder.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var result = await OrderApi.getOrder(
        status: '2',
        token: token,
      );
      processedOrder.value = result?.data;
    } finally {
      isLoadingProcessedOrder.value = false;
    }
  }

  void getDoneOrder() async {
    try {
      isLoadingDoneOrder.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var result = await OrderApi.getOrder(
        status: '3',
        token: token,
      );
      doneOrder.value = result?.data;
    } finally {
      isLoadingDoneOrder.value = false;
    }
  }

  void getCancelOrder() async {
    try {
      isLoadingCancelOrder.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var result = await OrderApi.getOrder(
        status: '4',
        token: token,
      );
      cancelOrder.value = result?.data;
    } finally {
      isLoadingCancelOrder.value = false;
    }
  }
}
