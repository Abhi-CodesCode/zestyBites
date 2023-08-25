import 'package:flutter/material.dart';
import 'package:zestybites/utils/dimensions.dart';
import 'package:zestybites/widgets/small_text.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
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
              )
          )
        ],
      ),
    );
  }
}
