import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/app_color.dart';
import 'package:islami_app/core/styles.dart';
import 'package:islami_app/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName="suraDetails";

   SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses=[];

  @override
  Widget build(BuildContext context) {
    var model= ModalRoute.of(context)!.settings.arguments as SuraModel;
    if(verses.isEmpty){
      loadSuresFile(model.index);
    }

    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColor.primary
        ),
        title: Text(model.nameEn, style: AppStyles.bodyStyle,),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset("assets/images/Group 33.png" , fit: BoxFit.fill,),
          Column(
            children: [
              SizedBox(height: 30,),
              Text(model.nameAr, style: AppStyles.bodyStyle,),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                  itemCount: verses.length,
                  itemBuilder: (context, index) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "${verses[index]} (${index + 1})",
                      textAlign: TextAlign.center,
                      style: AppStyles.large.copyWith(color: AppColor.primary),),
                  );
                },),
              ),
              SizedBox(height: 120,),
            ],
          )
        ],
      )
    );
  }

  void loadSuresFile (int index) async {
    String suraFile = await rootBundle.loadString("assets/files/${index+1}.txt");
    List<String> lines= suraFile.split("\n");
    verses = lines;
    print(verses);
    setState(() {

    });
  }
}
