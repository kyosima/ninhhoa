import 'package:get/get.dart';

import '../../api/product/product_service.dart';
import '../../model/product/category_detail_model.dart';

class CategoryDetailBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CategoryDetailController());
  }
}

class CategoryDetailController extends GetxController {
  final isLoading = false.obs;
  final categoryDetail = CategoryDetailModel().data.obs;
  final id = Get.arguments.id;
  final children = Get.arguments.children;
  final title = Get.arguments.title;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategoryDetail(id: id.toString());
  }

  void getCategoryDetail({String? id}) async {
    try {
      isLoading.value = true;
      var result = await ProductApi.getCategoryDetail(id: id);
      categoryDetail.value = result?.data;
    } finally {
      isLoading.value = false;
    }
  }
}
