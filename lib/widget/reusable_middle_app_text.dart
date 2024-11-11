import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiddleAppText extends StatelessWidget {
  const MiddleAppText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: text,
            size: 19,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          const AppText(
            text: "See All",
            size: 14,
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      required this.text,
      required this.size,
      required this.color,
      required this.fontWeight});

  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.ubuntu(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
