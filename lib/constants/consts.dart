import 'package:flutter/material.dart';

class CustomColors {
  static const Color scaffoldBG = Colors.black87;
  static const Color appBarBG = Colors.black;
  static const Color appBarText = Colors.white;
  static const Color cardBG = Colors.black45;
  static const Color cardText = Colors.white;
  static const Color bgLight1 = Colors.black26;
  static const Color bgLight2 = Colors.black12;
  static const Color dark = Colors.black;
  static const Color txtFieldbg = Colors.white38;
  static const Color hintDark = Color(0xff666874);
  static const Color hintLight = Color(0xffb0b0b0);
  static const Color yellowPrimary = Colors.yellow;
  static const Color yellowSecondary = Colors.yellowAccent;
  static const Color redPrimary = Colors.red;
  static const Color redSecondary = Colors.redAccent;
  static const Color whitePrimary = Colors.white;
  static const Color whiteSecondary = Colors.white10;
  static const Color borderColor = Color.fromARGB(255, 100, 0, 0);

  static BoxDecoration cardDecoration = BoxDecoration(
    gradient: const RadialGradient(
      colors: [
        Color.fromARGB(255, 55, 55, 55),
        Color.fromARGB(255, 45, 45, 45),
      ],
    ),
    border: Border.all(
      color: CustomColors.borderColor,
      width: 3,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(20)),
  );
}
