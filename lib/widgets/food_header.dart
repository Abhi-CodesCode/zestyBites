import 'package:flutter/material.dart';
import 'package:zestybites/widgets/small_text.dart';
import 'package:zestybites/widgets/text_and_icon_widget.dart';

import '../utils/app_color.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class FoodHeader extends StatelessWidget {
  final String text;
  final double bigTextSize;
  final double iconSize;
  const FoodHeader({
    super.key,
    required this.text,
    this.bigTextSize=1,
    this.iconSize=1
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,relativeSize: bigTextSize,),
        SizedBox(
          height: Dimensions.height8,
        ), //for spacing
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) =>  Icon(
                    Icons.star,
                    color: AppColor.mainColor,
                    size: Dimensions.height15,
                  )),
            ),
            SizedBox(
              width: Dimensions.width5,
            ),
            SmallText(text: "4.8"),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "126"),
            SizedBox(width: Dimensions.width5),
            SmallText(text: "Comments")
          ],
        ),
        SizedBox(
          height:Dimensions.height10,
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextAndIconWidget(icon: Icons.location_on, text: "7.1 km", textColor: AppColor.textColor, iconColor:AppColor.mainColor,relativeSize:iconSize , ),
            TextAndIconWidget(icon: Icons.alarm, text: "24 min", textColor: AppColor.textColor, iconColor: Colors.black,relativeSize:iconSize ,),
            TextAndIconWidget(icon: Icons.monetization_on, text: "~\$70", textColor: AppColor.textColor, iconColor:const Color.fromARGB(255, 96, 231, 17),relativeSize:iconSize, )
          ],
        ),
      ],
    );
  }
}
