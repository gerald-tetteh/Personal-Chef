import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_chef/utils/colors_util.dart';
import 'package:provider/provider.dart';

import './pages/home.dart';
import './pages/category_detail_page.dart';
import './providers/RecipeProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
      create: (context) => RecipeProvider(),
      child: MaterialApp(
        title: "Personal Chef",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.amber,
          fontFamily: "OpenSans",
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.amber,
            ),
          ),
        ),
        initialRoute: "/",
        routes: {
          "/": (ctx) => HomePage(),
          CategoryDetailPage.routeName: (ctx) => CategoryDetailPage(),
        },
      ),
    );
  }
}
