import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/user/change_password_controller.dart';
import '../../unit.dart';
import '../../widget/custom_text.dart';

class ChangePasswordPage extends StatelessWidget {
  final controller = Get.put(ChangePasswordController());
  ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thay đổi mật khẩu'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kWidth * 0.04),
          child: SizedBox(
            height: kHeight * 0.7,
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CText(
                    text: 'Đổi mật khẩu',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: controller.oldPasswordController,
                    keyboardType: TextInputType.text,
                    cursorColor: pColor,
                    obscureText: controller.obsTextOldPass.value,
                    style: const TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      labelText: "Mật khẩu cũ",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: const TextStyle(
                        color: pColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.changeObsTextOldPass();
                          },
                          icon: Icon(
                            controller.obsTextOldPass.value == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: controller.newPasswordController,
                    keyboardType: TextInputType.text,
                    cursorColor: pColor,
                    obscureText: controller.obsTextNewPass.value,
                    style: const TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      labelText: "Mật khẩu mới",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: const TextStyle(
                        color: pColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.changeObsTextNewPass();
                          },
                          icon: Icon(controller.obsTextNewPass.value == true
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: const Icon(
                        Icons.lock_reset,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: controller.confirmPasswordController,
                    keyboardType: TextInputType.text,
                    cursorColor: pColor,
                    obscureText: controller.obsTextCfPass.value,
                    style: const TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      labelText: "Xác nhận mật khẩu",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: const TextStyle(
                        color: pColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.changeObsTextCfPass();
                          },
                          icon: Icon(controller.obsTextCfPass.value == true
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: const Icon(
                        Icons.lock_reset,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                        height: kHeight * 0.05,
                        width: kWidth * 0.4,
                        child: ElevatedButton(
                            onPressed: () {
                              controller.updatePassword(
                                oldPassword:
                                    controller.oldPasswordController.text,
                                newPassword:
                                    controller.newPasswordController.text,
                                confirmPassword:
                                    controller.confirmPasswordController.text,
                              );
                            },
                            child: controller.isLoading.value == false
                                ? const Text('Xác nhận')
                                : const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
