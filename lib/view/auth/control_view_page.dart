import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dashboard/dashboard_page.dart';

class ControlViewPage extends StatefulWidget {
  const ControlViewPage({Key? key}) : super(key: key);

  @override
  State<ControlViewPage> createState() => _ControlViewPageState();
}

class _ControlViewPageState extends State<ControlViewPage> {
  @override
  Widget build(context) {
    Future getId() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt('id')!.toInt();
    }

    return FutureBuilder(
        future: getId(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return DashboardPage();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: const CircularProgressIndicator(),
            );
          } else {
            return DashboardPage();
          }
        });
  }
}
