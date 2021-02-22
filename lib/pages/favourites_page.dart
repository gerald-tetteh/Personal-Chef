import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/RecipeProvider.dart';
import '../components/global/recipe_list_view.dart';
import '../models/Recipe.dart';
import '../utils/text_util.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeProvider>(context, listen: false);
    return Container(
      child: FutureBuilder<List<Recipe>>(
        future: provider.getFavouritesList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return LayoutBuilder(builder: (context, constraints) {
            if (snapshot.data.isEmpty) {
              return Center(
                child: Text(
                  "Nothing Here Yet :)",
                  style: TextUtil.boldHeader,
                ),
              );
            }
            return RecipeListView(
              constraints: constraints,
              recipesList: snapshot.data,
              title: "Favourites",
            );
          });
        },
      ),
    );
  }
}
