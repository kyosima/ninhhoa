import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/product/product_detail_controller.dart';
import '../../unit.dart';
import '../../widget/custom_text.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  final controller = Get.put(ProductDetailController());

  final CarouselController _controller = CarouselController();

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin chi tiết'),
          centerTitle: false,
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            child: Icon(Icons.call),
            backgroundColor: Colors.green,
            onPressed: () async {
              final Uri launchUri = Uri(
                scheme: 'tel',
                path: '0372920000',
              );
              await launchUrl(launchUri);
            }),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: kHeight * 0.09,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  // Container(
                  //   height: kWidth < 600 ? 46 : 76,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(5),
                  //     color: Colors.grey.withOpacity(0.3),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       IconButton(
                  //         onPressed: () {
                  //           controller.decreaseQuantity();
                  //         },
                  //         icon: const Icon(Icons.remove_rounded,size: 20,),
                  //       ),
                  //
                  //       Obx(
                  //         () => CText(
                  //           text: '${controller.quantity.value}',
                  //           fontSize: 17,
                  //         ),
                  //       ),
                  //
                  //       IconButton(
                  //         onPressed: () {
                  //           controller.increaseQuantity();
                  //         },
                  //         icon: const Icon(Icons.add,size: 20,),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: kWidth < 600 ? 45 : 75,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                      ),
                      onPressed: () async {
                        // if (controller.tokenKey.value == '') {
                        //   Get.toNamed('/login');
                        //   Get.snackbar(
                        //       'Thông báo', 'Vui lòng đăng nhập để mua hàng');
                        // } else {
                        //   controller.addToCart(
                        //     qty: controller.quantity.value.toString(),
                        //   );
                        // }
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                width: 20,
                                height: 18,
                              ),
                              Image.asset(
                                'assets/images/zalo.png',
                                width: 20,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CText(
                            text: '037 292 0000',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: kWidth < 600 ? 45 : 75,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0],
                          colors: [
                            Color(0xffFF6968),
                            Color(0xffA334FA),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () async {
                          if (!await launchUrl(
                            Uri.parse('https://m.me/100035436364918'),
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook),
                            SizedBox(
                              width: 10,
                            ),
                            CText(
                              text: 'Liên hệ Shop',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return SingleChildScrollView(
              child: Container(
                height: kHeight,
                color: Color(0xfff6f6f6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: kHeight * 0.8,
                        child: Center(
                            child: Lottie.asset(
                                'assets/animations/loading.json',
                                width: kWidth,
                                fit: BoxFit.cover))),
                  ],
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(kWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    controller.productDetail.value!.gallery!.isEmpty
                        ? Column(
                            children: [
                              CarouselSlider(
                                items: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15.0)),
                                      child: Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(
                                            '${controller.productDetail.value?.featureImage}',
                                            width: double.infinity,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                options: CarouselOptions(
                                  enlargeCenterPage: true,
                                ),
                                carouselController: _controller,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CarouselSlider(
                                items: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15.0)),
                                      child: Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(
                                            '${controller.productDetail.value?.featureImage}',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  for (var i = 0;
                                      i <
                                          controller.productDetail.value!
                                              .gallery!.length;
                                      i++) ...[
                                    SizedBox(
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15.0)),
                                        child: Container(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.network(
                                              '${controller.productDetail.value?.gallery![i]}',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ]
                                ],
                                options: CarouselOptions(
                                  enlargeCenterPage: true,
                                ),
                                carouselController: _controller,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: kHeight * 0.09,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller
                                        .productDetail.value!.gallery!.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return InkWell(
                                          onTap: () {
                                            _controller
                                                .animateToPage(index + 1);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                width: kWidth * 0.15,
                                                height: kWidth * 0.15,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: pColor
                                                          .withOpacity(0.4)),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.network(
                                                    controller.productDetail
                                                        .value!.gallery![index],
                                                    width: kWidth * 0.15,
                                                    height: kWidth * 0.15,
                                                    fit: BoxFit.contain,
                                                  ),
                                                )),
                                          ));
                                    }),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                    CText(
                      text: '${controller.productDetail.value?.name}',
                      fontSize: kWidth < 600 ? 21 : 26,
                      fontWeight: FontWeight.w700,
                      maxLine: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    CText(
                      text: NumberFormat.currency(locale: 'vi')
                          .format(controller.productDetail.value?.price),
                      fontSize: kWidth < 600 ? 22 : 27,
                      fontWeight: FontWeight.w700,
                      color: pColor,
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                      height: 30,
                    ),
                    // controller.productDetail.value?.purchaseQty == null
                    //     ? Container()
                    //     : SizedBox(
                    //         height: kHeight * 0.1,
                    //         child: ListView.separated(
                    //           shrinkWrap: true,
                    //           scrollDirection: Axis.horizontal,
                    //           itemCount: controller
                    //               .productDetail.value!.purchaseQty!.length,
                    //           itemBuilder: (BuildContext context, index) {
                    //             return Container(
                    //               width: kWidth * 0.4,
                    //               decoration: BoxDecoration(
                    //                 border: Border.all(
                    //                     color: Colors.blue.withOpacity(0.5),
                    //                     width: 2),
                    //                 borderRadius: BorderRadius.circular(10),
                    //               ),
                    //               child: Padding(
                    //                 padding: const EdgeInsets.all(10.0),
                    //                 child: CText(
                    //                   fontWeight: FontWeight.w600,
                    //                   text:
                    //                       'Giảm ${controller.productDetail.value?.purchaseQty![index].type == 1 ? NumberFormat.currency(locale: 'vi').format(controller.productDetail.value?.purchaseQty![index].plainValue) : controller.productDetail.value?.purchaseQty![index].plainValue} ${controller.productDetail.value?.purchaseQty![index].type == 1 ? '' : '%'} khi mua từ ${controller.productDetail.value?.purchaseQty![index].qty} sản phẩm  ',
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //           separatorBuilder:
                    //               (BuildContext context, int index) {
                    //             return const SizedBox(
                    //               width: 10,
                    //             );
                    //           },
                    //         ),
                    //       ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    Html(
                      data: '${controller.productDetail.value?.desc}',
                      style: {
                        "table,th,td": Style(
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 0.3))
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        }));
  }
}
