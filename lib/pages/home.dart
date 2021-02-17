import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors_util.dart';
import '../pages/favourites_page.dart';
import '../pages/search_page.dart';
import '../pages/contact_page.dart';

class HomePage extends StatefulWidget {
  static final isAndroid = Platform.isAndroid;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pages = [SearchPage(), FavouritesPage(), ContactPage()];

  final _bottomNaviagtionItems = [
    BottomNavigationBarItem(
      label: "",
      activeIcon: Icon(
        HomePage.isAndroid ? Icons.search_rounded : CupertinoIcons.search,
      ),
      icon: Icon(
        HomePage.isAndroid ? Icons.search_rounded : CupertinoIcons.search,
      ),
    ),
    BottomNavigationBarItem(
      label: "",
      activeIcon: Icon(Icons.favorite_border_rounded),
      icon: Icon(Icons.favorite_border_rounded),
    ),
    BottomNavigationBarItem(
      label: "",
      activeIcon: Icon(Icons.support_agent_outlined),
      icon: Icon(Icons.support_agent_outlined),
    ),
  ];

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtil.white,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: HomePage.isAndroid
              ? BottomNavigationBar(
                  currentIndex: _currentIndex,
                  items: _bottomNaviagtionItems,
                  backgroundColor: ColorUtil.white,
                  onTap: (index) => setState(() => _currentIndex = index),
                )
              : CupertinoTabBar(
                  currentIndex: _currentIndex,
                  items: _bottomNaviagtionItems,
                  backgroundColor: ColorUtil.white,
                  onTap: (index) => setState(() => _currentIndex = index),
                ),
          backgroundColor: ColorUtil.white,
          body: _pages[_currentIndex],
        ),
      ),
    );
  }
}
