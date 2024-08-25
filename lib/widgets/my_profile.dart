import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/helpers/social_profile.dart';
import 'package:portfolio/widgets/about_me.dart';

class MyProfile extends StatefulWidget {
  final bool isMobile;
  const MyProfile({super.key, required this.isMobile});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      height: widget.isMobile ? 850 : 550,
      width: double.maxFinite,
      decoration: CustomColors.cardDecoration1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedTextKit(
                        key: ValueKey(widget.isMobile),
                        animatedTexts: [
                          TypewriterAnimatedText(
                            "Hello, I'm\nKartik Kumar",
                            textStyle: GoogleFonts.bungeeSpice(
                              color: CustomColors.whitePrimary,
                              fontWeight: FontWeight.w600,
                              fontSize: widget.isMobile ? 20 : 32,
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        totalRepeatCount: 3,
                        pause: const Duration(milliseconds: 1000),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            "",
                            textStyle: GoogleFonts.bungeeInline(
                              color: const Color.fromARGB(255, 255, 140, 80),
                              fontWeight: FontWeight.w400,
                              fontSize: widget.isMobile ? 22 : 34,
                            ),
                            cursor: "|",
                            speed: const Duration(milliseconds: 200),
                          ),
                        ],
                        pause: const Duration(milliseconds: 100),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                        repeatForever: true,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: MouseRegion(
                    onEnter: (event) => setState(() => isHovering = true),
                    onExit: (event) => setState(() => isHovering = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: isHovering
                                ? const Color.fromARGB(255, 100, 235, 255)
                                : const Color.fromARGB(255, 175, 175, 175),
                            blurRadius: 20,
                            spreadRadius: 2,
                            offset: const Offset(0, 8),
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage("assets/profile.jpg"),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      width: widget.isMobile
                          ? (isHovering ? 170 : 160)
                          : (isHovering ? 275 : 240),
                      height: widget.isMobile
                          ? (isHovering ? 170 : 160)
                          : (isHovering ? 275 : 240),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: CustomColors.cardDecoration3,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.spaceAround,
              children: [
                SocialProfile(
                  profilName: "My Resume",
                  iconPath: "assets/icons/code.png",
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  isMobile: widget.isMobile,  
                  url:
                      "https://drive.google.com/file/d/1noAQJumuiq1fuSMwoQjZqQx2JNGKiEsd/view?usp=sharing",
                ),
                SocialProfile(
                  profilName: "LinkedIn",
                  iconPath: "assets/icons/linkedin.png",
                  bgColor: Color.fromARGB(255, 0, 20, 125),
                  txtColor: Colors.white,
                  isMobile: widget.isMobile, 
                  url: "https://www.linkedin.com/in/kartik-kumar-4277b4235/",
                ),
                SocialProfile(
                  profilName: "Github",
                  iconPath: "assets/icons/github.jpg",
                  bgColor: Colors.black,
                  txtColor: Colors.white,
                  isMobile: widget.isMobile, 
                  url: "https://github.com/itskartike910",
                ),
                SocialProfile(
                  profilName: "LeetCode",
                  iconPath: "assets/icons/leetcode.png",
                  bgColor: Colors.black,
                  txtColor: Colors.white,
                  isMobile: widget.isMobile, 
                  url: "https://leetcode.com/u/its_kartike/",
                ),
                SocialProfile(
                  profilName: "GeeksForGeeks",
                  iconPath: "assets/icons/gfg.jpg",
                  bgColor: Colors.green,
                  txtColor: Colors.white,
                  isMobile: widget.isMobile, 
                  url: "https://www.geeksforgeeks.org/user/kumarkartik147359/",
                ),
                SocialProfile(
                  profilName: "CodeChef",
                  iconPath: "assets/icons/codechef.jpg",
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  isMobile: widget.isMobile, 
                  url: "https://www.codechef.com/users/its_kartike",
                ),
              ],
            ),
          ),
          AboutMe(
            isMobile: widget.isMobile,
          ),
        ],
      ),
    );
  }
}
