// ignore_for_file: deprecated_member_use

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
        vertical: isMobile ? 20 : 25,
        horizontal: isMobile ? 15 : 25,
      ),
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColors.cardBGLight.withOpacity(0.6),
            CustomColors.cardBG.withOpacity(0.4),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: CustomColors.primaryAccent.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      CustomColors.primaryAccent.withOpacity(0.3),
                      CustomColors.purpleAccent.withOpacity(0.3),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: CustomColors.primaryAccent.withOpacity(0.5),
                  ),
                ),
                child: const Icon(
                  Icons.person_outline,
                  color: CustomColors.primaryAccent,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "About Me",
                style: GoogleFonts.playfairDisplay(
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.w800,
                  fontSize: isMobile ? 22 : 26,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Content
          _buildInfoRow(
            icon: Icons.school_outlined,
            title: "Education",
            content: "B.Tech in Computer Science and Engineering from National Institute of Technology, Patna(2021 – 2025)",
            color: CustomColors.primaryAccent,
            isMobile: isMobile,
          ),
          
          const SizedBox(height: 16),

          _buildInfoRow(
            icon: Icons.code_outlined,
            title: "Expertise",
            content: "1+ years of industry experience in Android Development and Chromium Development. \nHands-on experience in Android app development using Flutter, Firebase, and React-based extensions. \nStrong foundation in AI/ML, system-level programming, and browser technology.",
            color: CustomColors.greenAccent,
            isMobile: isMobile,
          ),
          
          const SizedBox(height: 16),
          
          _buildInfoRow(
            icon: Icons.psychology_outlined,
            title: "Competitive Programming",
            content: "Solid grasp of Data Structures and Algorithms (C++) with 1000+ problems solved on LeetCode, GFG, CodeChef and other platforms.",
            color: CustomColors.yellowPrimary,
            isMobile: isMobile,
          ),
          
          const SizedBox(height: 16),
          
          _buildInfoRow(
            icon: Icons.lightbulb_outline,
            title: "Skills & Tools",
            content: "Languages: C++, C, Java, SQL, Dart, HTML, CSS \nDeveloper Tools: Android Studio, VS Code, Git, GitHub, Firebase, MySQL \nCore Subjects: DSA, Operating Systems, DBMS, AI, ML",
            color: CustomColors.secondaryAccent,
            isMobile: isMobile,
          ),

          const SizedBox(height: 16),
          
          _buildInfoRow(
            icon: Icons.interests_outlined,
            title: "Interests",
            content: "Software development, AI, app creation, playing chess and badminton, and listening to music.",
            color: CustomColors.purpleAccent,
            isMobile: isMobile,
          ),
          
          const SizedBox(height: 20),
          
          // Footer note
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CustomColors.primaryAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: CustomColors.primaryAccent.withOpacity(0.3),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.verified_outlined,
                  color: CustomColors.primaryAccent,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Passionate developer committed to building intelligent, scalable, and meaningful digital solutions.",
                    style: GoogleFonts.ubuntu(
                      color: CustomColors.textGrey,
                      fontWeight: FontWeight.w600,
                      fontSize: isMobile ? 13 : 15,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String content,
    required Color color,
    required bool isMobile,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: color.withOpacity(0.4),
            ),
          ),
          child: Icon(
            icon,
            color: color,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.ubuntu(
                  color: color,
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 15 : 17,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                content,
                style: GoogleFonts.ubuntu(
                  color: CustomColors.textGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: isMobile ? 14 : 16,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
