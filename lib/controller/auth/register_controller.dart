import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/auth/auth_service.dart';
import '../../model/auth/register_model.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RegisterController());
  }
}

class RegisterController extends GetxController {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final isLoading = false.obs;
  final registerMessage = RegisterModel().messageValidate.obs;

  void register(
      {String? fullname,
      String? phone,
      String? email,
      String? password,
      String? confirmPassword}) async {
    isLoading.value = true;
    var response = await AuthApi.register(
      fullName: fullname,
      phone: phone,
      email: email,
      passWord: password,
      confirmPassword: confirmPassword,
    );
    registerMessage.value = response?.messageValidate;
    isLoading.value = false;

    if (response?.status == 200) {
      Get.snackbar('Thành công', 'Tài khoản đã được đăng ký',
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ));
    } else {
      Get.snackbar('Không thành công', 'Server đang bị gián đoạn',
          icon: const Icon(
            Icons.check_circle,
            color: Colors.red,
          ));
    }
  }
}
