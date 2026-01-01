import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/core/app_color.dart';
import 'package:islami_app/core/styles.dart';
import 'package:islami_app/screens/home/home.dart';

class AppIntroductionScreen extends StatelessWidget {
  static const String routeName = "introScreen";

  AppIntroductionScreen({super.key});

  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: "",
      body: "",
     image: Image.asset("assets/images/intro1.png"),
    ),
    PageViewModel(
      titleWidget: Text("Welcome To Islami" , style: AppStyles.titleStyle),
      bodyWidget: Text("We Are Very Excited To Have You In Our Community",
        textAlign: TextAlign.center,
        style: AppStyles.bodyStyle,),
      image: Image.asset("assets/images/intro2.png"),
    ),
    PageViewModel(
      titleWidget: Text("Reading the Quran" , style: AppStyles.titleStyle),
      bodyWidget: Text("Read, and your Lord is the Most Generous",
        textAlign: TextAlign.center,
        style: AppStyles.bodyStyle,),
      image: Image.asset("assets/images/intro3.png"),
    ),
    PageViewModel(
      titleWidget: Text("Bearish" , style: AppStyles.titleStyle),
      bodyWidget: Text("Praise the name of your Lord, the Most High",
        textAlign: TextAlign.center,
        style: AppStyles.bodyStyle,),
      image: Image.asset("assets/images/intro4.png"),
    ),
    PageViewModel(
      titleWidget: Text("Holy Quran Radio" , style: AppStyles.titleStyle),
      bodyWidget: Text("You can listen to the Holy Quran Radio through the application for free and easily",
        textAlign: TextAlign.center,
        style: AppStyles.bodyStyle,),
      image: Image.asset("assets/images/intro5.png"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,
      globalBackgroundColor: AppColor.black,
      showNextButton: true,
      showBackButton: true,
      showSkipButton: true,
      onSkip: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      dotsFlex: 2,
      bodyPadding: EdgeInsets.only(top: 266),
      dotsDecorator: DotsDecorator(
        color: AppColor.gray,
        activeColor: AppColor.primary,
        activeSize: Size(18,7),
        activeShape:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: Colors.transparent
            )
        ),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.transparent
          )
        )
      ),
      globalHeader: Image.asset("assets/images/Logo.png"),
      next: Text("Next", style: AppStyles.bodyStyle,),
      back: Text("Back" , style: AppStyles.bodyStyle,),
      skip:  Text("Skip" , style: AppStyles.bodyStyle,),
      done:  Text("Done" , style: AppStyles.bodyStyle,),
      onDone: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
    );
  }
}