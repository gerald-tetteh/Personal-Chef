import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Recipe.dart';
import '../../hiddenDetails.dart';

class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipes = [];
  List<Recipe> get recipes => [..._recipes];

  Future<void> complexSearch(String keyword) async {
    if (keyword.trim().isEmpty) {
      _recipes = [];
      notifyListeners();
      return;
    }
    var searchUrl =
        "https://api.spoonacular.com/recipes/complexSearch?query=${Uri.encodeFull(keyword)}&number=100&apiKey=${HiddenDetails.apikey}";
    try {
      final response = await http.get(searchUrl);
      final responseBody = json.decode(response.body) as Map<String, Object>;
      final results = responseBody["results"] as List<dynamic>;
      _recipes = results.map((recipie) {
        return Recipe(
          id: recipie["id"],
          imageUrl: recipie["image"],
          title: recipie["title"],
        );
      }).toList();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
