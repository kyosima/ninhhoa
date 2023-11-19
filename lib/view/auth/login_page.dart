import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/login_controller.dart';
import '../../unit.dart';
import '../../widget/custom_text.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.1,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: w * 0.45,
                  ),
                ),
                CText(
                  text: 'Đăng nhập',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: pColor,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: controller.userNameController,
                  keyboardType: TextInputType.phone,
                  cursorColor: pColor,
                  style: const TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: const Icon(
                      Icons.phone_android,
                    ),
                    hintText: "Số điện thoại",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Obx(
                  () => TextFormField(
                    controller: controller.passwordController,
                    obscureText: controller.obscureText.value,
                    cursorColor: pColor,
                    style: const TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.changeObsText();
                        },
                        icon: Icon(controller.obscureText.value == true
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      hintText: "Mật khẩu",
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.toNamed('/forgetPassword');
                        },
                        child: CText(
                          text: 'Quên mật khẩu ? ',
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Obx(
                  () => SizedBox(
                    width: w * 0.5,
                    height: h * 0.05,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.userNameController.text.isEmpty ||
                            controller.passwordController.text.isEmpty) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Lỗi',
                            desc:
                                'Số điện thoại và mật khẩu không được bỏ trống!',
                            btnOkOnPress: () {},
                          ).show();
                        } else {
                          controller.login(
                            userName: controller.userNameController.text,
                            password: controller.passwordController.text,
                          );
                        }
                      },
                      child: controller.isLoading.value == false
                          ? const Text('Đăng nhập')
                          : const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Bạn chưa có tài khoản?'),
                    TextButton(
                        onPressed: () {
                          Get.offAllNamed('/register');
                        },
                        child: CText(
                          text: 'Đăng ký',
                          fontSize: 13,
                          color: pColor,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
