import 'package:flutter/material.dart';
import 'package:islami_app/core/app_color.dart';

class QueranTab extends StatelessWidget {
  const QueranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/quran.png"),
        fit: BoxFit.cover
        ),
      ),
    );
  }
}
