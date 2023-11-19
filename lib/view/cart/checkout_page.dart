import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/cart/checkout_controller.dart';
import '../../unit.dart';
import '../../widget/custom_text.dart';

class CheckoutPage extends StatelessWidget {
  final controller = Get.put(CheckoutController());
  final cart = Get.arguments[0];
  final total = Get.arguments[1];
  CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt hàng'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: kHeight * 0.09,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CText(
                      text: 'Tổng thanh toán',
                      fontWeight: FontWeight.w500,
                      fontSize: kWidth < 600 ? 16 : 21,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CText(
                      text: NumberFormat.currency(locale: 'vi').format(
                          total - controller.discount.value < 0
                              ? 0
                              : total - controller.discount.value),
                      color: pColor,
                      fontWeight: FontWeight.w600,
                      fontSize: kWidth < 600 ? 16 : 21,
                    )
                  ],
                ),
                SizedBox(
                  height: kWidth < 600 ? 45 : 75,
                  width: kWidth * 0.45,
                  child: Obx(
                    () => ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(pColor)),
                      onPressed: () {
                        if (controller.fullNameController.text.isEmpty ||
                            controller.emailController.text.isEmpty ||
                            controller.phoneController.text.isEmpty ||
                            controller.addressController.text.isEmpty) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Thất bại',
                            desc: 'Vui lòng nhập đầy đủ thông tin',
                            btnOkOnPress: () {},
                          ).show();
                        } else {
                          controller.checkout(
                            fullName: controller.fullNameController.text,
                            email: controller.emailController.text,
                            phone: controller.phoneController.text,
                            address: controller.addressController.text,
                          );
                        }
                      },
                      child: controller.isLoading.value == true
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              'Xác nhận',
                              style: TextStyle(
                                fontSize: kWidth < 600 ? 16 : 21,
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kWidth * 0.04),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cart!.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(color: Colors.blue.withOpacity(0.3)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  '${cart[index].product?.featureImage}',
                                  width: kWidth * 0.2,
                                  height: kWidth * 0.2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CText(
                                      text: '${cart![index].product?.name}',
                                      fontSize: kWidth < 600 ? 16 : 21,
                                      maxLine: 2,
                                      textOverflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    cart![index].product?.purchaseQty == null
                                        ? cart![index]
                                                    .product
                                                    ?.pricePromotion ==
                                                null
                                            ? CText(
                                                text: NumberFormat.currency(
                                                        locale: 'vi')
                                                    .format(cart![index]
                                                        .product
                                                        ?.price),
                                                color: pColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              )
                                            : Row(
                                                children: [
                                                  CText(
                                                    text: NumberFormat.currency(
                                                            locale: 'vi')
                                                        .format(cart![index]
                                                            .product
                                                            ?.pricePromotion),
                                                    color: pColor,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  CText(
                                                    text: NumberFormat.currency(
                                                            locale: 'vi')
                                                        .format(cart![index]
                                                            .product
                                                            ?.price),
                                                    color: Colors.grey,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    textDecoration:
                                                        TextDecoration
                                                            .lineThrough,
                                                  ),
                                                ],
                                              )
                                        : CText(
                                            text: NumberFormat.currency(
                                                    locale: 'vi')
                                                .format(cart![index]
                                                    .product
                                                    ?.price),
                                            color: pColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CText(
                                      text: 'x${cart![index].qty}',
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    cart![index].product?.purchaseQty != null
                                        ? cart![index]
                                                    .product
                                                    ?.purchaseQty
                                                    ?.type ==
                                                1
                                            ? CText(
                                                text:
                                                    'Giảm giá ${NumberFormat.currency(locale: 'vi').format(cart![index].product?.purchaseQty?.plainValue)}',
                                              )
                                            : CText(
                                                text:
                                                    'Giảm giá ${cart![index].product?.purchaseQty?.plainValue} %',
                                              )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: kWidth,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CText(
                            text: 'Tổng',
                            fontWeight: FontWeight.w700,
                            fontSize: kWidth < 600 ? 16 : 21,
                          ),
                          CText(
                            text: NumberFormat.currency(locale: 'vi')
                                .format(total),
                            fontWeight: FontWeight.w700,
                            color: pColor,
                            fontSize: kWidth < 600 ? 16 : 21,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CText(
                            text: 'Giảm giá thành viên',
                            fontWeight: FontWeight.w700,
                            fontSize: kWidth < 600 ? 16 : 21,
                          ),
                          CText(
                            text: NumberFormat.currency(locale: 'vi')
                                .format(controller.discount.value),
                            fontWeight: FontWeight.w700,
                            color: Colors.red,
                            fontSize: kWidth < 600 ? 16 : 21,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Container(
                  width: kWidth,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CText(
                          text: 'Thông tin người đặt',
                          fontWeight: FontWeight.w700,
                          fontSize: kWidth < 600 ? 16 : 21,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          style: TextStyle(
                            fontSize: kWidth < 600 ? 16 : 21,
                          ),
                          controller: controller.fullNameController
                            ..text = '${controller.fullName}',
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Họ và tên',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: TextStyle(
                            fontSize: kWidth < 600 ? 16 : 21,
                          ),
                          controller: controller.phoneController
                            ..text = '${controller.phone}',
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              hintText: 'Số điện thoại'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: TextStyle(
                            fontSize: kWidth < 600 ? 16 : 21,
                          ),
                          controller: controller.emailController
                            ..text = '${controller.email}',
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email), hintText: 'Email'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: kWidth,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CText(
                        text: 'Địa chỉ người đặt',
                        fontWeight: FontWeight.w700,
                        fontSize: kWidth < 600 ? 16 : 21,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: kWidth < 600 ? 16 : 21,
                        ),
                        controller: controller.addressController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.location_on),
                            hintText: 'Địa chỉ'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
