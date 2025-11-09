import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartik Kumar - Portfolio',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: CustomColors.scaffoldBG,
        primaryColor: CustomColors.primaryAccent,
        colorScheme: ColorScheme.dark(
          primary: CustomColors.primaryAccent,
          secondary: CustomColors.secondaryAccent,
          surface: CustomColors.cardBG,
          background: CustomColors.scaffoldBG,
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
