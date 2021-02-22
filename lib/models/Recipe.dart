class Recipe {
  final int id;
  final String imageUrl;
  final String title;

  Recipe({this.id, this.imageUrl, this.title});

  static List<Recipe> mapToRecipe(List<Map<String, dynamic>> recipes) {
    return recipes
        .map((recipe) => Recipe(
              id: recipe["id"],
              imageUrl: recipe["imageUrl"],
              title: recipe["title"],
            ))
        .toList();
  }

  @override
  String toString() {
    return this.id.toString();
  }
}
