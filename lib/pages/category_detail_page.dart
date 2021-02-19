import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/colors_util.dart';
import '../utils/text_util.dart';
import '../components/category_detail_page/category_detail_list_view.dart';
import '../providers/RecipeProvider.dart';

class CategoryDetailPage extends StatelessWidget {
  static const routeName = "/category-detail";

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final apiUrl = arguments["apiUrl"];
    final categoryName = arguments["categoryName"];
    final provider = Provider.of<RecipeProvider>(context, listen: false);
    return FutureBuilder<void>(
        future: provider.categorySearch(apiUrl, categoryName),
        builder: (context, snapshot) {
          return Container(
            color: ColorUtil.white,
            child: SafeArea(
              top: false,
              child: Scaffold(
                backgroundColor: ColorUtil.white,
                appBar: AppBar(),
                body: LayoutBuilder(builder: (context, constraints) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  final categoryRecipes = provider.categoryRecipes;
                  return Container(
                    height:
                        constraints.maxHeight - (constraints.maxHeight * 0.05),
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: constraints.maxHeight * 0.05,
                    ),
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Snacks",
                            style: TextUtil.boldHeader,
                          ),
                        ),
                        Expanded(
                          child: CategoryListView(
                            categoryRecipes: categoryRecipes,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          );
        });
  }
}
