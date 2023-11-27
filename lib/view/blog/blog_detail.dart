import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../controller/blog/blog_detail_controller.dart';
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
          title: const Text('Chi tiết tin tức'),
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
                    CText(
                      text: DateFormat('dd/MM/yyyy').format(DateTime.parse(
                          controller.blogDetail.value!.postedAt.toString())),
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
