import 'package:flutter/material.dart';

import 'recipe_list_view_component.dart';
import '../../models/Recipe.dart';
import '../../utils/text_util.dart';

class RecipeListView extends StatelessWidget {
  const RecipeListView({
    Key key,
    @required this.title,
    @required this.recipesList,
    @required this.constraints,
  }) : super(key: key);

  final String title;
  final List<Recipe> recipesList;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight - (constraints.maxHeight * 0.05),
      width: double.infinity,
      margin: EdgeInsets.only(
        top: constraints.maxHeight * 0.05,
      ),
      padding: EdgeInsets.only(
        left: 30,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: TextUtil.boldHeader,
            ),
          ),
          Expanded(
            child: RecipeListViewComponent(
              recipeList: recipesList,
            ),
          ),
        ],
      ),
    );
  }
}
