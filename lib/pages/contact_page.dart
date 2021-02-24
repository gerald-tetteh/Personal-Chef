import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors_util.dart';
import '../utils/text_util.dart';
import '../components/contact_page/contact_card.dart';

class ContactPage extends StatefulWidget {
  const ContactPage();
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with SingleTickerProviderStateMixin {
  List<Widget> children(double radius) {
    return [
      Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.only(right: 8),
        child: CircleAvatar(
          backgroundColor: ColorUtil.green,
          radius: radius,
          backgroundImage: AssetImage("assets/images/profile_picture.jpg"),
        ),
      ),
      Text(
        "Gerald Addo-Tetteh",
        style: TextUtil.titleText,
      ),
    ];
  }

  AnimationController _controller;
  Animation<double> _rowFadeAnimation;
  Animation<double> _columnFadeAnimation;
  bool _expandRow = false;
  bool _expandColumn = true;

  bool forward = true;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _rowFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    _columnFadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    super.initState();
  }

  void moveAnimation() {
    if (forward) {
      _controller.forward();
      forward = !forward;
      setState(() {
        _expandColumn = !_expandColumn;
        _expandRow = !_expandRow;
      });
    } else {
      _controller.reverse();
      forward = !forward;
      setState(() {
        _expandColumn = !_expandColumn;
        _expandRow = !_expandRow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ContactCard(
              constraints: constraints,
              content: children,
              columnFadeAnimation: _columnFadeAnimation,
              rowFadeAnimation: _rowFadeAnimation,
              moveAnimation: moveAnimation,
              expandRow: _expandRow,
              expandColumn: _expandColumn,
            );
          },
        ),
      ),
    );
  }
}
