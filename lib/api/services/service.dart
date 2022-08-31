// import 'dart:developer';

// import 'package:http/http.dart 'as http;
// import 'package:task/api/list_api.dart';
// class RemoteServices{

//   static var client = http.Client();
//   static  Future<List<Map<String, String>>>fetchProblems()async{
//     final urls = Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/search.php?s=rum#');
//    var response = await http.get(urls);
//    final datas = channelinfoFromJson(response.body);
//    log(response.body .toString());
//    return datas.drinks;
   
  

  



//   }

//   }
import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:developer';

import 'package:task/api/list_api.dart';
class ApiService{
  final dio = Dio(BaseOptions(
      responseType: ResponseType.plain,
      ));
 
  //product list
  Future<List<Map>?> getProductList() async {
    try {
      final response = await dio.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=rum#");
      // print(jsonDecode(response.data));
     
      var result = Results.fromJson(jsonDecode(response.data));
      //  log(response.data.toString());
       log('/////////${result.toString()}');
       log(result.drinks[0]['strDrinkThumb'].toString());

      return result.drinks;
    } catch (e) {
          print("sdlbfilasbfiabsdliufblaiuwdfbiasdjkf");
      log(e.toString());
  
    }
    return null;
  }
}
