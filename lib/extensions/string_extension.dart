extension StringExtension on String {
  String capitalize() {
    final listOfWords = this.trim().split(" ");
    return listOfWords.map((word) {
      return word[0].toUpperCase() + word.substring(1);
    }).join(" ");
  }
}
