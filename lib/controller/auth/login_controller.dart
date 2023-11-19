import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/auth/auth_service.dart';
import '../../api/user/user_service.dart';
import '../../model/auth/login_model.dart';
import '../home/home_controller.dart';
import '../user/user_info_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginController());
  }
}

class LoginController extends GetxController {
  final obscureText = true.obs;
  final isLoading = false.obs;
  final token = LoginModel().accessToken.obs;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  void changeObsText() {
    obscureText.value = !obscureText.value;
  }

  void login({String? userName, String? password}) async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    var response = await AuthApi.login(userName: userName, password: password);
    prefs.setString('token', response?.accessToken ?? '');
    print(response?.accessToken);
    if (response?.status == 200) {
      final result =
          await UserService.getUserInfo(accessToken: response?.accessToken);
      prefs.setInt('id', result!.data?.id ?? 0);
      final controller = Get.put(UserInfoController());
      controller.getUserInfo();
      final homeController = Get.put(HomeController());
      homeController.getUserInfo();
      homeController.getCart();
      Get.offAllNamed('/dashboardPage');
      Get.snackbar('Đăng nhập thành công', 'Chào mừng bạn đến với Vin Care',
          backgroundColor: Colors.white.withOpacity(0.5),
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ));
      isLoading.value = false;
    } else {
      Get.snackbar('Đăng nhập không thành công', 'Nhập lại tài khoản, mật khẩu',
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ));
      isLoading.value = false;
    }
  }
}
