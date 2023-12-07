import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/checkout/checkout_service.dart';
import '../home/home_controller.dart';
import 'cart_controller.dart';

class CartDetailBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartDetailController());
  }
}

class CartDetailController extends GetxController {
  final qty = 1.obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    qty.value = Get.arguments.qty;
  }

  void increaseQty() {
    qty.value += 1;
  }

  void decreaseQty() {
    qty.value -= 1;
    if (qty.value <= 0) {
      qty.value = 0;
    }
  }

  void deleteProductCart({String? id}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var result = await CheckoutApi.deleteProductCart(token: token, id: id);
    if (result?.status == 200) {
      Get.snackbar('Thành công!', 'Giỏ hàng đã được cập nhật',
          icon: const Icon(Icons.check_circle, color: Colors.green),
          backgroundColor: Colors.white.withOpacity(0.5));
    } else {
      Get.snackbar('Thất bại!', 'Đã xãy ra lỗi, vui lòng thử lại',
          icon: const Icon(Icons.error, color: Colors.red),
          backgroundColor: Colors.white.withOpacity(0.5));
    }
    final controller = Get.find<HomeController>();
    final controllerCart = Get.find<CartController>();
    // controller.getCart();
    controllerCart.getCart();
  }

  void updateCart({String? id, String? qty}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    isLoading.value = true;
    var result = await CheckoutApi.updateCart(id: id, token: token, qty: qty);
    if (result?.status == 200) {
      Get.snackbar('Thành công!', 'Giỏ hàng đã được cập nhật',
          icon: const Icon(Icons.check_circle, color: Colors.green),
          backgroundColor: Colors.white.withOpacity(0.5));
      isLoading.value = false;
      final controllerCart = Get.find<CartController>();
      controllerCart.getCart();
    } else {
      Get.snackbar('Thất bại!', 'Đã xãy ra lỗi, vui lòng thử lại',
          icon: const Icon(Icons.error, color: Colors.red),
          backgroundColor: Colors.white.withOpacity(0.5));
      isLoading.value = false;
    }
  }
}
