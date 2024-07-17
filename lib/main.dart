import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Home_Screen.dart';
import 'package:news_app/Theme_Data.dart';

import 'my_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  // Use cubits...
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
