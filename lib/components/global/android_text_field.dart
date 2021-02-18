import 'package:flutter/material.dart';

import '../../utils/colors_util.dart';

class AndroidTextField extends StatelessWidget {
  const AndroidTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorUtil.green,
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
