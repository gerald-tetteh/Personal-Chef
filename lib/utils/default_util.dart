import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DefaultUtil {
  static const unknown = "Unkown";

  static const imageSizeUrl = "636x393";
  static const ingredientImageSize = "500x500";

  static const githubUrl = "https://github.com/gerald-tetteh/Personal-Chef";
  static const email = "addodevelop@gmail.com";
  static const linkedInProfile =
      "https://www.linkedin.com/in/gerald-addo-tetteh-a28101182";

  static const Map<String, List> categories = {
    "Quickly": [Color(0xffffecb3), "assets/images/quick_food.jpg", "type"],
    "Breakfast": [Color(0xffbbdefb), "assets/images/breakfast.jpeg", "type"],
    "Vegetarian": [Color(0xfff8bbd0), "assets/images/vegetarian.jpg", "diet"],
    "Primal": [Color(0xffd1c4e9), "assets/images/primal.jpg", "diet"],
    "Kelogenic": [Color(0xffb2dfdb), "assets/images/ketogenic.jpeg", "diet"],
    "Dessert": [Color(0xfff0f4c3), "assets/images/dessert.jpeg", "type"]
  };

  static String setImageUrlRecipe(String url) {
    final indexOfSize = url.indexOf("-") + 1;
    final subString1 = url.substring(0, indexOfSize);
    final indexOfFileType = url.indexOf(".png");
    if (indexOfFileType == -1) {
      return "$subString1${DefaultUtil.imageSizeUrl}.jpg";
    }
    return "$subString1${DefaultUtil.imageSizeUrl}.png";
  }

  static String setIngredientImageUrl(String image) =>
      "https://spoonacular.com/cdn/ingredients_$ingredientImageSize/$image";

  static SnackBar showSnackBar(String text, bool isAndroid) {
    return SnackBar(
      content: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              isAndroid
                  ? Icons.error_outline
                  : CupertinoIcons.exclamationmark_triangle,
              color: Colors.red,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }

  static String checkString(String text) {
    if (text == null || text.isEmpty) {
      return DefaultUtil.unknown;
    }
    return text;
  }
}
