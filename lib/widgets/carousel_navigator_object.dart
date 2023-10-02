import 'package:flutter/material.dart';
import 'package:zestybites/pages/food/carousel_food_page.dart';

class CarouselNavigatorObject extends StatelessWidget {
  final Widget child;
  final Map<String, dynamic> pageData;

  const CarouselNavigatorObject({super.key, required this.child, required this.pageData});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:() {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CarouselFoodPage(pageData:pageData)));
      },
      child: child,
    );
  }
}
