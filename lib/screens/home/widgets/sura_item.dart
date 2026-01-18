import 'package:flutter/material.dart';
import 'package:islami_app/core/app_color.dart';
import 'package:islami_app/core/styles.dart';
import 'package:islami_app/models/sura_model.dart';

class SuraItem extends StatelessWidget {
  SuraModel model;

   SuraItem({super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/images/leading.png"),
          Text("${model.index}" , style: AppStyles.bodyStyle.copyWith(color: AppColor.white),),
        ],
      ),
      title: Text(model.nameEn , style: AppStyles.bodyStyle.copyWith(color: AppColor.white),),
      subtitle: Text("${model.versesCount} Verses", style: AppStyles.large.copyWith(fontSize: 14),),
      trailing: Text(model.nameAr,style: AppStyles.bodyStyle.copyWith(color: AppColor.white),),
    );
  }
}
