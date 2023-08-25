// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:zestybites/utils/app_color.dart';
import 'package:zestybites/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double relativeSize, height;

  TextOverflow overflow;
  SmallText({
    super.key,
    this.color = AppColor.secondaryTextColor,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.relativeSize = 0,
    this.height = 1.2,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 2,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: relativeSize==0?Dimensions.font12:Dimensions.font12*relativeSize,
          fontWeight: FontWeight.w400,
          height: height,
          color: color),
    );
  }
}
