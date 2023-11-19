import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/checkout/checkout_service.dart';
import '../../model/checkout/cart_model.dart';
import '../home/home_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartController());
  }
}

class CartController extends GetxController {
  final isLoadingCart = false.obs;
  final cart = CartModel().data.obs;

  final t = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCart();
  }

  int sumTotal() {
    var a = 0;
    for (var i = 0; i < cart.value!.length; i++) {
      a += (cart.value![i].product?.pricePromotion == null
              ? cart.value![i].product!.price!.toInt()
              : (cart.value![i].product?.purchaseQty == null
                  ? cart.value![i].product!.pricePromotion!.toInt()
                  : cart.value![i].product!.price!.toInt())) *
          int.parse(cart.value![i].qty.toString());
    }
    return a;
  }

  double sumDiscount() {
    var b = 0.0;
    for (var i = 0; i < cart.value!.length; i++) {
      b += cart.value![i].product?.purchaseQty?.type == 1
          ? (cart.value![i].product!.purchaseQty!.plainValue!)
          : (cart.value![i].product!.price! *
              (cart.value![i].product?.purchaseQty == null
                  ? 0
                  : cart.value![i].product!.purchaseQty!.plainValue! / 100) *
              double.parse(cart.value![i].qty.toString()));
    }
    return b;
  }

  void getCart() async {
    try {
      isLoadingCart.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      print(token);
      var response = await CheckoutApi.getCart(token: token);
      cart.value = response?.data;
    } finally {
      isLoadingCart.value = false;
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
    getCart();
    final controller = Get.find<HomeController>();
    controller.getCart();
  }
}
