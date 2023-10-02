import 'dart:convert';

import 'package:http/http.dart' as http;
class FoodItem{
  String baseUrl="http://10.0.2.2:8000/api/fooditem/";
  Future<List> getAllFoodItem()async{
    try{
      var response = await http.get(Uri.parse(baseUrl));
      if(response.statusCode==200){
        return jsonDecode(response.body);
      }
      else{
        return Future.error("Server Error");
      }

    }catch(e){
      return Future.error(e);
    }
  }
}