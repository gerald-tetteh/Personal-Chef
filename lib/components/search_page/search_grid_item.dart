import 'package:flutter/material.dart';

class SearchGridItem extends StatelessWidget {
  final String imagePath;
  final Color color;
  final String text;

  const SearchGridItem({
    Key key,
    this.color,
    this.text,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                imagePath,
                height: (constraints.maxHeight - 2 * 10) * 0.7,
                fit: BoxFit.scaleDown,
              ),
              Text(text),
            ],
          ),
        ),
      );
    });
  }
}
