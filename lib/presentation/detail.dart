import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/api/services/service.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService().getProductList(),
      builder: ((BuildContext context,
          AsyncSnapshot<List<Map<dynamic, dynamic>>?> snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(snapshot.data![0]['strDrinkThumb']))),
                    height: 400.h,
                    width: double.infinity,
                  
                  ),
                  Text(snapshot.data![0]['strInstructions'])
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
