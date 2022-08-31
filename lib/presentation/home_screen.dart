import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:task/api/services/service.dart';
import 'package:task/search/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List of Drinks'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: (() =>
                        showSearch(context: (context), delegate: Search())),
                    icon: Icon(Icons.search))
              ],
            )
          ],
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: ApiService().getProductList(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<dynamic, dynamic>>?> snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                          leading: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(snapshot.data![index]
                                        ['strDrinkThumb']))),
                          ),
                          title: Text(snapshot.data![index]['strDrink']),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                    itemCount: 10);
              }
            })
            );
  }
}
// Container(
                         
//                           height: 300,
//                           width: 300,
//                         decoration:BoxDecoration(

//                             image: DecorationImage(
//                               image: NetworkImage(snapshot.data![index]['strDrinkThumb']))
//                           ),
//                         ),
