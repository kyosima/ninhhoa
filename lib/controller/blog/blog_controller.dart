import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/blog/blog_service.dart';
import '../../model/blog/blog_model.dart';

class BlogBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BlogController());
  }
}

class BlogController extends GetxController {
  final isLoading = false.obs;
  final blogs = BlogModel().data.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBlog();
  }

  void getBlog() async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var result = await BlogApi.getBlog(token: token);
      blogs.value = result?.data;
    } finally {
      isLoading.value = false;
    }
  }
}
