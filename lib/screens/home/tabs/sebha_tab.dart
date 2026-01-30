import 'package:flutter/material.dart';
import 'package:islami_app/core/styles.dart';
import 'dart:math';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> tasbeh = [
    "الحمد لله",
    "الله اكبر",
    "سبحان الله"
  ];
  int count =0;
  int index =0;
  double angle =0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sebha.png"),
          fit: BoxFit.cover,
          opacity: 0.2,
        ),
      ),
      child: SafeArea(child: Column(
        children: [
          SizedBox(height: 130),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى " , style: AppStyles.mTittle,)
            ],
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              count++;
                              angle -= pi / 24;

                              if(count > 33) {
                                count = 0;
                                index++;
                                if(index >= tasbeh.length) {
                                  index = 0;
                                }
                              }
                            });
                          },
                          child: Transform.rotate(
                              angle: angle,
                              child: Image.asset("assets/images/SebhaBody 1.png" , height: 445,))),
                    ),
                    Image.asset("assets/images/sebha tittle.png", height: 70,),
                    Positioned(
                        bottom: 150,
                        child: Text("$count" , style: AppStyles.mTittle,)),
                    Positioned(
                        bottom: 220,
                        child: Text("${tasbeh[index]}" , style: AppStyles.mTittle,)),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
