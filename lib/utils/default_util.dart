import 'package:flutter/material.dart';

class DefaultUtil {
  static final imageSizeUrl = "636x393";

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
}
