import 'package:flutter/material.dart';

import '../../models/Recipe.dart';
import '../../utils/colors_util.dart';
import '../../utils/default_util.dart';
import '../../pages/recipe_detail_page.dart';

class SearchList extends StatelessWidget {
  final List<Recipe> recipes;
  const SearchList({this.recipes});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () => Navigator.of(context).pushNamed(
                  RecipeDetailPage.routeName,
                  arguments: recipes[index].id),
              leading: CircleAvatar(
                backgroundColor: ColorUtil.green,
                backgroundImage: NetworkImage(
                  DefaultUtil.setImageUrlRecipe(recipes[index].imageUrl),
                ),
              ),
              title: Text(
                recipes[index].title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
        itemCount: recipes.length,
      ),
    );
  }
}
