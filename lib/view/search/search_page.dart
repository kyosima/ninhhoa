import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
                    print(controller.keyword.text);
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
            if (controller.product.value == null) {
              return Container();
            } else {
              if (controller.isLoading.value) {
                return SizedBox(
                    height: kHeight * 0.8,
                    child: Center(child: CircularProgressIndicator()));
              } else {
                return ListView.separated(

                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: () {
                        Get.toNamed('/productDetail',
                            arguments: controller
                                .product.value![index].id);
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
                                  '${controller.product.value![index].featureImage}',
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
                                      '${controller.product.value![index].name}',
                                      fontWeight: FontWeight.w500,
                                      maxLine: 2,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CText(
                                      text: NumberFormat.currency(locale: 'vi',symbol: 'đ').format(
                                          controller.product.value![index].price),
                                      color: pColor,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CText(
                                      text: controller.product.value![index].shortDesc ?? '',
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
                  }, itemCount: controller.product.value!.length,

                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                },

                );
              }
            }
          }),
        ),
      ),
    );
  }
}
