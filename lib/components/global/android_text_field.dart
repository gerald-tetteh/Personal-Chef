import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/colors_util.dart';
import '../../providers/RecipeProvider.dart';

class AndroidTextField extends StatelessWidget {
  const AndroidTextField({
    Key key,
  }) : super(key: key);

  Future<void> searchText(String text, RecipeProvider provider) async =>
      await provider.complexSearch(text);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeProvider>(context, listen: false);
    return TextField(
      cursorColor: ColorUtil.green,
      onChanged: (enteredText) async => await searchText(enteredText, provider),
      decoration: InputDecoration(
        hintText: "Search",
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 0,
        ),
        isDense: true,
        prefixIcon: Icon(
          Icons.search,
          color: ColorUtil.green,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200),
          borderSide: BorderSide(
            color: ColorUtil.greyLighten1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200),
          borderSide: BorderSide(
            color: ColorUtil.greyLighten1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200),
          borderSide: BorderSide(
            color: ColorUtil.greyLighten1,
          ),
        ),
      ),
    );
  }
}
