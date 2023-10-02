import 'package:flutter/material.dart';
import 'package:zestybites/api/food_item.dart';

class FoodListFuture extends StatefulWidget {
  final Widget Function(BuildContext, AsyncSnapshot<List>) builder; // Use Function type
  const FoodListFuture({Key? key, required this.builder}) : super(key: key); // Correct the constructor

  @override
  State<FoodListFuture> createState() => _FoodListFutureState();
}

class _FoodListFutureState extends State<FoodListFuture> {
  FoodItem foodItemService = FoodItem();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: foodItemService.getAllFoodItem(),
      builder: widget.builder, // Use the builder argument
    );
  }
}