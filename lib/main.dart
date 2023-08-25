import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zestybites/pages/food/food_detail_page.dart';
import 'package:zestybites/pages/home/main_food_page.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ZestyBites',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FoodDetailPage(),
    );
  }
}
//Future hideStatusBar() => SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
