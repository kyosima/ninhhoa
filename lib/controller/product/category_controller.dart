import 'package:get/get.dart';

import '../../api/product/product_service.dart';
import '../../model/product/category_model.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CategoryController());
  }
}

class CategoryController extends GetxController {
  final isLoading = false.obs;
  final category = CategoryModel().data.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategory();
  }

  void getCategory() async {
    try {
      isLoading.value = true;
      var response = await ProductApi.getCategory();
      category.value = response?.data;
    } finally {
      isLoading.value = false;
    }
  }
}
