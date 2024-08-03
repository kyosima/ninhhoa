import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/product/category_controller.dart';
import '../../unit.dart';
import '../../widget/custom_text.dart';

class AllCategoryPage extends StatefulWidget {
  const AllCategoryPage({Key? key}) : super(key: key);

  @override
  State<AllCategoryPage> createState() => _AllCategoryPageState();
}

class _AllCategoryPageState extends State<AllCategoryPage> {
  final controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Danh mục sản phẩm'),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return SizedBox(
              height: kHeight * 0.7,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(kWidth * 0.04),
              child: GridView.builder(
                  itemCount: controller.category.value?.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 0.7),
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(
                          '/productCategory',
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Image.network(
                                '$url${controller.category.value![index].avatar}',
                                fit: BoxFit.contain,
                                height: kHeight * 0.1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CText(
                                text:
                                    '${controller.category.value![index].name}',
                                fontWeight: FontWeight.w400,
                                fontSize: kWidth < 500 ? 15 : 22,
                                maxLine: 1,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
        }));
  }
}
