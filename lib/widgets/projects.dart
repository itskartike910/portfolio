import 'package:flutter/material.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/helpers/project_card.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      width: double.maxFinite,
      decoration: CustomColors.cardDecoration1,
      child: const Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.spaceAround,
        children: [
          ProjectCard(
            projectTitle: "ChatApp",
            projectDescription:
                "ChatBox is a real-time chat application built with Flutter and Firebase. It allows users to sign up, log in, chat with other users.",
            projectUrl: "",
            imagePath: "assets/profile.jpg",
          ),
        ],
      ),
    );
  }
}
