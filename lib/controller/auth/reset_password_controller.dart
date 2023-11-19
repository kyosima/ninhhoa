import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/auth/auth_service.dart';

class ResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ResetPasswordController());
  }
}

class ResetPasswordController extends GetxController {
  final emailController = TextEditingController();
  final isLoading = false.obs;

  void resetPassword({String? email}) async {
    isLoading.value = true;
    var response = await AuthApi.resetPassword(email: email);
    isLoading.value = false;
    if (response?.status == 200) {
      Get.back();
      Get.snackbar(
          'Thao tác thành công', 'Link đổi mật khẩu đã được gửi về email',
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ));
    } else {
      Get.snackbar('Thao tác không thành công', 'Vui lòng nhập lại email',
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ));
    }
  }
}
