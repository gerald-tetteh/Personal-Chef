import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../../utils/text_util.dart';
import '../../utils/default_util.dart';
import '../../utils/colors_util.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key key,
    @required this.constraints,
    @required this.content,
    @required this.columnFadeAnimation,
    @required this.rowFadeAnimation,
    @required this.moveAnimation,
    @required this.expandRow,
    @required this.expandColumn,
  }) : super(key: key);

  final BoxConstraints constraints;
  final List<Widget> Function(double radius) content;
  final Animation<double> rowFadeAnimation;
  final Animation<double> columnFadeAnimation;
  final Function moveAnimation;
  final bool expandColumn;
  final bool expandRow;

  @override
  Widget build(BuildContext context) {
    var isAndroid = Platform.isAndroid;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: constraints.maxWidth * 0.7,
        padding: const EdgeInsets.all(16),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FadeTransition(
                opacity: rowFadeAnimation,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  height: expandRow ? constraints.maxHeight * 0.06 : 0,
                  child: Row(
                    children: content(constraints.maxWidth * 0.05),
                  ),
                ),
              ),
              FadeTransition(
                opacity: columnFadeAnimation,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  height: expandColumn ? constraints.maxHeight * 0.15 : 0,
                  child: FittedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: content(constraints.maxWidth * 0.1),
                    ),
                  ),
                ),
              ),
              FadeTransition(
                opacity: rowFadeAnimation,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  height: expandRow ? constraints.maxHeight * 0.28 : 0,
                  child: FittedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: ContactDetailTile(
                            icon: FontAwesomeIcons.github,
                            text: "GitHub (Source Code)",
                            onClick: () async {
                              await _launchPage(
                                context,
                                isAndroid,
                                DefaultUtil.githubUrl,
                              );
                            },
                          ),
                        ),
                        FittedBox(
                          child: ContactDetailTile(
                            icon: FontAwesomeIcons.linkedin,
                            text: "LinkedIn",
                            onClick: () async {
                              await _launchPage(
                                context,
                                isAndroid,
                                DefaultUtil.linkedInProfile,
                              );
                            },
                          ),
                        ),
                        FittedBox(
                          child: ContactDetailTile(
                            icon: FontAwesomeIcons.mailBulk,
                            text: "Email",
                            onClick: () async {
                              await _launchPage(
                                context,
                                isAndroid,
                                "mailto:${DefaultUtil.email}?subject=Chef",
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text("Contact Developer"),
                onPressed: () => moveAnimation(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchPage(
      BuildContext context, bool isAndroid, String url) async {
    if (await launcher.canLaunch(url)) {
      try {
        await launcher.launch(url);
      } catch (e) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
            DefaultUtil.showSnackBar("An error occured", isAndroid));
      }
    } else {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
          DefaultUtil.showSnackBar("An error occured", isAndroid));
    }
  }
}

class ContactDetailTile extends StatelessWidget {
  const ContactDetailTile({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.onClick,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton.icon(
        onPressed: onClick,
        label: Text(
          text,
          style: TextUtil.lightHeader.copyWith(
            color: ColorUtil.greyDarken4,
          ),
        ),
        icon: Icon(icon),
      ),
    );
  }
}
