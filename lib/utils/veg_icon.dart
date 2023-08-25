import 'package:flutter/material.dart';
import 'package:zestybites/utils/dimensions.dart';
import 'package:flutter_svg/svg.dart';

class VegIcon extends StatelessWidget {
  final bool veg;
  final double size;
   VegIcon({
    super.key,
    required this.veg,
    this.size = 0,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor = veg ? Colors.green : Colors.redAccent;
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.crop_square_outlined,
          color: iconColor,
          size: size==0?Dimensions.iconSize-5:size-5,
        ),
        Icon(
          Icons.circle_rounded,
          size: size==0?Dimensions.iconSize-17:size-17,
          color: iconColor,
        )
      ],
    );
  }
}
