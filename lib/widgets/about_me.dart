import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';

class AboutMe extends StatelessWidget {
  final bool isMobile;
  const AboutMe({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: isMobile? 10 : 20,
      ),
      margin: const EdgeInsets.all(10),
      width: double.maxFinite,
      decoration: CustomColors.cardDecoration3,
      child: Column(
        children: [
          Text(
            "About Me",
            style: GoogleFonts.playfair(
              color: CustomColors.whitePrimary,
              fontWeight: FontWeight.w700,
              fontSize: isMobile ? 18 : 22,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "I am a final-year B.Tech. CSE student at NIT Patna with over two years of experience in mobile app development using Flutter and Firebase. I am a passionate, self-taught developer with a keen interest in new technologies and continuous learning.\nAs a competitive programmer, I have a solid grasp of Data Structures and Algorithms in C++. My experience includes project management, version control with Git, UI/UX design, and API integration. I excel in collaborative environments and am committed to contributing to innovative projects.",
            style: GoogleFonts.ubuntu(
              color: CustomColors.whitePrimary,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
