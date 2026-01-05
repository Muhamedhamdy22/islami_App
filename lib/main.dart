import 'package:flutter/material.dart';
import 'package:islami_app/screens/home/home.dart';
import 'package:islami_app/screens/sura_details/sura_details.dart';

import 'introduction_screen.dart';
// import 'package:islami_app/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:  AppIntroductionScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        AppIntroductionScreen.routeName : (context) => AppIntroductionScreen(),
        SuraDetailsScreen.routeName : (context) => SuraDetailsScreen(),
      },
    );
  }
}

