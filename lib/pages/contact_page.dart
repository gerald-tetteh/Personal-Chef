import 'package:flutter/material.dart';
import 'package:animations/animations.dart' as animations;

import '../utils/colors_util.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Card(
              child: Container(
                width: constraints.maxWidth * 0.7,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorUtil.green,
                      radius: constraints.maxWidth * 0.1,
                    ),
                    Text("Gerald Addo-Tetteh"),
                    TextButton(
                      child: Text("Click Me !"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
