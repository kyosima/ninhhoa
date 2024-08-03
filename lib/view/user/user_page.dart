import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/user/user_info_controller.dart';
import '../../unit.dart';
import '../../widget/custom_text.dart';

class UserPage extends StatelessWidget {
  final controller = Get.put(UserInfoController());
  UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tài khoản'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(kWidth * 0.04),
        child: Obx(() {
          if (controller.isLoadingInfo.value) {
            return SizedBox(
              height: kHeight * 0.8,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    // InkWell(
                    //   onTap: () {
                    //     Get.toNamed('/forgetPassword');
                    //   },
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Row(
                    //         children: [
                    //           const Icon(
                    //             Icons.password,
                    //             color: pColor,
                    //           ),
                    //           const SizedBox(
                    //             width: 10,
                    //           ),
                    //           Column(
                    //             crossAxisAlignment:
                    //             CrossAxisAlignment.start,
                    //             children: [
                    //               CText(
                    //                 text: 'Quên mật khẩu',
                    //                 fontWeight: FontWeight.w500,
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //       const Icon(
                    //         Icons.chevron_right,
                    //         color: Colors.grey,
                    //         size: 20,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // const Divider(
                    //   color: Colors.grey,
                    //   height: 40,
                    // ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/privacyPolicy');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.policy,
                                color: pColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  CText(
                                    text: 'Chính sách bảo mật',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
            // if (controller.userInfo.value == null) {
            //   return Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Container(
            //         decoration: BoxDecoration(
            //           color: Colors.grey.withOpacity(0.15),
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(15.0),
            //           child: InkWell(
            //             onTap: () {
            //               Get.toNamed(
            //                 '/login',
            //               );
            //             },
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Row(
            //                   children: [
            //                     const Icon(
            //                       Icons.person_pin,
            //                       size: 50,
            //                     ),
            //                     const SizedBox(
            //                       width: 10,
            //                     ),
            //                     CText(
            //                       text: 'Đăng nhập',
            //                       fontWeight: FontWeight.w600,
            //                       fontSize: 16,
            //                     ),
            //                   ],
            //                 ),
            //                 const Icon(Icons.chevron_right),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       Container(
            //         decoration: BoxDecoration(
            //           color: Colors.grey.withOpacity(0.15),
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(15.0),
            //           child: Column(
            //             children: [
            //               InkWell(
            //                 onTap: () {
            //                   Get.toNamed('/forgetPassword');
            //                 },
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         const Icon(
            //                           Icons.password,
            //                           color: pColor,
            //                         ),
            //                         const SizedBox(
            //                           width: 10,
            //                         ),
            //                         Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             CText(
            //                               text: 'Quên mật khẩu',
            //                               fontWeight: FontWeight.w500,
            //                             ),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                     const Icon(
            //                       Icons.chevron_right,
            //                       color: Colors.grey,
            //                       size: 20,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const Divider(
            //                 color: Colors.grey,
            //                 height: 40,
            //               ),
            //               InkWell(
            //                 onTap: () {
            //                   Get.toNamed('/privacyPolicy');
            //                 },
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         const Icon(
            //                           Icons.policy,
            //                           color: pColor,
            //                         ),
            //                         const SizedBox(
            //                           width: 10,
            //                         ),
            //                         Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             CText(
            //                               text: 'Chính sách bảo mật',
            //                               fontWeight: FontWeight.w500,
            //                             ),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                     const Icon(
            //                       Icons.chevron_right,
            //                       color: Colors.grey,
            //                       size: 20,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   );
            // } else {
            //   return Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Container(
            //         decoration: BoxDecoration(
            //           color: Colors.grey.withOpacity(0.15),
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(15.0),
            //           child: InkWell(
            //             onTap: () {
            //               Get.toNamed('/userInfoPage',
            //                   arguments: controller.userInfo.value);
            //             },
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Row(
            //                   children: [
            //                     const Icon(
            //                       Icons.person_pin,
            //                       size: 50,
            //                     ),
            //                     const SizedBox(
            //                       width: 10,
            //                     ),
            //                     Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         CText(
            //                           text:
            //                               '${controller.userInfo.value?.fullname}',
            //                           fontWeight: FontWeight.w600,
            //                           fontSize: 16,
            //                         ),
            //                         const SizedBox(
            //                           height: 5,
            //                         ),
            //                         CText(
            //                           text: controller.userInfo.value?.level ==
            //                                   null
            //                               ? 'Thành viên'
            //                               : 'Thành viên ${controller.userInfo.value?.level?.name}',
            //                           fontSize: 14,
            //                           color: pColor,
            //                           textDecoration: TextDecoration.underline,
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //                 const Icon(Icons.chevron_right),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       Container(
            //         decoration: BoxDecoration(
            //           color: Colors.grey.withOpacity(0.15),
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(15.0),
            //           child: Column(
            //             children: [
            //               InkWell(
            //                 onTap: () {
            //                   Get.toNamed('/changePassword');
            //                 },
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         const Icon(
            //                           Icons.lock_reset,
            //                           color: pColor,
            //                         ),
            //                         const SizedBox(
            //                           width: 10,
            //                         ),
            //                         Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             CText(
            //                               text: 'Đổi mật khẩu',
            //                               fontWeight: FontWeight.w500,
            //                             ),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                     const Icon(
            //                       Icons.chevron_right,
            //                       color: Colors.grey,
            //                       size: 20,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const Divider(
            //                 color: Colors.grey,
            //                 height: 40,
            //               ),
            //               InkWell(
            //                 onTap: () {
            //                   Get.toNamed('/forgetPassword');
            //                 },
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         const Icon(
            //                           Icons.password,
            //                           color: pColor,
            //                         ),
            //                         const SizedBox(
            //                           width: 10,
            //                         ),
            //                         Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             CText(
            //                               text: 'Quên mật khẩu',
            //                               fontWeight: FontWeight.w500,
            //                             ),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                     const Icon(
            //                       Icons.chevron_right,
            //                       color: Colors.grey,
            //                       size: 20,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const Divider(
            //                 color: Colors.grey,
            //                 height: 40,
            //               ),
            //               InkWell(
            //                 onTap: () {
            //                   Get.toNamed('/orderHistory');
            //                 },
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         const Icon(
            //                           Icons.shopping_cart_sharp,
            //                           color: pColor,
            //                         ),
            //                         const SizedBox(
            //                           width: 10,
            //                         ),
            //                         Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             CText(
            //                               text: 'Đơn hàng của tôi',
            //                               fontWeight: FontWeight.w500,
            //                             ),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                     const Icon(
            //                       Icons.chevron_right,
            //                       color: Colors.grey,
            //                       size: 20,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const Divider(
            //                 color: Colors.grey,
            //                 height: 40,
            //               ),
            //               InkWell(
            //                 onTap: () {
            //                   Get.toNamed('/privacyPolicy');
            //                 },
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         const Icon(
            //                           Icons.policy,
            //                           color: pColor,
            //                         ),
            //                         const SizedBox(
            //                           width: 10,
            //                         ),
            //                         Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             CText(
            //                               text: 'Chính sách bảo mật',
            //                               fontWeight: FontWeight.w500,
            //                             ),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                     const Icon(
            //                       Icons.chevron_right,
            //                       color: Colors.grey,
            //                       size: 20,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       Container(
            //         decoration: BoxDecoration(
            //           color: Colors.grey.withOpacity(0.15),
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(15.0),
            //           child: Column(
            //             children: [
            //               InkWell(
            //                 onTap: () {
            //                   showCupertinoDialog(
            //                       context: Get.context!,
            //                       builder: (BuildContext context) {
            //                         return CupertinoAlertDialog(
            //                           title: CText(
            //                             text: 'Xóa tài khoản?',
            //                           ),
            //                           content: const Text(
            //                               'Yêu cầu xóa tài khoản sẽ được gửi đến Admin'),
            //                           actions: [
            //                             TextButton(
            //                               onPressed: () {
            //                                 Get.back();
            //                               },
            //                               child: const Text('Không'),
            //                             ),
            //                             TextButton(
            //                               onPressed: () {},
            //                               child: const Text('Ok'),
            //                             )
            //                           ],
            //                         );
            //                       });
            //                 },
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         const Icon(
            //                           Icons.delete,
            //                           color: pColor,
            //                         ),
            //                         const SizedBox(
            //                           width: 10,
            //                         ),
            //                         Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             CText(
            //                               text: 'Yêu cầu xóa tài khoản',
            //                               fontWeight: FontWeight.w500,
            //                             ),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                     const Icon(
            //                       Icons.chevron_right,
            //                       color: Colors.grey,
            //                       size: 20,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const Divider(
            //                 color: Colors.grey,
            //                 height: 40,
            //               ),
            //               InkWell(
            //                 onTap: () async {
            //                   final prefs =
            //                       await SharedPreferences.getInstance();
            //                   await prefs.remove('id');
            //                   await prefs.remove('token');
            //                   Get.deleteAll();
            //                   Get.offAndToNamed('/dashboardPage');
            //                 },
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         const Icon(
            //                           Icons.logout,
            //                           color: pColor,
            //                         ),
            //                         const SizedBox(
            //                           width: 10,
            //                         ),
            //                         Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             CText(
            //                               text: 'Đăng xuất',
            //                               fontWeight: FontWeight.w500,
            //                             ),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   );
            // }
          }
        }),
      )),
    );
  }
}
