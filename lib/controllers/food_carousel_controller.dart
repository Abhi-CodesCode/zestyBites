import 'package:get/get.dart';
import 'package:zestybites/data/repository/food_carousel_repo.dart';

class FoodCarouselController extends GetxController{
  final FoodCarouselRepo foodCarouselRepo;
  FoodCarouselController({required this.foodCarouselRepo});

  List<dynamic> _foodCarouselList=[];
  List<dynamic> get foodCarouselList => _foodCarouselList=[];

  Future<void> getFoodCarouselList()async{
    Response response= await foodCarouselRepo.getFoodCarouselList();
    if(response.statusCode==200){
      _foodCarouselList=[];
      update();
      //_foodCarouselList.addAll();
    }else{

    }
  }
}