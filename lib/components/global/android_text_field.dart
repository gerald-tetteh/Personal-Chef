import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/colors_util.dart';
import '../../providers/RecipeProvider.dart';

class AndroidTextField extends StatefulWidget {
  const AndroidTextField({
    Key key,
  }) : super(key: key);

  @override
  _AndroidTextFieldState createState() => _AndroidTextFieldState();
}

class _AndroidTextFieldState extends State<AndroidTextField> {
  Future<void> searchText(String text, RecipeProvider provider) async =>
      await provider.complexSearch(text);

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeProvider>(context, listen: false);
    return TextField(
      controller: _controller,
      cursorColor: ColorUtil.green,
      onChanged: (enteredText) {
        if (enteredText.isEmpty) {
          provider.setRecipes = [];
        }
      },
      onEditingComplete: () async {
        FocusScope.of(context).unfocus();
        await searchText(_controller.text, provider);
      },
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
