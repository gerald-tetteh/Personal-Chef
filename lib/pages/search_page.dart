import 'dart:io';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

import '../components/global/android_text_field.dart';
import '../components/global/ios_text_field.dart';
import '../components/search_page/search_grid_item.dart';
import '../utils/default_util.dart';

class SearchPage extends StatelessWidget {
  final _isAndroid = Platform.isAndroid;
  final _categoryKeys = DefaultUtil.categories.keys.toList();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: constraints.maxHeight * 0.01,
              ),
              height: constraints.maxHeight * 0.21,
              width: constraints.maxWidth,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: constraints.maxHeight * 0.1,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          child: Text("What to eat?"),
                          margin: const EdgeInsets.only(bottom: 10),
                        ),
                        _isAndroid
                            ? const AndroidTextField()
                            : const IosTextField(),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: constraints.maxHeight * 0.78,
              width: constraints.maxWidth,
              child: Center(
                child: CustomScrollView(
                  slivers: [
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 13,
                        mainAxisExtent:
                            ((constraints.maxHeight * 0.78) - (13 * 3)) / 3,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (ctx, index) {
                          final itemDetails =
                              DefaultUtil.categories[_categoryKeys[index]];
                          return SearchGridItem(
                            color: itemDetails[0],
                            imagePath: itemDetails[1],
                            text: _categoryKeys[index],
                          );
                        },
                        childCount: 6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
