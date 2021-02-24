import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/RecipeProvider.dart';
import '../components/global/recipe_list_view.dart';
import '../models/Recipe.dart';
import '../components/global/empty_widget.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeProvider>(context);
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
              return EmptyWidgetComponent(
                text: "Nothing Here Yet :)",
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
