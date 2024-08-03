import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/reset_password_controller.dart';
import '../../unit.dart';
import '../../widget/custom_text.dart';

class ForgetPasswordPage extends StatelessWidget {
  final controller = Get.put(ResetPasswordController());
  ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: h * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: w * 0.45,
                  ),
                  CText(
                    text: 'Quên mật khẩu?',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: pColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Nhập email đã liên kết với tài khoản của bạn!'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: pColor,
                    style: const TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: const Icon(
                        Icons.email,
                      ),
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Obx(
                    () => SizedBox(
                      width: w * 0.4,
                      height: h * 0.05,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.resetPassword(
                              email: controller.emailController.text);
                        },
                        child: controller.isLoading.value == false
                            ? const Text('Gửi mã')
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
