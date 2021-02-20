import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:personal_chef/utils/default_util.dart';
import 'package:personal_chef/utils/text_util.dart';
import 'package:provider/provider.dart';

import '../utils/colors_util.dart';
import '../providers/RecipeProvider.dart';
import '../models/RecipeInformation.dart';
import '../models/Ingredient.dart';

class RecipeDetailPage extends StatelessWidget {
  static const routeName = "/recipe-detail";
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeProvider>(context, listen: false);
    final recipeId = ModalRoute.of(context).settings.arguments as int;
    return FutureBuilder<RecipeInformation>(
      future: provider.getRecipeInformation(recipeId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: ColorUtil.white,
            child: SafeArea(
              top: false,
              child: Scaffold(
                backgroundColor: ColorUtil.white,
                appBar: AppBar(),
                body: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
          );
        }
        final recipeInformation = snapshot.data;
        final themeData = Theme.of(context);
        return Container(
          color: ColorUtil.white,
          child: SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: ColorUtil.roseWhite,
              appBar: AppBar(
                backgroundColor: ColorUtil.white,
                title: Text(
                  recipeInformation.title,
                  style: themeData.appBarTheme.titleTextStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorUtil.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        height: constraints.maxHeight * 0.5,
                        width: double.infinity,
                        child: LayoutBuilder(builder: (context, constraints) {
                          return Column(
                            children: [
                              Container(
                                height: constraints.maxHeight * 0.8,
                                child: Center(
                                  child: CircleAvatar(
                                    radius: constraints.maxWidth * 0.25,
                                    backgroundColor: ColorUtil.green,
                                    backgroundImage: NetworkImage(
                                      DefaultUtil.setImageUrlRecipe(
                                          recipeInformation.image),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: constraints.maxHeight * 0.2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MealColumnDetails(
                                      text:
                                          "${recipeInformation.readyInMinutes} min",
                                      androidIcon: Icons.timer_outlined,
                                      iosIcon: CupertinoIcons.stopwatch,
                                    ),
                                    MealColumnDetails(
                                      text:
                                          "${recipeInformation.healthScore.toInt()} health score",
                                      androidIcon: Icons.healing_outlined,
                                      iosIcon: CupertinoIcons.bandage,
                                    ),
                                    MealColumnDetails(
                                      text:
                                          "${recipeInformation.servings.toInt()} servings",
                                      androidIcon: Icons.food_bank_outlined,
                                      iosIcon: Icons.food_bank_outlined,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                      Container(
                        height: constraints.maxHeight * 0.46,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.04,
                        color: ColorUtil.white,
                        child: Center(
                          child: Text(
                            "Data from ${recipeInformation.sourceName}",
                            style: TextUtil.lightHeader.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

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
