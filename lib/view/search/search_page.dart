import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vincare/controller/search/search_controller.dart';

import '../../unit.dart';
import '../../widget/custom_text.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: const Icon(Icons.call),
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
                        const SizedBox(
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
                      gradient: const LinearGradient(
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
                          const Icon(Icons.facebook),
                          const SizedBox(
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
      appBar: AppBar(
        title: Container(
            height: 37.0,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: TextField(
              autofocus: false,
              controller: controller.keyword,
              style: const TextStyle(fontSize: 16.0, color: pColor),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.searchResult(keyword: controller.keyword.text);
                  },
                  icon: const Icon(
                    Icons.search,
                    color: pColor,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Tìm kiếm sản phẩm',
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 13.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kWidth * 0.04),
          child: Obx(() {
            if (controller.isLoading.value) {
              return SizedBox(
                  height: kHeight * 0.8,
                  child: const Center(child: CircularProgressIndicator()));
            } else {
              return controller.product.value!.isEmpty
                  ? SizedBox(
                      height: kHeight * 0.7,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 180,
                              color: Colors.green,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CText(
                              textAlight: TextAlign.center,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              text:
                                  'Hiện tại không có sẵn điện thoại / dịch vụ quý khách tìm kiếm',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CText(
                              textAlight: TextAlign.center,
                              fontWeight: FontWeight.w400,
                              text:
                                  'Vui lòng liên hệ để tư vấn, báo giá hoặc đặt hàng.',
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            CText(
                              textAlight: TextAlign.center,
                              fontWeight: FontWeight.w400,
                              text: 'Xin cảm ơn quý khách!',
                            ),
                          ],
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      'Nếu kết quả tìm kiếm không đúng như bạn mong muốn, xin vui lòng liên hệ Zalo ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: '037.292.0000',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.blue,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed('/productDetail',
                                    arguments:
                                        controller.product.value![index].id);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: pColor.withOpacity(0.5),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          '${controller.product.value![index].featureImage}',
                                          fit: BoxFit.cover,
                                          height: kWidth * 0.2,
                                          width: kWidth * 0.2,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CText(
                                              text:
                                                  '${controller.product.value![index].name}',
                                              fontWeight: FontWeight.w500,
                                              maxLine: 2,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            CText(
                                              text: NumberFormat.currency(
                                                      locale: 'vi', symbol: 'đ')
                                                  .format(controller.product
                                                      .value![index].price),
                                              color: pColor,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            CText(
                                              text: controller
                                                      .product
                                                      .value![index]
                                                      .shortDesc ??
                                                  '',
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              maxLine: 2,
                                              fontSize: 13,
                                              color: Colors.black54,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: controller.product.value!.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                        ),
                      ],
                    );
            }
          }),
        ),
      ),
    );
  }
}
