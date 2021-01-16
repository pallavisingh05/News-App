import 'package:flutter/material.dart';
import 'package:news_app/category.dart';
import 'package:news_app/news_item.dart';

import 'category_route.dart';

void main() {
  runApp(TheCentralMain());
}

class TheCentralMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
       home: Category_Route()
    );
  }
}


