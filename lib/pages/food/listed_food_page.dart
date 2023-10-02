import 'package:flutter/material.dart';
import 'package:zestybites/utils/app_color.dart';
import 'package:zestybites/utils/dimensions.dart';
import 'package:zestybites/widgets/big_text.dart';
import 'package:zestybites/widgets/expandable_text_widget.dart';
import 'package:zestybites/widgets/navigation_icon.dart';

class ListedFoodPage extends StatelessWidget {
  final Map<String, dynamic> pageData;
  const ListedFoodPage({super.key, required this.pageData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,

            toolbarHeight: 70,
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(

                  child: const NavigationIcon(
                    icon: Icons.arrow_back_rounded,
                    size: 33,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  }
                ),
                GestureDetector(
                  child: const NavigationIcon(
                    icon: Icons.shopping_cart_outlined,
                    size: 35,
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                  padding: EdgeInsets.only(
                      bottom: Dimensions.height10, top: Dimensions.height10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20)),
                    color: Colors.white,
                  ),
                  width: double.maxFinite,
                  child: Center(
                      child: BigText(
                    text: pageData['title'],
                  ))),
            ),
            backgroundColor: const Color(0xffF6B452),
            pinned: true,
            expandedHeight: Dimensions.imageHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                 pageData['image'].replaceFirst("http://127.0.0.1:8000/","http://10.0.2.2:8000/"),
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height8),
                  margin: EdgeInsets.only(
                      left: Dimensions.width15, right: Dimensions.width15),
                  child:  ExpandableTextWidget(
                      textHeightRatio: 1.8,
                      text:pageData['description']

                  )
              )
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20 * 3,
                right: Dimensions.width20 * 3,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const NavigationIcon(icon: Icons.remove),
                BigText(text: "\$  12.77  X  1 "),
                const NavigationIcon(icon: Icons.add),
              ],
            ),
          ),
          Container(
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20)),
                    padding: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        top: Dimensions.height20,
                        bottom: Dimensions.height20),
                    child: Icon(
                      Icons.favorite,
                      size: Dimensions.iconSize16 * 1.2,
                      color: AppColor.mainColor,
                    )),
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
          )
        ],
      ),
    );
  }
}
