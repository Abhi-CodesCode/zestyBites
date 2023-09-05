import 'package:get/get.dart';
import 'package:zestybites/data/api/api_client.dart';

class FoodCarouselRepo extends GetxService{
  final ApiClient apiClient;
  FoodCarouselRepo({required this.apiClient});

  Future<Response> getFoodCarouselList()async{
    return await apiClient.getData("uri");
  }

}