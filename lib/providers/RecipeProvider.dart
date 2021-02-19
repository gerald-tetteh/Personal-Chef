import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Recipe.dart';
import '../../hiddenDetails.dart';

class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipes = [];
  List<Recipe> get recipes => [..._recipes];
  set setRecipes(List<Recipe> list) {
    _recipes = list;
    notifyListeners();
  }

  List<Recipe> _categoryRecipes = [];
  List<Recipe> get categoryRecipes => [..._categoryRecipes];

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> complexSearch(String keyword) async {
    if (keyword.trim().isEmpty) {
      return;
    }
    isLoading = true;
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
      isLoading = false;
    } catch (e) {
      print(e.toString());
      isLoading = false;
    }
  }

  Future<void> categorySearch(String apiUrl, String categoryName) async {
    categoryName = categoryName.toLowerCase();
    if (categoryName == "quickly") {
      categoryName = "snack";
    }
    var searchUrl =
        "https://api.spoonacular.com/recipes/complexSearch?$apiUrl=$categoryName&number=100&apiKey=${HiddenDetails.apikey}";
    try {
      final response = await http.get(searchUrl);
      final responseBody = jsonDecode(response.body) as Map<String, Object>;
      final results = responseBody["results"] as List<dynamic>;
      _categoryRecipes = results.map((recipie) {
        return Recipe(
          id: recipie["id"],
          imageUrl: recipie["image"],
          title: recipie["title"],
        );
      }).toList();
    } catch (e) {
      print(e.toString());
    }
  }
}
