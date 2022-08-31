// To parse this JSON data, do
//
//     final results = resultsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));

String resultsToJson(Results data) => json.encode(data.toJson());

class Results {
    Results({
        required this.drinks,
    });

    List<Map<String, dynamic>> drinks;

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        drinks: List<Map<String, dynamic>>.from(json["drinks"].map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
    );

    Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
    };
}
