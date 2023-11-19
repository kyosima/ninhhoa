import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/register_controller.dart';
import '../../unit.dart';
import '../../widget/custom_text.dart';

class RegisterPage extends StatelessWidget {
  final controller = Get.put(RegisterController());
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: w * 0.35,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CText(
                  text: 'Đăng ký',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: pColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.fullNameController,
                  keyboardType: TextInputType.text,
                  cursorColor: pColor,
                  style: const TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    errorText:
                        controller.registerMessage.value?.fullname![0] != ''
                            ? controller.registerMessage.value?.fullname![0]
                            : null,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: const Icon(
                      Icons.person_outline_outlined,
                    ),
                    hintText: "Họ và tên",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  cursorColor: pColor,
                  style: const TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    errorText: controller.registerMessage.value?.phone![0] != ''
                        ? controller.registerMessage.value?.phone![0]
                        : null,
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
                TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: pColor,
                  style: const TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    errorText: controller.registerMessage.value?.email![0] != ''
                        ? controller.registerMessage.value?.email![0]
                        : null,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  cursorColor: pColor,
                  style: const TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    errorText:
                        controller.registerMessage.value?.password![0] != ''
                            ? controller.registerMessage.value?.password![0]
                            : null,
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
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: true,
                  cursorColor: pColor,
                  style: const TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    errorText: controller.registerMessage.value
                                ?.passwordConfirmation![0] !=
                            ''
                        ? controller
                            .registerMessage.value?.passwordConfirmation![0]
                        : null,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    hintText: "Xác nhận mật khẩu",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: w * 0.5,
                  height: h * 0.05,
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.fullNameController.text.isEmpty ||
                          controller.passwordController.text.isEmpty ||
                          controller.emailController.text.isEmpty ||
                          controller.passwordController.text.isEmpty ||
                          controller.confirmPasswordController.text.isEmpty) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Lỗi',
                          desc: 'Không được bỏ trống các trường bắt buộc!',
                          btnOkOnPress: () {},
                        ).show();
                      } else {
                        controller.register(
                          fullname: controller.fullNameController.text,
                          phone: controller.phoneController.text,
                          email: controller.emailController.text,
                          password: controller.passwordController.text,
                          confirmPassword:
                              controller.confirmPasswordController.text,
                        );
                      }
                    },
                    child: controller.isLoading.value == false
                        ? const Text('Đăng ký')
                        : const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Quay lại trang đăng nhập!'),
                    TextButton(
                        onPressed: () {
                          Get.offAllNamed('/login');
                        },
                        child: CText(
                          text: 'Đăng nhập',
                          fontSize: 13,
                          color: pColor,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
