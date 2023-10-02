import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zestybites/widgets/small_text.dart';
import 'package:zestybites/widgets/text_and_icon_widget.dart';

import '../utils/app_color.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class FoodHeader extends StatelessWidget {
  final double bigTextSize;
  final double iconSize;
  dynamic snapshotData;
  final int index;
  FoodHeader({
    super.key,

    this.snapshotData,
    this.bigTextSize=1,
    this.iconSize=1,
    required this.index,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: Dimensions.width10,left: Dimensions.width8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: snapshotData[index]['title'],relativeSize: bigTextSize,),
          SizedBox(
            height: Dimensions.height8,
          ), //for spacing
          Row(
            children: [
              SizedBox(
                width: Dimensions.height15*0.83*6.7,
                child: Row(
                  children: [
                    Wrap(
                      children: List.generate(
                          double.parse(snapshotData[index]['rating']).round(),
                              (index) =>  Icon(
                            Icons.star,
                            color: AppColor.mainColor,
                            size: Dimensions.height15*0.83,
                          )),
                    ),
                    SmallText(text: " "+snapshotData[index]['rating']),
                  ],
                ),
              ),

              SizedBox(width: Dimensions.width10),
              SmallText(text: (snapshotData[index]['comment_count']).toString()),
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
              TextAndIconWidget(icon: Icons.location_on, text: "${snapshotData[index]['distance']} km", textColor: AppColor.textColor, iconColor:AppColor.mainColor,relativeSize:iconSize , ),
              TextAndIconWidget(icon: Icons.alarm, text: "${snapshotData[index]['time']} min", textColor: AppColor.textColor, iconColor: Colors.black,relativeSize:iconSize ,),
              TextAndIconWidget(icon: Icons.monetization_on, text: "~\$${snapshotData[index]['cost_per_person']}", textColor: AppColor.textColor, iconColor:const Color.fromARGB(255, 72, 184, 7),relativeSize:iconSize, )
            ],
          ),
        ],
      ),
    );
  }
}