import 'package:flutter/material.dart';
import 'package:news_app/Category/category_Fragment.dart';
import 'package:news_app/Category/category_details.dart';
import 'package:news_app/Home_Screen.dart';
import 'package:news_app/Theme_Data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) =>  HomeScreen(),

      },
      theme: MyTheme.theme,
    );
  }
}
