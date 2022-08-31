import 'package:get/get.dart';
import 'package:task/api/list_api.dart';
import 'package:task/api/services/service.dart';

class Getx extends GetxController{
   var list = [].obs;
   
   @override
  void onInit() async{
  
  //  list =  await  ApiService().getProductList();
 
    super.onInit();
  } 

}