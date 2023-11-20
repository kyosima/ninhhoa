import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vincare/unit.dart';

import '../../controller/dashboard/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  final controller = Get.put(DashboardController());
  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;

    return Obx(
      () => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: kWidth < 600 ? 14 : 20,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: kWidth < 600 ? 14 : 20,
          iconSize: kWidth < 600 ? 30 : 40,
          unselectedItemColor: const Color(0xff666666),
          selectedItemColor: pColor,
          unselectedLabelStyle: TextStyle(
            color: Colors.black87,
          ),
          onTap: (index) {
            controller.selectIndex(index);
          },
          currentIndex: controller.selectedIndex.value,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.policy_outlined),
              label: 'Điều khoản',
            ),
          ],
        ),
        body: controller.listPage[controller.selectedIndex.value],
      ),
    );
  }
}
