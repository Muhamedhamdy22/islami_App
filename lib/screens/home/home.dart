import 'package:flutter/material.dart';
import 'package:islami_app/core/app_color.dart';
import 'package:islami_app/screens/home/tabs/hadeth_tab.dart';
import 'package:islami_app/screens/home/tabs/queran_tab.dart';
import 'package:islami_app/screens/home/tabs/radio_tab.dart';
import 'package:islami_app/screens/home/tabs/sebha_tab.dart';
import 'package:islami_app/screens/home/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        backgroundColor: AppColor.primary,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.white,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColor.primary,
            icon: getImageIcon("image1-Q", 0),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.primary,
            icon: getImageIcon("image2-ha", 1),
            label: "Ahadith",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.primary,
            icon: getImageIcon("image3-sea", 2),
            label: "Sebha",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.primary,
            icon: getImageIcon("image4-r", 3),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.primary,
            icon: getImageIcon("image5-t", 4),
            label: "Time",
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          tabs[selectedIndex],
          Image.asset("assets/images/Logo.png"),
        ],
      ),
    );
  }

  List<Widget> tabs = [
    QueranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  Widget getImageIcon(String imageName, int index) {
    return selectedIndex == index
        ? Container(
            margin: EdgeInsets.only(top: 4),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            decoration: BoxDecoration(
              color: Color.fromRGBO(32, 32, 32, .6),
              borderRadius: BorderRadius.circular(66),
            ),
            child: ImageIcon(AssetImage("assets/images/$imageName.png")),
          )
        : ImageIcon(AssetImage("assets/images/$imageName.png"));
  }
}
