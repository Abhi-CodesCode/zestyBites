import 'package:flutter/material.dart';
import 'package:zestybites/utils/dimensions.dart';
import 'package:zestybites/widgets/small_text.dart';

class TextAndIconWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color textColor;
  final Color iconColor;
  final double relativeSize; // Changed the declaration of 'relativeSize' here

  const TextAndIconWidget({
    Key? key, // Used the correct syntax for 'key'
    required this.icon,
    required this.text,
    required this.textColor,
    required this.iconColor,
    this.relativeSize = 0, // Set the default value for 'relativeSize'
  }) : super(key: key); // Added the 'super(key: key)' constructor call

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: relativeSize == 0 ? Dimensions.iconSize : Dimensions.iconSize * relativeSize,
        ),
        SizedBox(width: relativeSize == 0 ? Dimensions.width5 : Dimensions.width5 * relativeSize * 0.4),
        SmallText(text: text, color: textColor,relativeSize: relativeSize,),
      ],
    );
  }
}