import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CText extends StatelessWidget {
  String? text;
  FontWeight? fontWeight;
  double? fontSize;
  Color? color;
  int? maxLine;
  TextOverflow? textOverflow;
  TextDecoration? textDecoration;
  CText({
    Key? key,
    this.text,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.black87,
    this.maxLine,
    this.textOverflow,
    this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Text(
      '$text',
      maxLines: maxLine,
      overflow: textOverflow,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: kWidth < 600 ? fontSize : fontSize! + 6,
        color: color,
        decoration: textDecoration,
      ),
    );
  }
}
