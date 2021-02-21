import 'package:flutter/material.dart';

import '../../utils/text_util.dart';
import '../../utils/default_util.dart';
import '../../models/Ingredient.dart';
import '../../extensions/string_extension.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    Key key,
    @required this.constraints,
    @required this.ingredients,
  }) : super(key: key);

  final BoxConstraints constraints;
  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight * 0.46,
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Text(
                  "Ingredients",
                  style: TextUtil.boldHeader,
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.53,
                child: ListView.builder(
                  itemCount: ingredients.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return IngredientsListItem(
                      ingredients: ingredients,
                      index: index,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class IngredientsListItem extends StatelessWidget {
  const IngredientsListItem({
    Key key,
    @required this.ingredients,
    @required this.index,
  }) : super(key: key);

  final List<Ingredient> ingredients;
  final int index;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        width: (constraints.maxHeight * 0.7) * 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: constraints.maxHeight * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(DefaultUtil.setIngredientImageUrl(
                      ingredients[index].image)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(child: Text(ingredients[index].nameClean.capitalize())),
          ],
        ),
      );
    });
  }
}
