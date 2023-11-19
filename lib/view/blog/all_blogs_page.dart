import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/blog/blog_controller.dart';
import '../../widget/custom_text.dart';

class AllBlogsPage extends StatefulWidget {
  const AllBlogsPage({Key? key}) : super(key: key);

  @override
  State<AllBlogsPage> createState() => _AllBlogsPageState();
}

class _AllBlogsPageState extends State<AllBlogsPage> {
  final controller = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tin tức'),
      ),
      body: Padding(
          padding: EdgeInsets.all(kWidth * 0.04),
          child: Obx(() {
            if (controller.isLoading.value) {
              return SizedBox(
                height: kHeight * 0.7,
                child: const Center(child: CircularProgressIndicator()),
              );
            } else {
              return GridView.builder(
                  itemCount: controller.blogs.value!.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                      childAspectRatio: 0.7),
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed('/blogDetail',
                            arguments: controller.blogs.value![index].id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Container(
                          width: kWidth * (kWidth < 600 ? 0.7 : 0.4),
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Image.network(
                                  '${controller.blogs.value![index].featureImage}',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: kHeight * 0.12,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CText(
                                      text: DateFormat('dd/MM/yyyy').format(
                                          DateTime.parse(controller
                                              .blogs.value![index].postedAt
                                              .toString())),
                                      fontSize: kWidth < 600 ? 14 : 18,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    CText(
                                      text:
                                          '${controller.blogs.value![index].title}',
                                      fontSize: kWidth < 600 ? 16 : 20,
                                      fontWeight: FontWeight.w500,
                                      maxLine: 2,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    CText(
                                      text: controller
                                              .blogs.value![index].excerpt ??
                                          '',
                                      fontSize: kWidth < 600 ? 14 : 19,
                                      fontWeight: FontWeight.w200,
                                      maxLine: 2,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          })),
    );
  }
}
