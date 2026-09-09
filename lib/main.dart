// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/constants/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartik Kumar | Portfolio',
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.trackpad,
        },
      ),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: CustomColors.scaffoldBG,
        primaryColor: CustomColors.primaryAccent,
        colorScheme: const ColorScheme.dark(
          primary: CustomColors.primaryAccent,
          secondary: CustomColors.secondaryAccent,
          surface: CustomColors.cardBG,
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: MaterialStateProperty.all(true),
          trackVisibility: MaterialStateProperty.all(true),
          interactive: true,
          thickness: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered) || states.contains(MaterialState.dragged)) {
              return 8.0;
            }
            return 5.5;
          }),
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.dragged)) {
              return const Color(0xFF00FFCC);
            }
            if (states.contains(MaterialState.hovered)) {
              return const Color(0xFF00E5FF);
            }
            return const Color(0xCC00D9FF);
          }),
          trackColor: MaterialStateProperty.all(const Color(0x14FFFFFF)),
          trackBorderColor: MaterialStateProperty.all(Colors.transparent),
          radius: const Radius.circular(10),
        ),
        textTheme: ThemeData.dark().textTheme.apply(
              bodyColor: CustomColors.textGrey,
              displayColor: CustomColors.whitePrimary,
            ),
      ),
      home: const HomePage(),
    );
  }
}
