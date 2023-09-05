

import 'package:flutter/material.dart';
import 'package:zestybites/utils/dimensions.dart';

class NavigationIcon extends StatelessWidget {

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  const NavigationIcon({super.key,
    required this.icon,
    this.backgroundColor=const Color(0xFFfcf4e4),
    this.iconColor=const Color(0xFF756d54),
    this.size=38,


  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.iconSize16,

      ),
    ) ;
  }
}
