import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/presentation/home_screen.dart';



class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    // GoHomeScreen(context);
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Team Interval",
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 44.0,
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "User Email ",
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "User Password ",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 88,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RawMaterialButton(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    fillColor: Colors.blue,
                    elevation: 0.0,
                    onPressed: () {
                      if (_emailController.text == 'teaminterval@123' &&
                          _passwordController.text == '1234') {
                        log(_passwordController.text.toString());
                        log(_emailController.text.toString());
                        Get.to(const HomeScreen());
                      } else {
                        // ignore: void_checks
                        final snackBar = SnackBar(
                          content: const Text('Invalid Username or password '),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// GoHomeScreen(context) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool? isOnBoard = prefs.getBool('seenonboard');
//   if (isOnBoard == true) {
  
//     // ignore: use_build_context_synchronously
// Get.to(HomeScreen());
//   } else {
    
//     // ignore: use_build_context_synchronously
//    Get.offAll(LoginScreen());
//   }
// }
