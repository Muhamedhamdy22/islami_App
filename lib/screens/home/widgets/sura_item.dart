import 'package:flutter/material.dart';
import 'package:islami_app/core/app_color.dart';
import 'package:islami_app/core/styles.dart';

class SuraItem extends StatelessWidget {
  String nameAr;
  String nameEn;
  String versesCount;
  int index;

   SuraItem({super.key,
    required this.nameAr,
    required this.nameEn,
    required this.versesCount,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/images/leading.png"),
          Text("$index" , style: AppStyles.bodyStyle.copyWith(color: AppColor.white),),
        ],
      ),
      title: Text(nameEn , style: AppStyles.bodyStyle.copyWith(color: AppColor.white),),
      subtitle: Text(versesCount, style: AppStyles.large.copyWith(fontSize: 14),),
      trailing: Text(nameAr,style: AppStyles.bodyStyle.copyWith(color: AppColor.white),),
    );
  }
}
