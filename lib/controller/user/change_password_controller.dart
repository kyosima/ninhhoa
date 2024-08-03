import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/user/user_service.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ChangePasswordController());
  }
}

class ChangePasswordController extends GetxController {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final obsTextOldPass = true.obs;
  final obsTextNewPass = true.obs;
  final obsTextCfPass = true.obs;
  final isLoading = false.obs;
  void changeObsTextOldPass() {
    obsTextOldPass.value = !obsTextOldPass.value;
  }

  void changeObsTextNewPass() {
    obsTextNewPass.value = !obsTextNewPass.value;
  }

  void changeObsTextCfPass() {
    obsTextCfPass.value = !obsTextCfPass.value;
  }

  void updatePassword(
      {String? oldPassword,
      String? newPassword,
      String? confirmPassword}) async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token').toString();
    var response = await UserService.updatePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
        token: token);
    if (oldPasswordController.text.isEmpty ||
        newPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
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
    } else {
      if (newPasswordController.text != confirmPasswordController.text) {
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Thất bại',
          desc: 'Xác nhận mật khẩu không đúng',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();
        isLoading.value = false;
      } else if (response?.status == 200) {
        Get.back();
        Get.snackbar('Thành công', 'Mật khẩu mới đã được cập nhật',
            backgroundColor: Colors.white.withOpacity(0.5),
            icon: const Icon(
              Icons.check_circle,
              color: Colors.green,
            ));
        isLoading.value = false;
      } else {
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Thất bại',
          desc: 'Mật khẩu cũ không đúng',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();

        isLoading.value = false;
      }
    }
  }
}
