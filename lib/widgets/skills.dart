import 'package:flutter/material.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/helpers/skills_card.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      width: double.maxFinite,
      decoration: CustomColors.cardDecoration2,
      child: const Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.spaceAround,
        children: [
          SkillsCard(
            skillName: "Flutter",
            iconPath: "assets/icons/flutter.jpg",
          ),
          SkillsCard(
            skillName: "Android Studio",
            iconPath: "assets/icons/astudio.png",
          ),
          SkillsCard(
            skillName: "Android Development",
            iconPath: "assets/icons/androidDev.png",
          ),
          SkillsCard(
            skillName: "Firebase",
            iconPath: "assets/icons/firebase.png",
          ),
          SkillsCard(
            skillName: "C++",
            iconPath: "assets/icons/c++.png",
          ),
          SkillsCard(
            skillName: "C",
            iconPath: "assets/icons/c-.png",
          ),
          SkillsCard(
            skillName: "MySQL",
            iconPath: "assets/icons/mysql.png",
          ),
          SkillsCard(
            skillName: "Python",
            iconPath: "assets/icons/python.png",
          ),
          SkillsCard(
            skillName: "Git",
            iconPath: "assets/icons/git.png",
          ),
          SkillsCard(
            skillName: "Github",
            iconPath: "assets/icons/github.jpg",
          ),
          SkillsCard(
            skillName: "Machine Learning",
            iconPath: "assets/icons/machinelearning.png",
          ),
        ],
      ),
    );
  }
}
