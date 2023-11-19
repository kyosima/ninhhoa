import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/product/category_detail_controller.dart';
import '../../unit.dart';
import '../../widget/custom_text.dart';

class ProductCategory extends StatelessWidget {
  final controller = Get.put(CategoryDetailController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ProductCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                CText(
                  text: 'Phân loại',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                const SizedBox(
                  height: 30,
                ),
                controller.children == null
                    ? const Text('')
                    : ListView.separated(
                        itemCount: controller.children.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () {
                              controller.getCategoryDetail(
                                  id: controller.children[index].id.toString());

                              Get.back();
                            },
                            child: Row(
                              children: [
                                Text(
                                  '${controller.children[index].name}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height: 40,
                            color: Colors.grey.withOpacity(0.3),
                          );
                        },
                      ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Obx(() {
          if (controller.isLoading.value) {
            return const Text('Danh mục sản phẩm');
          } else {
            return Text('${controller.categoryDetail.value?.name}');
          }
        }),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              icon: const Icon(Icons.filter_alt))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kWidth * 0.03),
          child: Column(
            children: [
              Obx(() {
                if (controller.isLoading.value) {
                  return SizedBox(
                      height: 0.7 * kHeight,
                      child: const Center(child: CircularProgressIndicator()));
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: () {
                          Get.toNamed('/productDetail',
                              arguments: controller
                                  .categoryDetail.value?.products![index].id);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: pColor.withOpacity(0.5),),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    '${controller.categoryDetail.value?.products![index].featureImage}',
                                    fit: BoxFit.cover,
                                    height: kWidth * 0.2,
                                    width:kWidth * 0.2,
                                  ),
                                ),
                                SizedBox(width: 8,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CText(
                                        text:
                                        '${controller.categoryDetail.value?.products![index].name}',
                                        fontWeight: FontWeight.w500,
                                        maxLine: 2,
                                        textOverflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CText(
                                        text: NumberFormat.currency(locale: 'vi',symbol: 'đ').format(
                                            controller.categoryDetail.value?.products![index].price),
                                        color: pColor,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CText(
                                        text: controller.categoryDetail.value?.products![index].shortDesc ?? '',
                                        textOverflow: TextOverflow.ellipsis,
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
                    }, itemCount: controller.categoryDetail.value!.products!.length,

                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10,
                      );
                    },

                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
