import 'package:flutter/material.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/hadeth.png"),
            fit: BoxFit.cover,  opacity: 0.2,
        ),
      ),
    );
  }
}
