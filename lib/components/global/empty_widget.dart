import 'package:flutter/material.dart';

import '../../utils/text_util.dart';

class EmptyWidgetComponent extends StatelessWidget {
  const EmptyWidgetComponent({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          text,
          style: TextUtil.boldHeader,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
