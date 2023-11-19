import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vincare/unit.dart';

import '../../controller/dashboard/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  final controller = Get.put(DashboardController());
  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        color: Colors.white,
        activeColor: Colors.white,
        backgroundColor: pColor,
        elevation: 0.5,
        items: const [

          TabItem(icon: Icons.home, title: 'Trang chủ'),
          TabItem(icon: Icons.person, title: 'Điều khoản'),
        ],
        initialActiveIndex: controller.initPage.value,
        onTap: (int i) {
          controller.initPage.value = i;
        },
      ),
      body: Obx(() => controller.listPage[controller.initPage.value]),
    );
  }
}
