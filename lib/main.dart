import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/presentation/home_screen.dart';
import 'package:task/presentation/login_screen.dart';
bool? seenonboard;
Future<void> main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // SharedPreferences pref = await SharedPreferences.getInstance();
  // seenonboard = pref.getBool('seenonboard') ?? false; // If null  set to false
 
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    
    return ScreenUtilInit(
      designSize: const Size(423.5294196844927, 925.0980565145541),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                ),
                bodyText2: TextStyle(color: Colors.black)),
          ),
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        );
      },
    );
  }
}

