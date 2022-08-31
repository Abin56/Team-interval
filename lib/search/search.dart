// import 'package:flutter/material.dart';
// import 'package:task/api/services/searchapi/search_api.dart';

// class Search extends StatelessWidget {
//   const Search({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: ApiSearchService().getSearchList(),
//       builder: (BuildContext context, AsyncSnapshot<List<Map<dynamic, dynamic>>?> snapshot) {
//         if (snapshot.data == null) {
//           return const Center(
//             child: SizedBox(
//                 height: 50, width: 50, child: CircularProgressIndicator()),
//           );
//         } else if (snapshot.data!.isEmpty) {
//           return const Text(
//             "No match found",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 25,
//             ),
//           );
//         } else {
//           return
//           Scaffold(
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Search for Drings'),
//                SizedBox(
//                 height: 10,
//                ),
//                 Expanded(
//                   child: GridView.count(
//                     crossAxisCount: 3,
//                     mainAxisSpacing: 8,
//                     crossAxisSpacing: 8,
//                     childAspectRatio: 1 / 1.4,
//                     shrinkWrap: true,
//                     children: List.generate(snapshot.data!.length, (index) {
//                       return MainCard(
//                         index: index,
//                       );
//                     }),
//                   ),
//                 )
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
// }

// class MainCard extends StatelessWidget {
//   int index;
//   MainCard({Key? key, required this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: ApiSearchService().getSearchList(),
//       builder: (BuildContext context, AsyncSnapshot<List<Map<dynamic, dynamic>>?> snapshot) {
//         if (snapshot.data == null) {
//           return const Center(
//             child: SizedBox(
//                 height: 40, width: 40, child: CircularProgressIndicator()),
//           );
//         } else {
//           return Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: NetworkImage(snapshot.data![index]['strDrinkThumb']),
//                 ),
//                 borderRadius: BorderRadius.circular(7)),
//           );
//         }
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/api/services/searchapi/search_api.dart';
import 'package:task/presentation/detail.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: ((context) => const Homescreen())));
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: ApiSearchService().getSearchList(query),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<dynamic, dynamic>>?> snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      leading: InkWell(
                        onTap: () => Get.to(DetailsScreen()),
                        child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      snapshot.data![index]['strDrinkThumb']))),
                        ),
                      ),
                      title: Text(snapshot.data![index]['strDrink']),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: 10);
          }
        });
  }
}
