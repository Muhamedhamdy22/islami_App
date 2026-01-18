
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/app_color.dart';
import 'package:islami_app/core/styles.dart';
import 'package:islami_app/models/hadeth_model.dart';

import '../../hadeth_details/hadeth_details.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hadeth.png"),
          fit: BoxFit.cover,
          opacity: 0.2,
        ),
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          height: double.infinity,
          autoPlay: true,
          enlargeCenterPage: true,

        ),
        items: allAhadeth.map((model) {
          return Builder(
            builder: (context) {
              return Padding(
                padding:  EdgeInsets.only(top: 150),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/images/bg.png"),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                           SizedBox(height: 40),
                          Text(
                            model.tittle,
                            style: TextStyle(
                              color: AppColor.black,fontSize: 24,fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: model.content.length,
                              itemBuilder: (context, index) {
                               return InkWell(
                                 onTap: () {
                                   Navigator.pushNamed(context, HadethDetails.routeName,
                                     arguments: model,
                                   );
                                 },
                                 child: Text(
                                   model.content[index],
                                   maxLines: 6,
                                   style: TextStyle(
                                  fontSize: 18, color: AppColor.black
                                                               ),
                                  textAlign: TextAlign.center,
                                                               ),
                               );
                            },),
                          )


                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Future<void> loadHadethFile() async {
    String hadethFile =
    await rootBundle.loadString("assets/files/ahadeth.txt");

    List<String> ahadeth = hadethFile.split("#");

    for (int i = 0; i < ahadeth.length; i++) {
      String hadethOne = ahadeth[i].trim();
      if (hadethOne.isEmpty) continue;

      List<String> lines = hadethOne.split("\n");

      String title = lines.first;
      lines.removeAt(0);

      HadethModel model =
      HadethModel(tittle: title, content: lines);

      allAhadeth.add(model);
    }

    setState(() {});
  }
}
