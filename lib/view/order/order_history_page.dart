import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vincare/controller/order/order_controller.dart';

import '../../unit.dart';
import '../../widget/custom_text.dart';

class OrderHistoryPage extends StatelessWidget {
  final controller = Get.put(OrderController());
  OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch sử đơn hàng'),
      ),
      body: Padding(
        padding: EdgeInsets.all(kWidth * 0.04),
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                backgroundColor: pColor,
                unselectedBackgroundColor: Colors.black45,
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                unselectedLabelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                borderWidth: 0,
                unselectedBorderColor: pColor,
                radius: 50,
                tabs: const [
                  Tab(
                    text: "Đang xử lý",
                  ),
                  Tab(
                    text: "Đã xử lý",
                  ),
                  Tab(
                    text: "Đã hoàn thành",
                  ),
                  Tab(
                    text: "Đã hủy",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Obx(() {
                      if (controller.isLoadingProcessingOrder.value) {
                        return SizedBox(
                            height: kHeight * 0.8,
                            child: Center(child: CircularProgressIndicator()));
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.processingOrder.value!.length,
                            itemBuilder: (BuildContext context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.toNamed('/orderDetail',
                                      arguments: controller
                                          .processingOrder.value![index].id);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.blue.withOpacity(0.3)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            '${controller.processingOrder.value![index].product?.featureImage}',
                                            width: kWidth * 0.2,
                                            height: kWidth * 0.2,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CText(
                                                text:
                                                    'Đơn hàng: #${controller.processingOrder.value![index].id}',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Colors.orange,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              CText(
                                                text: NumberFormat.currency(
                                                        locale: 'vi')
                                                    .format(controller
                                                        .processingOrder
                                                        .value![index]
                                                        .total),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: pColor,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              CText(
                                                text: DateFormat('dd/MM/yyyy')
                                                    .format(DateTime.parse(
                                                        controller
                                                            .processingOrder
                                                            .value![index]
                                                            .createdAt
                                                            .toString())),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
                    Obx(() {
                      if (controller.isLoadingProcessedOrder.value) {
                        return SizedBox(
                            height: kHeight * 0.8,
                            child: Center(child: CircularProgressIndicator()));
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.processedOrder.value!.length,
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
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          '${controller.processedOrder.value![index].product?.featureImage}',
                                          width: kWidth * 0.2,
                                          height: kWidth * 0.2,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CText(
                                              text:
                                                  'Đơn hàng: #${controller.processedOrder.value![index].id}',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: Colors.orange,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CText(
                                              text: NumberFormat.currency(
                                                      locale: 'vi')
                                                  .format(controller
                                                      .processedOrder
                                                      .value![index]
                                                      .total),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: pColor,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CText(
                                              text: DateFormat('dd/MM/yyyy')
                                                  .format(DateTime.parse(
                                                      controller
                                                          .processedOrder
                                                          .value![index]
                                                          .createdAt
                                                          .toString())),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
                    Obx(() {
                      if (controller.isLoadingDoneOrder.value) {
                        return SizedBox(
                            height: kHeight * 0.8,
                            child: Center(child: CircularProgressIndicator()));
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.doneOrder.value!.length,
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
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          '${controller.doneOrder.value![index].product?.featureImage}',
                                          width: kWidth * 0.2,
                                          height: kWidth * 0.2,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CText(
                                              text:
                                                  'Đơn hàng: #${controller.doneOrder.value![index].id}',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: Colors.orange,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CText(
                                              text: NumberFormat.currency(
                                                      locale: 'vi')
                                                  .format(controller
                                                      .processingOrder
                                                      .value![index]
                                                      .total),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: pColor,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CText(
                                              text: DateFormat('dd/MM/yyyy')
                                                  .format(DateTime.parse(
                                                      controller
                                                          .doneOrder
                                                          .value![index]
                                                          .createdAt
                                                          .toString())),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
                    Obx(() {
                      if (controller.isLoadingCancelOrder.value) {
                        return SizedBox(
                            height: kHeight * 0.8,
                            child: Center(child: CircularProgressIndicator()));
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.cancelOrder.value!.length,
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
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          '${controller.cancelOrder.value![index].product?.featureImage}',
                                          width: kWidth * 0.2,
                                          height: kWidth * 0.2,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CText(
                                              text:
                                                  'Đơn hàng: #${controller.cancelOrder.value![index].id}',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: Colors.orange,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CText(
                                              text: NumberFormat.currency(
                                                      locale: 'vi')
                                                  .format(controller.cancelOrder
                                                      .value![index].total),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: pColor,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CText(
                                              text: DateFormat('dd/MM/yyyy')
                                                  .format(DateTime.parse(
                                                      controller
                                                          .cancelOrder
                                                          .value![index]
                                                          .createdAt
                                                          .toString())),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
