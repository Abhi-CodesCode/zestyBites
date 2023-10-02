import 'package:flutter/material.dart';
import 'package:zestybites/utils/app_color.dart';
import 'package:zestybites/utils/dimensions.dart';
import 'package:zestybites/widgets/big_text.dart';
import 'package:zestybites/widgets/expandable_text_widget.dart';
import 'package:zestybites/widgets/navigation_icon.dart';
import 'package:zestybites/widgets/small_text.dart';

import '../../widgets/food_header.dart';

class CarouselFoodPage extends StatelessWidget {
  final Map<String, dynamic> pageData;
  const CarouselFoodPage({super.key, required this.pageData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //MainFoodImage
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.imageHeight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(pageData['image'].replaceFirst("http://127.0.0.1:8000/","http://10.0.2.2:8000/"),
                  )
                    ),
                )
              ),
          ),
          //buttons-back button and cart button
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: (Dimensions.height40 * 5) / 4,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      child: const NavigationIcon(
                        icon: Icons.arrow_back_ios,
                        size: 35,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      }
                  ),
                  GestureDetector(
                    child: const NavigationIcon(
                      icon: Icons.shopping_cart,
                      size: 35,
                    ),
                  ),
                ],
              )),
          //food main
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.imageHeight - Dimensions.height15,
              child: Container(
                  height: Dimensions.screenHeight / 2.1,
                  padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height15,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Dimensions.width5,
                      ),

                      FoodHeader(
                        data: pageData,
                        bigTextSize: 1.15,
                        iconSize: 1.1,
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: "Description"),
                          SizedBox(
                            height: Dimensions.height8,
                          ),
                           ExpandableTextWidget(
                              text:
                              pageData['description'])                        ],
                      )))
                    ],
                  )))
          //expandable Text
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomBarHeight,
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.height20, horizontal: Dimensions.width20),
        decoration: BoxDecoration(
            color: const Color(0xffE5E5E5),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius30),
                topRight: Radius.circular(Dimensions.radius30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20)),
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20,
                  bottom: Dimensions.height20),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove,
                    color: AppColor.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width5,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.width5,
                  ),
                  const Icon(
                    Icons.add,
                    color: AppColor.signColor,
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.backgroundMainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius20)),
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20,
                  bottom: Dimensions.height20),
              child: BigText(
                text: "\$5 | Add to Cart",
                relativeSize: 0.9,
              ),
            )
          ],
        ),
      ),
    );
  }
}
