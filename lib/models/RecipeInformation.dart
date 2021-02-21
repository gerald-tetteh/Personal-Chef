import 'Ingredient.dart';

class RecipeInformation {
  final int id;
  final String title;
  final String image;
  final String pairingText;
  final int readyInMinutes;
  final int servings;
  final double healthScore;
  final String sourceName;
  final List<Ingredient> ingredients;

  RecipeInformation({
    this.id,
    this.title,
    this.image,
    this.pairingText,
    this.readyInMinutes,
    this.servings,
    this.healthScore,
    this.sourceName,
    this.ingredients,
  });

  @override
  String toString() {
    return this.ingredients.length.toString();
  }
}
