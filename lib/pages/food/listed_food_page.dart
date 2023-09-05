

import 'package:flutter/material.dart';
import 'package:zestybites/utils/app_color.dart';
import 'package:zestybites/utils/dimensions.dart';
import 'package:zestybites/widgets/big_text.dart';
import 'package:zestybites/widgets/expandable_text_widget.dart';
import 'package:zestybites/widgets/navigation_icon.dart';

class ListedFoodPage extends StatelessWidget {
  const ListedFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationIcon(icon: Icons.arrow_back_rounded,size: 35,),
                NavigationIcon(icon: Icons.shopping_cart_outlined,size: 35,),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                padding: EdgeInsets.only(bottom: Dimensions.height10,top:Dimensions.height10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(Dimensions.radius20),topRight: Radius.circular(Dimensions.radius20) ),
                    color: Colors.white,

                ),
                  width: double.maxFinite,
                  child: Center(child: BigText(text:"PizzaHub",))),
            ),
            backgroundColor: Color(0xffF6B452),
            pinned: true,
            expandedHeight: Dimensions.imageHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/image/food0.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,),

            ),
          ),
           SliverToBoxAdapter(
            child: Container(
                padding:EdgeInsets.only(top: Dimensions.height8),
                margin:EdgeInsets.only(left: Dimensions.width15,right: Dimensions.width15),
                child: const ExpandableTextWidget(
                    textHeightRatio: 1.8,
                    text:"PizzaHub: Where Pizza Dreams Come True. Nestled in the heart of the city, PizzaHub is a haven for pizza lovers, offering a modern yet cozy interior that sets the stage for a tantalizing culinary experience. The open kitchen allows skilled chefs to craft pizzas before your eyes, sliding them into wood-fired ovens, creating an interactive and captivating atmosphere. The menu is a symphony of flavors, ranging from classic Margheritas to innovative options like BBQ Pulled Pork and Pineapple Jalapeno Fusion pizzas. Complement your meal with artisanal sodas, craft beers, or expertly curated wines. Whether you choose to dine in, take out, or have it delivered, PizzaHub embodies a celebration of pizza artistry, promising to not only delight your taste buds but also fulfill your pizza fantasies. Beyond the extraordinary food, the warm and welcoming staff add a memorable touch, reflecting their passion for pizza and dedication to impeccable service, elevating your experience. With a sincere commitment to quality ingredients, creative culinary twists, and an authentic love for pizza, PizzaHub transcends being a mere restaurant – it stands as a destination where pizza dreams manifest into reality.PizzaHub: Where Pizza Dreams Come True. Nestled in the heart of the city, PizzaHub is a haven for pizza lovers, offering a modern yet cozy interior that sets the stage for a tantalizing culinary experience. The open kitchen allows skilled chefs to craft pizzas before your eyes, sliding them into wood-fired ovens, creating an interactive and captivating atmosphere. The menu is a symphony of flavors, ranging from classic Margheritas to innovative options like BBQ Pulled Pork and Pineapple Jalapeno Fusion pizzas. Complement your meal with artisanal sodas, craft beers, or expertly curated wines. Whether you choose to dine in, take out, or have it delivered, PizzaHub embodies a celebration of pizza artistry, promising to not only delight your taste buds but also fulfill your pizza fantasies. Beyond the extraordinary food, the warm and welcoming staff add a memorable touch, reflecting their passion for pizza and dedication to impeccable service, elevating your experience. With a sincere commitment to quality ingredients, creative culinary twists, and an authentic love for pizza, PizzaHub transcends being a mere restaurant – it stands as a destination where pizza dreams manifest into reality."))
          )

        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: Dimensions.width20*3,right: Dimensions.width20*3,top: Dimensions.height10,bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationIcon(icon: Icons.remove),
                BigText(text: "\$ "+" 12.77 "+" X "+" 1 "),
                NavigationIcon(icon: Icons.add),
              ],
            ),
          ),
          Container(
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
                  child: Icon(Icons.favorite,size: Dimensions.iconSize16*1.2,color: AppColor.mainColor,)
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
          )
        ],
      ),
    );
  }
}
