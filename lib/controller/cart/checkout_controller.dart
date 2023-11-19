import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/checkout/checkout_service.dart';
import '../home/home_controller.dart';
import '../user/user_info_controller.dart';

class CheckoutBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CheckoutController());
  }
}

class CheckoutController extends GetxController {
  final fullName = ''.obs;
  final phone = ''.obs;
  final address = ''.obs;
  final email = ''.obs;
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final discount = 0.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInfo();
  }

  void getInfo() async {
    final controller = Get.find<UserInfoController>();
    fullName.value = controller.userInfo.value!.fullname!;
    phone.value = controller.userInfo.value!.username!;
    address.value = controller.userInfo.value?.address ?? '';
    email.value = controller.userInfo.value!.email!;
    discount.value = controller.userInfo.value?.level?.plainValue ?? 0;
    print(discount.value);
  }

  void checkout(
      {String? fullName, String? email, String? phone, String? address}) async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var result = await CheckoutApi.checkout(
      fullName: fullName,
      phone: phone,
      email: email,
      address: address,
      token: token,
    );

    if (result?.status == 200) {
      Get.snackbar('Thành công', 'Đơn hàng đã được đặt thành công',
          icon: Icon(
            Icons.check_box,
            color: Colors.green,
          ),
          backgroundColor: Colors.white.withOpacity(0.5));
      isLoading.value = false;
      final controller = Get.find<HomeController>();
      controller.getCart();
      Get.offAllNamed('/dashboardPage');
    }
  }
}
