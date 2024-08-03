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
        bottomNavigationBar: SizedBox(
          height: 40,
          child: BottomNavigationBar(
            selectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 0,
            iconSize: kWidth < 600 ? 25 : 40,
            unselectedItemColor: const Color(0xff666666),
            selectedItemColor: pColor,
            unselectedLabelStyle: const TextStyle(
              color: Colors.black87,
            ),
            onTap: (index) {
              controller.selectIndex(index);
            },
            currentIndex: controller.selectedIndex.value,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.policy_outlined),
                label: '',
              ),
            ],
          ),
        ),
        body: controller.listPage[controller.selectedIndex.value],
      ),
    );
  }
}
