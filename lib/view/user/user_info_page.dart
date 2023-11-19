import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/user/edit_user_info_controller.dart';
import '../../model/user/user_info_model.dart';
import '../../unit.dart';

class UserInfoPage extends StatelessWidget {
  final Data userInfo = Get.arguments;
  final controller = Get.put(EditUserController());
  UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin cá nhân'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kWidth * 0.04),
          child: SizedBox(
            height: kHeight,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Icon(
                    Icons.person_pin,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  enabled: false,
                  keyboardType: TextInputType.phone,
                  cursorColor: pColor,
                  style: const TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    labelText: "Số điện thoại",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: const TextStyle(
                      color: pColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: const Icon(
                      Icons.phone_android,
                    ),
                    hintText: "${userInfo.username}",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller.fullNameController
                    ..text = '${userInfo.fullname}',
                  keyboardType: TextInputType.text,
                  cursorColor: pColor,
                  style: const TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    labelText: "Họ và tên",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: const TextStyle(
                      color: pColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: const Icon(
                      Icons.person,
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
                  controller: controller.emailController
                    ..text = '${userInfo.email}',
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: pColor,
                  style: const TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    labelText: "Email",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: const TextStyle(
                      color: pColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    hintText: "${userInfo.email}",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller.addressController
                    ..text =
                        userInfo.address != null ? '${userInfo.address}' : '',
                  keyboardType: TextInputType.text,
                  cursorColor: pColor,
                  style: const TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    labelText: "Địa chỉ",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: const TextStyle(
                      color: pColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: const Icon(
                      Icons.location_on,
                    ),
                    hintText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => Center(
                    child: SizedBox(
                        height: kHeight * 0.05,
                        width: kWidth * 0.4,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.updateUserInfo(
                                fullName: controller.fullNameController.text,
                                email: controller.emailController.text,
                                address: controller.addressController.text);
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
                                ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
