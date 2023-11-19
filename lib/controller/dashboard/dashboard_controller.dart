import 'package:get/get.dart';

import '../../view/home/home_page.dart';
import '../../view/search/search_page.dart';
import '../../view/user/user_page.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DashboardController());
  }
}

class DashboardController extends GetxController {
  final initPage = 0.obs;
  final listPage = [

    HomePage(),
    UserPage(),
  ];
}
