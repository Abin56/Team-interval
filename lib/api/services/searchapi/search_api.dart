import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:task/api/services/searchapi/search_mode.dart';


class ApiSearchService{
  final dio = Dio(BaseOptions(
      responseType: ResponseType.plain,
      ));
 
  //product list
  Future<List<Map>?> getSearchList(String search) async {
    try {
      final response = await dio.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$search#");
      // print(jsonDecode(response.data));
     
      var result = SearchResults.fromJson(jsonDecode(response.data));
      //  log(response.data.toString());
       log('/////////${result.toString()}');
      //  log(result.drinks[0]['strDrinkThumb'].toString());
       log(result.drinks[0].toString());

      return result.drinks;
    } catch (e) {
          print("sdlbfilasbfiabsdliufblaiuwdfbiasdjkf");
      log(e.toString());
  
    }
    return null;
  }
}