// ignore_for_file: prefer_const_constructors

import 'package:AngelDelivery/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Text(title,
          style: const TextStyle(
              fontSize: 20,
              color: AppColor.fourthColor,
              fontWeight: FontWeight.bold)),
    );
  }
}
