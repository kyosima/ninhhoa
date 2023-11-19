import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/user/user_service.dart';
import '../../model/user/user_info_model.dart';

class UserInfoBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UserInfoController());
  }
}

class UserInfoController extends GetxController {
  final userInfo = UserInfoModel().data.obs;
  final isLoadingInfo = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserInfo();
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
}
