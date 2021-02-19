import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../utils/colors_util.dart';
import '../../providers/RecipeProvider.dart';

class IosTextField extends StatefulWidget {
  const IosTextField({
    Key key,
  }) : super(key: key);

  @override
  _IosTextFieldState createState() => _IosTextFieldState();
}

class _IosTextFieldState extends State<IosTextField> {
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
    return CupertinoTextField(
      controller: _controller,
      onChanged: (enteredText) {
        if (enteredText.isEmpty) {
          provider.setRecipes = [];
        }
      },
      onEditingComplete: () async {
        FocusScope.of(context).unfocus();
        await searchText(_controller.text, provider);
      },
      cursorColor: ColorUtil.green,
      placeholder: "Search",
      prefix: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 12.0,
        ),
        child: Icon(
          CupertinoIcons.search,
          color: ColorUtil.green,
          size: 15,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        border: Border.all(
          color: ColorUtil.greyLighten1,
        ),
      ),
    );
  }
}
