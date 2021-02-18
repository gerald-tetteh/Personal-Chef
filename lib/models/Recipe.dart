class Recipe {
  final int id;
  final String imageUrl;
  final String title;

  Recipe({this.id, this.imageUrl, this.title});

  @override
  String toString() {
    return this.id.toString();
  }
}
