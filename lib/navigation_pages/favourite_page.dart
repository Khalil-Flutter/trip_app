import 'package:flutter/material.dart';

import '../widget/reusable_middle_app_text.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            size: 200.0,
            color: Colors.green,
          ),
          AppText(
            text: "Favorite",
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );;
  }
}
