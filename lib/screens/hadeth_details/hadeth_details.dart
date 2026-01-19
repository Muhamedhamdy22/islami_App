import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/models/hadeth_model.dart';

import '../../core/app_color.dart';
import '../../core/styles.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "Hadeth Datails";
  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model=ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
        backgroundColor: AppColor.black,
        appBar: AppBar(
          backgroundColor: AppColor.black,
          centerTitle: true,
          iconTheme: IconThemeData(
              color: AppColor.primary
          ),
          title: Text(model.tittle, style: AppStyles.bodyStyle,),
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset("assets/images/Group 33.png" , fit: BoxFit.fill,),
            Column(
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: ListView.builder(
                      itemCount: model.content.length,
                      itemBuilder: (context, index) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            model.content[index],
                            textAlign: TextAlign.center,
                            style: AppStyles.large.copyWith(color: AppColor.primary),),
                        );
                      },),
                  ),
                ),
                SizedBox(height: 120,),
              ],
            )
          ],
        )
    );
  }
}
