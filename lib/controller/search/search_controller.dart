import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../api/search/search_api.dart';
import '../../model/product/feature_product_model.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SearchController());
  }
}

class SearchController extends GetxController {
  final isLoading = false.obs;
  final product = FeatureProductModel().data.obs;
  final keyword = TextEditingController();
  final key = Get.arguments;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    searchResult(keyword: key);
    keyword.text = key;
  }

  void searchResult({String? keyword}) async {
    try {
      isLoading.value = true;
      var result = await SearchApi.search(keyword: keyword);
      product.value = result?.data;
    } finally {
      isLoading.value = false;
    }
  }
}
