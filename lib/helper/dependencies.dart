import 'package:get/get.dart';
import 'package:zestybites/controllers/food_carousel_controller.dart';
import 'package:zestybites/data/api/api_client.dart';
import 'package:zestybites/data/repository/food_carousel_repo.dart';

Future<void> init()async{
  //ApiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://appBaseUrl.com"));

  //repository
  Get.lazyPut(() => FoodCarouselRepo(apiClient: Get.find()));

  //Controller
  Get.lazyPut(() => FoodCarouselController(foodCarouselRepo: Get.find()));

} 