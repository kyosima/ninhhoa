import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/blog/blog_service.dart';
import '../../model/blog/blog_detail_model.dart';

class BlogDetailBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BlogDetailController());
  }
}

class BlogDetailController extends GetxController {
  final id = Get.arguments.toString();
  final isLoading = false.obs;
  final blogDetail = BlogDetailModel().data.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBlogDetail();
  }

  void getBlogDetail() async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var result = await BlogApi.getBlogDetail(id: id, token: token);
      blogDetail.value = result?.data;
    } finally {
      isLoading.value = false;
    }
  }
}
