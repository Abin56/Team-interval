// To parse this JSON data, do
//
//     final searchResults = searchResultsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SearchResults searchResultsFromJson(String str) => SearchResults.fromJson(json.decode(str));

String searchResultsToJson(SearchResults data) => json.encode(data.toJson());

class SearchResults {
    SearchResults({
        required this.drinks,
    });

    List<Map<String, dynamic>> drinks;

    factory SearchResults.fromJson(Map<String, dynamic> json) => SearchResults(
        drinks: List<Map<String, dynamic>>.from(json["drinks"].map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
    );

    Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
    };
}
