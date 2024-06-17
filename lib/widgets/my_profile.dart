import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/helpers/social_profile.dart';

class MyProfile extends StatelessWidget {
  final bool isMobile;
  const MyProfile({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      height: isMobile ? 600 : 450,
      width: double.maxFinite,
      decoration: CustomColors.cardDecoration1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Hello, I'm\nKartik Kumar",
                  style: GoogleFonts.dancingScript(
                    color: CustomColors.whitePrimary,
                    fontWeight: FontWeight.w900,
                    fontSize: isMobile ? 26 : 32,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 175, 175, 175),
                        blurRadius: 20,
                        spreadRadius: 2,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: isMobile ? 80 : 120,
                    backgroundImage: const AssetImage("assets/profile.jpg"),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "B.Tech CSE (Final year) @ NIT Patna | Android App Developer | Building personal projects to hone my App Development, DSA & C++ skills.",
            style: GoogleFonts.playfairDisplay(
              color: CustomColors.whitePrimary,
              fontWeight: FontWeight.w600,
              fontSize: isMobile ? 15 : 18,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            // width: double.maxFinite - 20,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: CustomColors.cardDecoration2,
            child: const Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.spaceAround,
              children: [
                SocialProfile(
                  profilName: "My Resume",
                  iconPath: "assets/icons/code.png",
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  url:
                      "https://drive.google.com/file/d/1noAQJumuiq1fuSMwoQjZqQx2JNGKiEsd/view?usp=drive_link",
                ),
                SocialProfile(
                  profilName: "LinkedIn",
                  iconPath: "assets/icons/linkedin.png",
                  bgColor: Color.fromARGB(255, 0, 20, 125),
                  txtColor: Colors.white,
                  url: "https://www.linkedin.com/in/kartik-kumar-4277b4235/",
                ),
                SocialProfile(
                  profilName: "Github",
                  iconPath: "assets/icons/github.jpg",
                  bgColor: Colors.black,
                  txtColor: Colors.white,
                  url: "https://github.com/itskartike910",
                ),
                SocialProfile(
                  profilName: "LeetCode",
                  iconPath: "assets/icons/leetcode.png",
                  bgColor: Colors.black,
                  txtColor: Colors.white,
                  url: "https://leetcode.com/u/its_kartike/",
                ),
                SocialProfile(
                  profilName: "GeeksForGeeks",
                  iconPath: "assets/icons/gfg.jpg",
                  bgColor: Colors.green,
                  txtColor: Colors.white,
                  url: "https://www.geeksforgeeks.org/user/kumarkartik147359/",
                ),
                SocialProfile(
                  profilName: "CodeChef",
                  iconPath: "assets/icons/codechef.jpg",
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  url: "https://www.codechef.com/users/its_kartike",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
