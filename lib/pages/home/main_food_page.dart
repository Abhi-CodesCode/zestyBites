import 'package:flutter/material.dart';
import 'package:zestybites/utils/app_color.dart';
import 'package:zestybites/utils/dimensions.dart';
import 'package:zestybites/widgets/big_text.dart';
import 'package:zestybites/widgets/small_text.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {

  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => MainFoodPageState();
}

class MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white70,
      resizeToAvoidBottomInset: true,

      body: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 1.2*Dimensions.height40, bottom: Dimensions.height8),
          padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  BigText(
                    text: "India",
                    height: 1.2,
                    color: AppColor.mainColor,
                  ),
                  Row(
                    children: [
                      SmallText(text: "Lucknow"),
                      const Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 13,
                      )
                    ],
                  ),
                ],
              ),
              Center(
                child: Container(
                  width: Dimensions.iconBoxSize,
                  height: Dimensions.iconBoxSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.height15),
                    color: AppColor.mainColor,
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: Dimensions.iconSize30,
                  ),
                ),
              )
            ],
          ),
        ),
         Expanded(child: SingleChildScrollView(padding:EdgeInsets.only(bottom: Dimensions.height10),child: const FoodPageBody())),
      ]),
    );
  }
}
