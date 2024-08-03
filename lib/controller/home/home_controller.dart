import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vincare/model/blog/category_detail_model.dart';

import '../../api/auth/auth_service.dart';
import '../../api/blog/blog_service.dart';
import '../../api/product/product_service.dart';
import '../../api/user/user_service.dart';
import '../../model/auth/banner_model.dart';
import '../../model/checkout/cart_model.dart';
import '../../model/product/category_detail_model.dart';
import '../../model/product/category_model.dart';
import '../../model/product/category_product_model.dart';
import '../../model/product/feature_product_model.dart';
import '../../model/user/user_info_model.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends GetxController {
  final init = 0.obs;
  final isLoadingCategory = false.obs;
  final isLoadingCategoryProduct = false.obs;
  final isLoadingCart = false.obs;
  final category = CategoryModel().data.obs;
  final categoryProduct = CategoryProductModel().data.obs;
  final mypham = CategoryDetailModel().data.obs;
  final isLoadingMypham = false.obs;
  final sua = CategoryDetailModel().data.obs;
  final isLoadingSua = false.obs;
  final douong = CategoryDetailModel().data.obs;
  final isLoadingDouong = false.obs;
  final dichvu = CategoryDetailModel().data.obs;
  final isLoadingDichvu = false.obs;
  final cart = CartModel().data.obs;
  final isLoadingBanner = false.obs;
  final banner = BannerModel().data.obs;
  final isLoadingBlog = false.obs;
  final isLoadingBlog2 = false.obs;
  final blogs = BlogCategoryDetailModel().data.obs;
  final blogs2 = BlogCategoryDetailModel().data.obs;
  final isLoadingFeaturedProduct = false.obs;
  final featuredProduct = FeatureProductModel().data.obs;
  final newProduct = FeatureProductModel().data.obs;
  final isLoadingNewProduct = false.obs;
  final isLoadingInfo = false.obs;
  final userInfo = UserInfoModel().data.obs;
  final tokenKey = ''.obs;
  final keySearch = TextEditingController();
  final isLoadingBannerQc = false.obs;
  final bannerQc = BannerModel().data.obs;
  final isLoadingBannerQc2 = false.obs;
  final bannerQc2 = BannerModel().data.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getBanner();
    getBannerQc();
    getBannerQc2();
    getCategoryProduct();
    getFeaturedProduct();
    getBlog();
    getBlog2();
    super.onInit();
  }

  void getUserInfo() async {
    try {
      isLoadingInfo.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token').toString();
      var response = await UserService.getUserInfo(accessToken: token);

      userInfo.value = response?.data;
    } finally {
      isLoadingInfo.value = false;
    }
  }

  void getFeaturedProduct() async {
    try {
      isLoadingFeaturedProduct.value = true;
      var result = await ProductApi.getFeatureProduct(status: '2');
      featuredProduct.value = result?.data;
    } finally {
      isLoadingFeaturedProduct.value = false;
    }
  }

  void getBlog() async {
    try {
      isLoadingBlog.value = true;

      var result = await BlogApi.getBlogCategoryDetail(id: '1');
      blogs.value = result?.data;
    } finally {
      isLoadingBlog.value = false;
    }
  }

  void getBlog2() async {
    try {
      isLoadingBlog2.value = true;
      var result = await BlogApi.getBlogCategoryDetail(id: '2');
      blogs2.value = result?.data;
    } finally {
      isLoadingBlog2.value = false;
    }
  }

  void getBanner() async {
    try {
      isLoadingBanner.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var response = await AuthApi.getBanner(token: token, key: 'slider');
      banner.value = response?.data;
    } finally {
      isLoadingBanner.value = false;
    }
  }

  void getBannerQc() async {
    try {
      isLoadingBannerQc.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var response = await AuthApi.getBanner(token: token, key: 'quangcao');
      bannerQc.value = response?.data;
    } finally {
      isLoadingBannerQc.value = false;
    }
  }

  void getBannerQc2() async {
    try {
      isLoadingBannerQc2.value = true;

      var response = await AuthApi.getBanner(key: 'quangcao2');
      bannerQc2.value = response?.data;
    } finally {
      isLoadingBannerQc2.value = false;
    }
  }

  // void getCart() async {
  //   try {
  //     isLoadingCart.value = true;
  //     final prefs = await SharedPreferences.getInstance();
  //     final token = prefs.getString('token');
  //     var response = await CheckoutApi.getCart(token: token);
  //     cart.value = response?.data;
  //   } finally {
  //     isLoadingCart.value = false;
  //   }
  // }
  //
  // void getCategory() async {
  //   try {
  //     isLoadingCategory.value = true;
  //     var response = await ProductApi.getCategory();
  //     category.value = response?.data;
  //   } finally {
  //     isLoadingCategory.value = false;
  //   }
  // }

  void getCategoryProduct() async {
    try {
      isLoadingCategoryProduct.value = true;

      var response = await ProductApi.getCategoryProduct();
      categoryProduct.value = response?.data;
    } finally {
      isLoadingCategoryProduct.value = false;
    }
  }
}
