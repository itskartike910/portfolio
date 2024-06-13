import 'package:flutter/material.dart';
import 'package:portfolio/constants/consts.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      width: double.maxFinite,
      decoration: CustomColors.cardDecoration1,
      child: const Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.spaceAround,
        children: [],
      ),
    );
  }
}
