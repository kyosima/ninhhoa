import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/blog/blog_detail_controller.dart';
import '../../unit.dart';
import '../../widget/custom_text.dart';

class BlogDetailPage extends StatelessWidget {
  final controller = Get.put(BlogDetailController());
  BlogDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin chi tiết'),
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
                padding: EdgeInsets.all(kWidth * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        '${controller.blogDetail.value?.featureImage}',
                        width: kWidth,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CText(
                      text:
                          '${controller.blogDetail.value?.title?.toUpperCase()}',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Html(
                      data: '${controller.blogDetail.value?.content}',
                    ),
                  ],
                ),
              ),
            );
          }
        }));
  }
}
