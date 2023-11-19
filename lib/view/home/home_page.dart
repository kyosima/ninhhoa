import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vincare/widget/shimmer.dart';
import '../../controller/home/home_controller.dart';
import '../../model/product/category_arguments.dart';
import '../../unit.dart';
import '../../widget/custom_text.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          if (controller.isLoadingInfo.value) {
            return CText(
              text: 'Xin chào!',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            );
          } else {
            return controller.userInfo.value == null
                ? CText(
                    text: 'Shop điện thoại Ninh Hòa!',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  )
                : Row(
                    children: [
                      CText(
                        text: 'Xin chào, ',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      CText(
                        text: '${controller.userInfo.value?.fullname}',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ],
                  );
          }
        }),
        // actions: [
        //   Obx(
        //     () => Stack(
        //       alignment: Alignment.topRight,
        //       children: [
        //         Center(
        //           child: IconButton(
        //               onPressed: () {
        //                 if (controller.userInfo.value == null) {
        //                   Get.toNamed('/login');
        //                   Get.snackbar('Thông báo',
        //                       'Vui lòng đăng nhập để xem giỏ hàng');
        //                 } else {
        //                   Get.toNamed('/cart');
        //                 }
        //               },
        //               icon: const Icon(
        //                 Icons.shopping_cart_rounded,
        //                 size: 30,
        //               )),
        //         ),
        //         controller.userInfo.value == null
        //             ? Container()
        //             : Container(
        //                 width: 18,
        //                 height: 18,
        //                 decoration: BoxDecoration(
        //                   color: Colors.red,
        //                   borderRadius: BorderRadius.circular(100),
        //                 ),
        //                 child: Center(child: Obx(() {
        //                   if (controller.isLoadingCart.value) {
        //                     return const SizedBox(
        //                       height: 10,
        //                       width: 10,
        //                       child: CircularProgressIndicator(
        //                         strokeWidth: 1,
        //                         color: Colors.white,
        //                       ),
        //                     );
        //                   } else {
        //                     return CText(
        //                       text: '${controller.cart.value!.length}',
        //                       fontSize: 11,
        //                       color: Colors.white,
        //                     );
        //                   }
        //                 })),
        //               )
        //       ],
        //     ),
        //   ),
        //   const SizedBox(
        //     width: 5,
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kWidth * 0.05),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 42.0,
                  decoration:  BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.4)
                    ),
                      borderRadius: BorderRadius.all(Radius.circular(10),)),
                  child: TextField(
                    autofocus: false,
                    controller: controller.keySearch,
                    style: const TextStyle(fontSize: 16.0, color: pColor),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          Get.toNamed('/search',arguments: controller.keySearch.text);
                        },
                        icon: const Icon(
                          Icons.search,
                          color: pColor,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Tìm kiếm điện thoại',
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
              SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.isLoadingBanner.value) {
                  return Shimmer.fromColors(
                      child: ShimmerBox(height: kHeight * 0.2, width: kWidth),
                      baseColor: baseColor,
                      highlightColor: highlightColor);
                } else {
                  return ImageSlideshow(
                    width: double.infinity,
                    height: kHeight * 0.2,
                    initialPage: 0,
                    indicatorColor: pColor,
                    indicatorBackgroundColor: Colors.grey,
                    autoPlayInterval: 5500,
                    isLoop: true,
                    children: [
                      for (var i = 0;
                          i < controller.banner.value!.items!.length;
                          i++) ...[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              '${controller.banner.value?.items![i].image}',
                              fit: BoxFit.cover,
                            )),
                      ]
                    ],
                  );
                }
              }),
              const SizedBox(
                height: 30,
              ),

              Obx(() {
                if (controller.isLoadingCategoryProduct.value) {
                  return SizedBox(
                    height: kHeight * 0.21,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Shimmer.fromColors(
                          baseColor: baseColor,
                          highlightColor: highlightColor,
                          child: Container(
                            width: kWidth * 0.32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.blue.withOpacity(0.3)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: ShimmerBox(
                                      height: kHeight * 0.1,
                                      width: double.infinity,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ShimmerBox(
                                    height: 10,
                                    width: 60,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ShimmerBox(
                                    height: 10,
                                    width: 80,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  );
                  ;
                } else {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 2,
                    ),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.categoryProduct.value!.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed('/productCategory',
                              arguments: CategoryArguments(
                                  id: controller
                                      .categoryProduct.value![index].id,
                                  title: controller
                                      .categoryProduct.value![index].name,
                                  children: controller.categoryProduct
                                      .value![index].children));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: pColor
                          ),
                          child: Center(
                            child: CText(
                              text:
                                  '${controller.categoryProduct.value![index].name}',
                              maxLine: 1,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },

                  );
                }
              }),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.hotel_class,
                    size: 27,
                    color: pColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CText(
                    text: 'Giá tốt hôm nay',
                    fontSize: 17,
                    color: pColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.isLoadingFeaturedProduct.value) {
                  return SizedBox(
                    height: kHeight * 0.29,
                    child: ListView.separated(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Shimmer.fromColors(
                          baseColor: baseColor,
                          highlightColor: highlightColor,
                          child: Container(
                            width: kWidth * 0.37,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.blue.withOpacity(0.3)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: ShimmerBox(
                                            height: kHeight * 0.12,
                                            width: double.infinity,
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ShimmerBox(
                                        height: 15,
                                        width: double.infinity,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ShimmerBox(
                                        height: 15,
                                        width: double.infinity,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  ShimmerBox(
                                    height: 15,
                                    width: double.infinity,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  );
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.featuredProduct.value!.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed('/productDetail',
                              arguments: controller
                                  .featuredProduct.value![index].id);
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
                                    '${controller.featuredProduct.value![index].featureImage}',
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
                                        '${controller.featuredProduct.value![index].name}',
                                        fontWeight: FontWeight.w500,
                                        maxLine: 2,
                                        textOverflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CText(
                                        text: NumberFormat.currency(locale: 'vi',symbol: 'đ').format(
                                        controller.featuredProduct.value![index].price),
                                        color: pColor,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CText(
                                        text: controller.featuredProduct.value![index].shortDesc ?? '',
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
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                  );
                }
              }),
              const SizedBox(
                height: 20,
              ),


              Row(
                children: [
                  Image.asset('assets/images/fix.png',width: 25,),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: CText(
                      text: 'Sửa chữa - Thay màn hình - Ép kính - Linh kiện',
                      fontSize: 15,
                      color: pColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(() {
                if (controller.isLoadingBlog.value) {
                  return SizedBox(
                    height: kHeight * 0.25,
                    child: ListView.separated(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Shimmer.fromColors(
                          baseColor: baseColor,
                          highlightColor: highlightColor,
                          child: Container(
                            width: kWidth * 0.37,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.blue.withOpacity(0.3)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: ShimmerBox(
                                            height: kHeight * 0.12,
                                            width: double.infinity,
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ShimmerBox(
                                        height: 15,
                                        width: double.infinity,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ShimmerBox(
                                        height: 15,
                                        width: double.infinity,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  );
                } else {
                  return SizedBox(
                    height: kHeight * 0.25,
                    child: ListView.separated(
                      itemCount: controller.blogs.value!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed('/blogDetail',
                                arguments: controller.blogs.value![index].id);
                          },
                          child: Container(
                            width: kWidth * 0.38,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:pColor.withOpacity(0.5)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      '${controller.blogs.value![index].featureImage}',
                                      fit: BoxFit.cover,
                                      height: kHeight * 0.12,
                                      width: double.infinity,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CText(
                                    text: DateFormat('dd/MM/yyyy').format(
                                        DateTime.parse(controller
                                            .blogs.value![index].postedAt
                                            .toString())),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontSize: 13,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CText(
                                    text:
                                        '${controller.blogs.value![index].title}',
                                    fontWeight: FontWeight.w500,
                                    maxLine: 2,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                    ),
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
