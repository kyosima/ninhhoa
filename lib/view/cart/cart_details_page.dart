import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vincare/controller/cart/cart_detail_controller.dart';
import 'package:vincare/unit.dart';
import 'package:vincare/widget/custom_text.dart';

import '../../model/checkout/cart_model.dart';

class CartDetailPage extends StatelessWidget {
  final Data cartDetail = Get.arguments;
  final controller = Get.put(CartDetailController());
  CartDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('${cartDetail.product?.name}'),
      ),
      bottomNavigationBar: SizedBox(
        height: kHeight * 0.15,
        child: Padding(
          padding: EdgeInsets.only(left: kWidth * 0.05, right: kWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => SizedBox(
                  width: kWidth,
                  height: kHeight * 0.05,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            controller.qty.value == 0
                                ? Colors.redAccent
                                : pColor),
                      ),
                      onPressed: () {
                        if (controller.qty.value == 0) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.info,
                            animType: AnimType.rightSlide,
                            title: 'Xóa sản phẩm',
                            desc: 'Bạn có muốn bỏ sản sẩm ra khỏi giỏ hàng?',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              controller.deleteProductCart(
                                  id: cartDetail.id.toString());
                              Get.back();
                            },
                          ).show();
                        } else {
                          controller.updateCart(
                              id: cartDetail.id.toString(),
                              qty: controller.qty.value.toString());
                        }
                      },
                      child: controller.qty.value == 0
                          ? CText(
                              text: 'Xóa sản phẩm',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )
                          : controller.isLoading.value == false
                              ? CText(
                                  text:
                                      'Cập nhật - ${NumberFormat.currency(locale: 'vi').format(cartDetail.product!.pricePromotion == null ? cartDetail.product!.price! * controller.qty.value : cartDetail.product!.pricePromotion! * controller.qty.value)}',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )
                              : SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              '${cartDetail.product?.featureImage}',
              width: kWidth,
              height: kHeight * 0.3,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(kWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    text: '${cartDetail.product?.name}',
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  cartDetail.product?.pricePromotion == null
                      ? CText(
                          text: NumberFormat.currency(locale: 'vi')
                              .format(cartDetail.product?.price),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: pColor,
                        )
                      : Row(
                          children: [
                            CText(
                              text: NumberFormat.currency(locale: 'vi')
                                  .format(cartDetail.product?.pricePromotion),
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: pColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CText(
                              text: '-',
                              fontSize: 18,
                              color: pColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CText(
                              text: NumberFormat.currency(locale: 'vi')
                                  .format(cartDetail.product?.price),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey,
                              textDecoration: TextDecoration.lineThrough,
                            ),
                          ],
                        ),
                  Divider(
                    height: 40,
                    color: Colors.blue.withOpacity(0.8),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blue.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {
                            controller.decreaseQty();
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: pColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Obx(
                        () => CText(
                          text: '${controller.qty.value}',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blue.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {
                            controller.increaseQty();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: pColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
