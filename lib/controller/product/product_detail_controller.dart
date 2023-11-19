import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/checkout/checkout_service.dart';
import '../../api/product/product_service.dart';
import '../../model/product/product_detail_model.dart';
import '../../model/product/review_model.dart';
import '../home/home_controller.dart';

class ProductDetailBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProductDetailController());
  }
}

class ProductDetailController extends GetxController {
  final quantity = 1.obs;
  final selectedColor = 0.obs;
  final selectedCapacity = 0.obs;
  final isLoading = false.obs;
  final productDetail = ProductDetailModel().data.obs;
  final id = Get.arguments.toString();
  final isLoadingUpdate = false.obs;
  final isLoadingButton = false.obs;
  final isLoadingReview = false.obs;
  final review = ReviewModel().data.obs;
  final reviewRating = 0.obs;
  final reviewContent = TextEditingController();
  final tokenKey = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductDetail();
    getReview();
    getToken();
  }

  void getToken() async {
    final prefs = await SharedPreferences.getInstance();
    tokenKey.value = prefs.getString('token') ?? '';
  }

  void getReview() async {
    try {
      isLoadingReview.value = true;
      var result = await ProductApi.getReview(id: id);
      review.value = result?.data;
    } finally {
      isLoadingReview.value = false;
    }
  }

  double average() {
    var a = 0.0;
    for (var i = 0; i < review.value!.length; i++) {
      a += (review.value![i].rating!.toDouble()) / review.value!.length;
    }
    return a;
  }

  void addToCart({String? qty}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    isLoadingButton.value = true;
    var result = await CheckoutApi.addToCart(
      id: id,
      token: token,
      qty: qty,
    );
    if (result?.status == 200) {
      isLoadingButton.value = false;
      Get.snackbar(
        'Thành công',
        'Sản phẩm đã được thêm vào giỏ hàng',
        icon: Icon(
          Icons.check_box,
          color: Colors.green,
        ),
        backgroundColor: Colors.white.withOpacity(0.6),
      );
      final controller = Get.find<HomeController>();
      controller.getCart();
    } else {
      isLoadingButton.value = false;
      Get.snackbar(
        'Thất bại',
        'Server đang bị lỗi, xin vui lòng thử lại',
        icon: Icon(
          Icons.error,
          color: Colors.red,
        ),
        backgroundColor: Colors.white.withOpacity(0.6),
      );
    }
  }

  void updateProduct(
      {String? variationCapacity, String? variationColor}) async {
    try {
      isLoadingUpdate.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      await ProductApi.getVariation(
          id: id,
          variationCapacity: variationCapacity,
          variationColors: variationColor,
          token: token);
    } finally {
      isLoadingUpdate.value = false;
    }
  }

  void getProductDetail() async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var response = await ProductApi.getProductDetail(id: id, token: token);
      productDetail.value = response?.data;
    } finally {
      isLoading.value = false;
    }
  }

  void decreaseQuantity() {
    quantity.value = quantity.value - 1;
    if (quantity.value < 1) {
      quantity.value = 1;
    }
  }

  void increaseQuantity() {
    quantity.value = quantity.value + 1;
  }

  void reviewProduct({String? rating, String? content}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var result = await ProductApi.reviewProduct(
        token: token, id: id, rating: rating, content: content);
    if (result?.status == 200) {
      Get.snackbar('Thành công', 'Đã đánh giá sản phẩm',
          backgroundColor: Colors.white.withOpacity(0.5),
          icon: Icon(
            Icons.check_box,
            color: Colors.green,
          ));
      getReview();
      getProductDetail();
    }
  }
}
