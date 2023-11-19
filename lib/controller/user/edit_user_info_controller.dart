import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vincare/controller/user/user_info_controller.dart';

import '../../api/user/user_service.dart';
import '../home/home_controller.dart';

class EditUserBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => EditUserController());
  }
}

class EditUserController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final isLoading = false.obs;

  void updateUserInfo(
      {String? fullName, String? email, String? address}) async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token').toString();
    var response = await UserService.updateUserInfo(
      fullName: fullName,
      email: email,
      address: address,
      token: token,
    );
    if (fullNameController.text.isEmpty || emailController.text.isEmpty) {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Thất bại',
        desc: 'Vui lòng nhập các trường bắt buộc',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
      isLoading.value = false;
    } else if (response?.status == 200) {
      final controller = Get.find<UserInfoController>();
      controller.getUserInfo();
      final homeController = Get.find<HomeController>();
      homeController.getUserInfo();
      Get.snackbar('Thành công', 'Thông tin cá nhân đã được cập nhật',
          backgroundColor: Colors.white.withOpacity(0.5),
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ));
      isLoading.value = false;
    }
  }
}
