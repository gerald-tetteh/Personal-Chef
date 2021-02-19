import 'package:flutter/material.dart';

import '../../utils/default_util.dart';
import '../../utils/text_util.dart';
import '../../models/Recipe.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    Key key,
    @required this.categoryRecipes,
  }) : super(key: key);

  final List<Recipe> categoryRecipes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryRecipes.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(
            bottom: 10,
          ),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(
                      DefaultUtil.setImageUrlRecipe(
                          categoryRecipes[index].imageUrl),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    categoryRecipes[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextUtil.bannerText,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
