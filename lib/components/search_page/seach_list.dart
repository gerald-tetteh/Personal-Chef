import 'package:flutter/material.dart';

import '../../models/Recipe.dart';

class SearchList extends StatelessWidget {
  final List<Recipe> recipes;
  const SearchList({this.recipes});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(recipes.length.toString()),
    );
  }
}
