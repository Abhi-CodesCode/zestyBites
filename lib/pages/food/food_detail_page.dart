import 'package:flutter/material.dart';
import 'package:zestybites/utils/app_color.dart';
import 'package:zestybites/utils/dimensions.dart';
import 'package:zestybites/widgets/big_text.dart';
import 'package:zestybites/widgets/expandable_text_widget.dart';
import 'package:zestybites/widgets/navigation_icon.dart';
import 'package:zestybites/widgets/small_text.dart';

import '../../widgets/food_header.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          //MainFoodImage
          Positioned(
              left:0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.imageHeight,
                decoration: const BoxDecoration(
                  image:DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/food0.jpg"),
                  )
                ),
              )),
          //buttons-back button and cart button
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: (Dimensions.height40*5)/4,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                NavigationIcon(icon: Icons.arrow_back_ios,),
                NavigationIcon(icon: Icons.shopping_cart_outlined)
          ],)),
          //food main
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.imageHeight-Dimensions.height15,
              child: Container(
                  height: Dimensions.screenHeight/2.1,
                  padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height15,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.width5,),
                      const FoodHeader(text: "PizzaHub",bigTextSize: 1.15,iconSize: 1.1,),
                      SizedBox(height: Dimensions.height10,),
                       Expanded(child: SingleChildScrollView(child:Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           BigText(text: "Description"),
                           SizedBox(height: Dimensions.height8,),
                           const  ExpandableTextWidget(text: "PizzaHub: Where Pizza Dreams Come True. Nestled in the heart of the city, PizzaHub is a haven for pizza lovers, offering a modern yet cozy interior that sets the stage for a tantalizing culinary experience. The open kitchen allows skilled chefs to craft pizzas before your eyes, sliding them into wood-fired ovens, creating an interactive and captivating atmosphere. The menu is a symphony of flavors, ranging from classic Margheritas to innovative options like BBQ Pulled Pork and Pineapple Jalapeno Fusion pizzas. Complement your meal with artisanal sodas, craft beers, or expertly curated wines. Whether you choose to dine in, take out, or have it delivered, PizzaHub embodies a celebration of pizza artistry, promising to not only delight your taste buds but also fulfill your pizza fantasies. Beyond the extraordinary food, the warm and welcoming staff add a memorable touch, reflecting their passion for pizza and dedication to impeccable service, elevating your experience. With a sincere commitment to quality ingredients, creative culinary twists, and an authentic love for pizza, PizzaHub transcends being a mere restaurant – it stands as a destination where pizza dreams manifest into reality.PizzaHub: Where Pizza Dreams Come True. Nestled in the heart of the city, PizzaHub is a haven for pizza lovers, offering a modern yet cozy interior that sets the stage for a tantalizing culinary experience. The open kitchen allows skilled chefs to craft pizzas before your eyes, sliding them into wood-fired ovens, creating an interactive and captivating atmosphere. The menu is a symphony of flavors, ranging from classic Margheritas to innovative options like BBQ Pulled Pork and Pineapple Jalapeno Fusion pizzas. Complement your meal with artisanal sodas, craft beers, or expertly curated wines. Whether you choose to dine in, take out, or have it delivered, PizzaHub embodies a celebration of pizza artistry, promising to not only delight your taste buds but also fulfill your pizza fantasies. Beyond the extraordinary food, the warm and welcoming staff add a memorable touch, reflecting their passion for pizza and dedication to impeccable service, elevating your experience. With a sincere commitment to quality ingredients, creative culinary twists, and an authentic love for pizza, PizzaHub transcends being a mere restaurant – it stands as a destination where pizza dreams manifest into reality."),
                         ],
                         )
                        )
                       )
                      ],
                    )
                )
              )
          //expandable Text
        ],
      ),
      bottomNavigationBar: Container(
        height:Dimensions.bottomBarHeight,
        padding: EdgeInsets.symmetric(vertical: Dimensions.height20,horizontal: Dimensions.width20),
        decoration: BoxDecoration(
          color: const Color(0xffE5E5E5),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius30),topRight: Radius.circular(Dimensions.radius30))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20)
              ) ,
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20,bottom: Dimensions.height20),
              child: Row(
                children: [
                  const Icon(Icons.remove,color: AppColor.signColor,),
                  SizedBox(width: Dimensions.width5,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width5,),
                  const Icon(Icons.add,color: AppColor.signColor,)
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: AppColor.backgroundMainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20)
                ),
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20,bottom: Dimensions.height20),
                child: BigText(text: "\$5 | Add to Cart",relativeSize: 0.9,),
            )
          ],
        ),
      ),
    );
  }
}
