import 'package:flutter/material.dart';

import '../unit.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 37.0,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: TextField(
          autofocus: false,
          style: const TextStyle(fontSize: 16.0, color: pColor),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: pColor,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Tìm kiếm',
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 13.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ));
  }
}
