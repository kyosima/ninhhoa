import 'package:flutter/material.dart';

class ShimmerBox extends StatelessWidget {
  final double height;
  final double width;
  const ShimmerBox({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      height: height,
      width: width,
    );
  }
}
