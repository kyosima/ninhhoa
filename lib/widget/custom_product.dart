import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_text.dart';

// ignore: must_be_immutable
class CustomProduct extends StatelessWidget {
  String? name;
  String? image;
  int? price;
  int? pricePromotion;
  int? salePercent;
  bool hidden;
  CustomProduct(
      {this.image,
      this.name,
      this.hidden = true,
      this.price,
      this.pricePromotion,
      this.salePercent,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                image!,
                fit: BoxFit.contain,
                height: kHeight * 0.2,
                width: kHeight * 0.2,
              ),
              const SizedBox(
                height: 10,
              ),
              CText(
                text: name,
                fontWeight: FontWeight.w400,
                fontSize: kWidth < 600 ? 16 : 21,
              ),
              const SizedBox(
                height: 10,
              ),
              CText(
                text:
                    NumberFormat.currency(locale: 'vi').format(pricePromotion),
                fontWeight: FontWeight.w600,
                fontSize: kWidth < 600 ? 19 : 24,
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: hidden,
                child: CText(
                  text: NumberFormat.currency(locale: 'vi').format(price),
                  textDecoration: TextDecoration.lineThrough,
                  fontSize: kWidth < 600 ? 16 : 21,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
