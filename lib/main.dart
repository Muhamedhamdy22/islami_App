import 'package:flutter/material.dart';
import 'package:islami_app/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_app/screens/home/home.dart';
import 'package:islami_app/screens/sura_details/sura_details.dart';

import 'core/cache_helper.dart';
import 'introduction_screen.dart';
// import 'package:islami_app/introduction_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool? value = CacheHelper.getBool("introScreenFlag");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: value == true
          ? HomeScreen.routeName
          : AppIntroductionScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        AppIntroductionScreen.routeName: (context) => AppIntroductionScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
    );
  }
}

