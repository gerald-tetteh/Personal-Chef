import 'dart:io';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../components/global/android_text_field.dart';
import '../components/global/ios_text_field.dart';
import '../components/search_page/search_grid.dart';
import '../utils/default_util.dart';
import '../utils/text_util.dart';
import '../components/search_page/seach_list.dart';
import '../providers/RecipeProvider.dart';

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
                          child: Text(
                            "What to eat?",
                            style: TextUtil.lightHeader,
                          ),
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
                child: Consumer(
                  builder: (context, RecipeProvider consumerprovider, child) {
                    if (consumerprovider.isLoading) {
                      return CircularProgressIndicator.adaptive();
                    }
                    return consumerprovider.recipes.isEmpty
                        ? SearchGrid(
                            categoryKeys: _categoryKeys,
                            constraints: constraints,
                          )
                        : SearchList(recipes: consumerprovider.recipes);
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
