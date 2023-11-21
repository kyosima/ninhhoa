import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
    TabController tabController = TabController(length: 1, vsync: this);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin sản phẩm'),
        ),
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
                    width: kWidth * 0.4,
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

                        if (!await launchUrl(
                          Uri.parse('https://zalo.me/0372920000'),
                          mode: LaunchMode.externalApplication,
                        )) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.call),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Liên hệ tư vấn',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: kWidth < 600 ? 45 : 75,
                    width: kWidth * 0.4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(pColor),
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
                        children: const [
                          Icon(Icons.facebook),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Mua máy',
                          ),
                        ],
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
            return const Center(
              child: CircularProgressIndicator(),
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
                    TabBar(
                        isScrollable: true,
                        labelColor: pColor,
                        controller: tabController,
                        indicatorWeight: 1.3,
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        tabs: const [
                          Tab(
                            text: 'Mô tả sản phẩm',
                          ),
                          // Tab(
                          //   text: 'Đánh giá',
                          // ),
                        ]),
                    AutoScaleTabBarView(
                      controller: tabController,
                      children: [
                        Html(
                          data: '${controller.productDetail.value?.desc}',
                          style: {
                            "table,th,td": Style(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 0.3))
                          },
                        ),
                        // Container(
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       const SizedBox(
                        //         height: 15,
                        //       ),
                        //       CText(
                        //         text:
                        //             'Đánh giá ${controller.productDetail.value?.name}',
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 16,
                        //       ),
                        //       const SizedBox(
                        //         height: 25,
                        //       ),
                        //       Obx(() {
                        //         if (controller.isLoadingReview.value) {
                        //           return const Center(
                        //               child: CircularProgressIndicator());
                        //         } else {
                        //           return Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceAround,
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.center,
                        //             children: [
                        //               CText(
                        //                 text: controller
                        //                     .average()
                        //                     .toStringAsFixed(1),
                        //                 color: Colors.amber,
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 25,
                        //               ),
                        //               RatingBar.builder(
                        //                 initialRating: controller.average(),
                        //                 minRating: 1,
                        //                 direction: Axis.horizontal,
                        //                 allowHalfRating: true,
                        //                 itemCount: 5,
                        //                 ignoreGestures: true,
                        //                 itemSize: 35,
                        //                 itemBuilder: (context, _) => const Icon(
                        //                   Icons.star,
                        //                   color: Colors.amber,
                        //                 ),
                        //                 onRatingUpdate: (rating) {
                        //                   print(rating);
                        //                 },
                        //               ),
                        //               Obx(
                        //                 () => CText(
                        //                   text:
                        //                       '${controller.review.value!.length} Đánh giá',
                        //                   color: pColor,
                        //                 ),
                        //               ),
                        //             ],
                        //           );
                        //         }
                        //       }),
                        //       const SizedBox(
                        //         height: 35,
                        //       ),
                        //       InkWell(
                        //         onTap: () {
                        //           Get.bottomSheet(
                        //             Container(
                        //               height: kHeight * 0.6,
                        //               decoration: const BoxDecoration(
                        //                   color: Colors.white,
                        //                   borderRadius: BorderRadius.only(
                        //                     topLeft: Radius.circular(15),
                        //                     topRight: Radius.circular(15),
                        //                   )),
                        //               child: Padding(
                        //                 padding: EdgeInsets.all(kWidth * 0.05),
                        //                 child: Column(
                        //                   children: [
                        //                     SizedBox(
                        //                       width: kWidth * 0.3,
                        //                       child: const Divider(
                        //                         color: Colors.black,
                        //                         thickness: 2,
                        //                       ),
                        //                     ),
                        //                     const SizedBox(
                        //                       height: 15,
                        //                     ),
                        //                     CText(
                        //                       text: 'Đánh giá sản phẩm',
                        //                       fontSize: 17,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //                     const SizedBox(
                        //                       height: 25,
                        //                     ),
                        //                     Obx(
                        //                       () => Row(
                        //                         mainAxisAlignment:
                        //                             MainAxisAlignment
                        //                                 .spaceEvenly,
                        //                         children: [
                        //                           RatingBar.builder(
                        //                             initialRating: controller
                        //                                 .reviewRating.value
                        //                                 .toDouble(),
                        //                             minRating: 1,
                        //                             direction: Axis.horizontal,
                        //                             allowHalfRating: false,
                        //                             itemCount: 5,
                        //                             itemSize: 35,
                        //                             itemPadding:
                        //                                 const EdgeInsets
                        //                                         .symmetric(
                        //                                     horizontal: 2.0),
                        //                             itemBuilder: (context, _) =>
                        //                                 const Icon(
                        //                               Icons.star,
                        //                               color: Colors.amber,
                        //                             ),
                        //                             onRatingUpdate: (rating) {
                        //                               controller.reviewRating
                        //                                       .value =
                        //                                   rating.toInt();
                        //                             },
                        //                           ),
                        //                           CText(
                        //                             text:
                        //                                 '${controller.reviewRating.value}',
                        //                             fontSize: 25,
                        //                             color: Colors.amber,
                        //                             fontWeight: FontWeight.bold,
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                     const SizedBox(
                        //                       height: 25,
                        //                     ),
                        //                     TextFormField(
                        //                       controller:
                        //                           controller.reviewContent,
                        //                       keyboardType: TextInputType.text,
                        //                       cursorColor: pColor,
                        //                       maxLines: 5,
                        //                       style: const TextStyle(
                        //                           fontSize: 16.0),
                        //                       decoration: InputDecoration(
                        //                         contentPadding:
                        //                             const EdgeInsets.fromLTRB(
                        //                                 20.0, 15.0, 20.0, 15.0),
                        //                         hintText: "Nội dung",
                        //                         border: OutlineInputBorder(
                        //                           borderRadius:
                        //                               BorderRadius.circular(
                        //                                   5.0),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     const SizedBox(
                        //                       height: 25,
                        //                     ),
                        //                     SizedBox(
                        //                       width: kWidth,
                        //                       height: kHeight * 0.06,
                        //                       child: ElevatedButton(
                        //                           style: ButtonStyle(
                        //                               backgroundColor:
                        //                                   MaterialStateProperty
                        //                                       .all(pColor)),
                        //                           onPressed: () {
                        //                             if (controller.reviewContent
                        //                                     .text.isEmpty ||
                        //                                 controller
                        //                                         .reviewRating ==
                        //                                     0) {
                        //                               AwesomeDialog(
                        //                                 context: context,
                        //                                 dialogType:
                        //                                     DialogType.error,
                        //                                 animType:
                        //                                     AnimType.rightSlide,
                        //                                 title: 'Thất bại',
                        //                                 desc:
                        //                                     'Vui lòng nhập đánh giá',
                        //                                 btnCancelOnPress: () {},
                        //                                 btnOkOnPress: () {},
                        //                               ).show();
                        //                             } else {
                        //                               controller.reviewProduct(
                        //                                   rating: controller
                        //                                       .reviewRating
                        //                                       .toString(),
                        //                                   content: controller
                        //                                       .reviewContent
                        //                                       .text);
                        //                               Get.back();
                        //                             }
                        //                           },
                        //                           child: CText(
                        //                             text: 'Đánh giá',
                        //                             color: Colors.white,
                        //                           )),
                        //                     )
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //             isScrollControlled: true,
                        //           );
                        //         },
                        //         child: Row(
                        //           children: [
                        //             const Icon(
                        //               Icons.edit,
                        //               color: Colors.blue,
                        //               size: 20,
                        //             ),
                        //             const SizedBox(
                        //               width: 6,
                        //             ),
                        //             CText(
                        //               text: 'Viết đánh giá',
                        //               textDecoration: TextDecoration.underline,
                        //               color: Colors.blue,
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //       const SizedBox(
                        //         height: 35,
                        //       ),
                        //       Obx(() {
                        //         if (controller.isLoadingReview.value) {
                        //           return const Center(
                        //               child: CircularProgressIndicator());
                        //         } else {
                        //           return ListView.separated(
                        //             shrinkWrap: true,
                        //             itemCount: controller.review.value!.length,
                        //             physics:
                        //                 const NeverScrollableScrollPhysics(),
                        //             itemBuilder: (BuildContext context, index) {
                        //               return Container(
                        //                 child: Column(
                        //                   crossAxisAlignment:
                        //                       CrossAxisAlignment.start,
                        //                   children: [
                        //                     Row(
                        //                       crossAxisAlignment:
                        //                           CrossAxisAlignment.start,
                        //                       children: [
                        //                         ClipRRect(
                        //                           borderRadius:
                        //                               BorderRadius.circular(
                        //                                   100),
                        //                           child: Image.network(
                        //                             '${controller.review.value![index].avatar}',
                        //                             width: kWidth * 0.1,
                        //                             height: kWidth * 0.1,
                        //                             fit: BoxFit.cover,
                        //                           ),
                        //                         ),
                        //                         const SizedBox(
                        //                           width: 10,
                        //                         ),
                        //                         Column(
                        //                           crossAxisAlignment:
                        //                               CrossAxisAlignment.start,
                        //                           children: [
                        //                             CText(
                        //                               text:
                        //                                   '${controller.review.value![index].fullname}',
                        //                               fontWeight:
                        //                                   FontWeight.w700,
                        //                             ),
                        //                             const SizedBox(
                        //                               height: 5,
                        //                             ),
                        //                             RatingBar.builder(
                        //                               initialRating: controller
                        //                                   .review
                        //                                   .value![index]
                        //                                   .rating!
                        //                                   .toDouble(),
                        //                               minRating: 1,
                        //                               direction:
                        //                                   Axis.horizontal,
                        //                               allowHalfRating: true,
                        //                               itemCount: 5,
                        //                               ignoreGestures: true,
                        //                               itemSize: 20,
                        //                               itemPadding:
                        //                                   const EdgeInsets
                        //                                           .symmetric(
                        //                                       horizontal: 0.0),
                        //                               itemBuilder:
                        //                                   (context, _) =>
                        //                                       const Icon(
                        //                                 Icons.star,
                        //                                 color: Colors.amber,
                        //                               ),
                        //                               onRatingUpdate: (rating) {
                        //                                 print(rating);
                        //                               },
                        //                             ),
                        //                           ],
                        //                         )
                        //                       ],
                        //                     ),
                        //                     const SizedBox(
                        //                       height: 10,
                        //                     ),
                        //                     CText(
                        //                       text:
                        //                           '${controller.review.value![index].content}',
                        //                       color: Colors.black87,
                        //                     )
                        //                   ],
                        //                 ),
                        //               );
                        //             },
                        //             separatorBuilder:
                        //                 (BuildContext context, int index) {
                        //               return Divider(
                        //                 height: 50,
                        //                 color: Colors.grey.withOpacity(0.6),
                        //               );
                        //             },
                        //           );
                        //         }
                        //       })
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        }));
  }
}
