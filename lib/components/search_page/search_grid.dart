import 'package:flutter/material.dart';

import '../../utils/default_util.dart';
import 'search_grid_item.dart';

class SearchGrid extends StatelessWidget {
  SearchGrid(
      {Key key,
      @required List<String> categoryKeys,
      @required BoxConstraints constraints})
      : _categoryKeys = categoryKeys,
        _constraints = constraints,
        super(key: key);

  final List<String> _categoryKeys;
  final BoxConstraints _constraints;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 13,
            mainAxisExtent: ((_constraints.maxHeight * 0.78) - (13 * 3)) / 3,
          ),
          delegate: SliverChildBuilderDelegate(
            (ctx, index) {
              final itemDetails = DefaultUtil.categories[_categoryKeys[index]];
              return SearchGridItem(
                color: itemDetails[0],
                imagePath: itemDetails[1],
                text: _categoryKeys[index],
                apiUrl: itemDetails[2],
              );
            },
            childCount: 6,
          ),
        ),
      ],
    );
  }
}
