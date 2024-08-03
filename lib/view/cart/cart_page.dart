import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/cart/cart_controller.dart';
import '../../unit.dart';
import '../../widget/custom_text.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: kHeight * 0.09,
            child: Padding(
              padding: EdgeInsets.all(10),
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
                        fontSize: kWidth < 600 ? 16 : 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(
                        () => CText(
                          text: controller.t.value == 0
                              ? '0 VND'
                              : NumberFormat.currency(locale: 'vi')
                                  .format(controller.t.value),
                          color: pColor,
                          fontWeight: FontWeight.w600,
                          fontSize: kWidth < 600 ? 17 : 21,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: kWidth < 600 ? 45 : 75,
                    width: kWidth * 0.45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(pColor)),
                      onPressed: () {
                        Get.toNamed('/checkout', arguments: [
                          controller.cart.value,
                          controller.sumTotal() - controller.sumDiscount(),
                        ]);
                      },
                      child: Text(
                        'Thanh toán',
                        style: TextStyle(
                          fontSize: kWidth < 600 ? 16 : 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text('Giỏ hàng'),
        ),
        body: Obx(() {
          if (controller.isLoadingCart.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            Future.delayed(const Duration(milliseconds: 0), () {
              controller.t.value =
                  double.parse(controller.sumTotal().toString()) -
                      controller.sumDiscount();
            });

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(kWidth * 0.04),
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.cart.value!.length,
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed('/cartDetail',
                                  arguments: controller.cart.value![index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Slidable(
                                key: const ValueKey(0),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        AwesomeDialog(
                                          context: Get.context!,
                                          dialogType: DialogType.info,
                                          animType: AnimType.rightSlide,
                                          title: 'Xóa sản phẩm',
                                          desc:
                                              'Bạn có muốn bỏ sản sẩm ra khỏi giỏ hàng?',
                                          btnCancelOnPress: () {},
                                          btnOkOnPress: () {
                                            controller.deleteProductCart(
                                                id: controller
                                                    .cart.value![index].id
                                                    .toString());
                                          },
                                        ).show();
                                      },
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Xóa',
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ],
                                ),
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
                                            '${controller.cart.value![index].product?.featureImage}',
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
                                                    '${controller.cart.value![index].product?.name}',
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
                                              controller
                                                          .cart
                                                          .value![index]
                                                          .product
                                                          ?.purchaseQty ==
                                                      null
                                                  ? controller
                                                              .cart
                                                              .value![index]
                                                              .product
                                                              ?.pricePromotion ==
                                                          null
                                                      ? CText(
                                                          text: NumberFormat
                                                                  .currency(
                                                                      locale:
                                                                          'vi')
                                                              .format(controller
                                                                  .cart
                                                                  .value![index]
                                                                  .product
                                                                  ?.price),
                                                          color: pColor,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )
                                                      : Row(
                                                          children: [
                                                            CText(
                                                              text: NumberFormat
                                                                      .currency(
                                                                          locale:
                                                                              'vi')
                                                                  .format(controller
                                                                      .cart
                                                                      .value![
                                                                          index]
                                                                      .product
                                                                      ?.pricePromotion),
                                                              color: pColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            CText(
                                                              text: NumberFormat
                                                                      .currency(
                                                                          locale:
                                                                              'vi')
                                                                  .format(controller
                                                                      .cart
                                                                      .value![
                                                                          index]
                                                                      .product
                                                                      ?.price),
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              textDecoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                            ),
                                                          ],
                                                        )
                                                  : CText(
                                                      text:
                                                          NumberFormat.currency(
                                                                  locale: 'vi')
                                                              .format(controller
                                                                  .cart
                                                                  .value![index]
                                                                  .product
                                                                  ?.price),
                                                      color: pColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              CText(
                                                text:
                                                    'x${controller.cart.value![index].qty}',
                                                color: Colors.red,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              controller
                                                          .cart
                                                          .value![index]
                                                          .product
                                                          ?.purchaseQty ==
                                                      null
                                                  ? Container()
                                                  : controller
                                                              .cart
                                                              .value![index]
                                                              .product
                                                              ?.purchaseQty
                                                              ?.type ==
                                                          1
                                                      ? CText(
                                                          text:
                                                              'Giảm giá ${NumberFormat.currency(locale: 'vi').format(controller.cart.value![index].product?.purchaseQty?.plainValue)}',
                                                        )
                                                      : CText(
                                                          text:
                                                              'Giảm giá ${controller.cart.value![index].product?.purchaseQty?.plainValue} %',
                                                        ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            );
          }
        }));
  }
}
