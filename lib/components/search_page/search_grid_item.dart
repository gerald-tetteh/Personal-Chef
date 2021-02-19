import 'package:flutter/material.dart';

import '../../pages/category_detail_page.dart';

class SearchGridItem extends StatelessWidget {
  final String imagePath;
  final Color color;
  final String text;
  final String apiUrl;

  const SearchGridItem({
    Key key,
    this.color,
    this.text,
    this.imagePath,
    this.apiUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          CategoryDetailPage.routeName,
          arguments: {"apiUrl": apiUrl, "categoryName": text},
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
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
                    height: (constraints.maxHeight - 2 * 10) * 0.69,
                    fit: BoxFit.scaleDown,
                  ),
                  FittedBox(
                    child: Text(text),
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
