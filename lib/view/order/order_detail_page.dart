import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vincare/controller/order/order_detail_controller.dart';
import 'package:vincare/unit.dart';
import 'package:vincare/widget/custom_text.dart';

class OrderDetailPage extends StatelessWidget {
  final controller = Get.put(OrderDetailController());
  OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết đơn hàng'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (controller.isLoading.value) {
            return SizedBox(
              height: kHeight * 0.8,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(kWidth * 0.05),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CText(
                            text: 'Thông tin người nhận',
                            fontWeight: FontWeight.bold,
                            color: pColor,
                            fontSize: 17,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              CText(
                                text: 'Họ và tên:',
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CText(
                                text:
                                    '${controller.orderDetail.value?.customerFullname}',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              CText(
                                text: 'Số điện thoại:',
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CText(
                                text:
                                    '${controller.orderDetail.value?.customerPhone}',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              CText(
                                text: 'Email:',
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CText(
                                text:
                                    '${controller.orderDetail.value?.customerEmail}',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              CText(
                                text: 'Địa chỉ:',
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CText(
                                text:
                                    '${controller.orderDetail.value?.shippingAddress}',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CText(
                            text: 'Thông tin đơn hàng',
                            fontWeight: FontWeight.bold,
                            color: pColor,
                            fontSize: 17,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CText(
                                text:
                                    'Mã đơn hàng: #${controller.orderDetail.value?.id}',
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              CText(
                                text: DateFormat('dd/MM/yyyy').format(
                                    DateTime.parse(controller
                                        .orderDetail.value!.createdAt
                                        .toString())),
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ],
                          ),
                          Divider(
                            height: 40,
                            color: Colors.grey,
                          ),
                          CText(
                            text:
                                'Tổng giá trị: ${NumberFormat.currency(locale: 'vi').format(controller.orderDetail.value?.total)}',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: pColor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CText(
                            text:
                                'Giảm giá: ${NumberFormat.currency(locale: 'vi').format(controller.orderDetail.value?.discount)}',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CText(
                            text:
                                'Tổng: ${NumberFormat.currency(locale: 'vi').format(controller.orderDetail.value?.total)}',
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 16,
                          ),
                          Divider(
                            height: 40,
                            color: Colors.grey,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller.orderDetail.value?.details!.length,
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.blue.withOpacity(0.3)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              '${controller.orderDetail.value?.details![index].featureImage}',
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CText(
                                                  text:
                                                      '${controller.orderDetail.value?.details![index].name}',
                                                  fontSize:
                                                      kWidth < 600 ? 16 : 21,
                                                  maxLine: 2,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                CText(
                                                  text: NumberFormat.currency(
                                                          locale: 'vi')
                                                      .format(controller
                                                              .orderDetail
                                                              .value
                                                              ?.details![index]
                                                              .unitPricePurchaseQty ??
                                                          controller
                                                              .orderDetail
                                                              .value
                                                              ?.details![index]
                                                              .unitPrice),
                                                  color: pColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                CText(
                                                  text:
                                                      'x${controller.orderDetail.value?.details![index].qty}',
                                                  color: Colors.red,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
