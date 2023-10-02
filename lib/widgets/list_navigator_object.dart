import 'package:flutter/material.dart';
import 'package:zestybites/pages/food/listed_food_page.dart';

class ListNavigatorObject extends StatelessWidget {
  final Widget child;
  final Map<String, dynamic> pageData;

  const ListNavigatorObject({super.key, required this.child, required this.pageData});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:() {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ListedFoodPage(pageData:pageData)));
      },
      child: child,
    );
  }
}
