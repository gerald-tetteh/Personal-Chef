import 'dart:io';

import 'package:flutter/material.dart';

class MealColumnDetails extends StatelessWidget {
  const MealColumnDetails({
    Key key,
    @required this.text,
    @required this.androidIcon,
    @required this.iosIcon,
  }) : super(key: key);

  final String text;
  final IconData iosIcon;
  final IconData androidIcon;

  @override
  Widget build(BuildContext context) {
    final isAndroid = Platform.isAndroid;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(isAndroid ? androidIcon : iosIcon),
        Text(text),
      ],
    );
  }
}
