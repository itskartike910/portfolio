import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/helpers/skills_card.dart';
import 'package:portfolio/helpers/social_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMobile = false;
  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width > 700 ? false : true;
    return Scaffold(
      backgroundColor: CustomColors.scaffoldBG,
      appBar: AppBar(
        backgroundColor: CustomColors.appBarBG,
        centerTitle: true,
        title: Text(
          "Portfolio",
          textAlign: TextAlign.center,
          style: GoogleFonts.playfair(
            color: CustomColors.appBarText,
            fontWeight: FontWeight.w900,
            fontSize: 28,
          ),
        ),
        actions: isMobile
            ? null
            : [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.work),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.contact_mail),
                ),
              ],
      ),
      drawer: isMobile ? const Drawer() : null,
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(vertical: 10),
            children: [
              //-----------------MAIN-----------------
              Text(
                "My Profile",
                style: GoogleFonts.playfair(
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 20 : 26,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                height: isMobile ? 600 : 450,
                width: double.maxFinite,
                decoration: CustomColors.cardDecoration1,
                child: Column(
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
                              backgroundImage:
                                  const AssetImage("assets/profile.jpg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "A final year Computer Science student at NIT PATNA. ",
                      style: GoogleFonts.playfairDisplay(
                        color: CustomColors.whitePrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: isMobile ? 15 : 18,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.maxFinite - 20,
                      decoration: CustomColors.cardDecoration1,
                      child: const Wrap(
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.spaceAround,
                        children: [
                          SocialProfile(
                            profilName: "LinkedIn",
                            iconPath: "assets/icons/linkedin.png",
                            bgColor: Color.fromARGB(255, 0, 20, 125),
                            txtColor: Colors.white,
                            url:
                                "https://www.linkedin.com/in/kartik-kumar-4277b4235/",
                          ),
                          SocialProfile(
                            profilName: "LeetCode",
                            iconPath: "assets/icons/leetcode.png",
                            bgColor: Colors.black,
                            txtColor: Colors.white,
                            url: "https://leetcode.com/u/its_kartike/",
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
              ),
              const SizedBox(
                height: 20,
              ),
              //---------------SKILLS---------------
              Text(
                "My Skills",
                style: GoogleFonts.playfair(
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 20 : 26,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
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
                    Skills(
                      skillName: "C++",
                      iconPath: "assets/icons/c++.png",
                    ),
                    Skills(
                      skillName: "C",
                      iconPath: "assets/icons/c-.png",
                    ),
                    Skills(
                      skillName: "MySQL",
                      iconPath: "assets/icons/mysql.png",
                    ),
                    Skills(
                      skillName: "Python",
                      iconPath: "assets/icons/python.png",
                    ),
                    Skills(
                      skillName: "Android",
                      iconPath: "assets/icons/android.png",
                    ),
                    Skills(
                      skillName: "Visual-Basic",
                      iconPath: "assets/icons/visual-basic.png",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //-------------------PROJECTS-------------------
              Text(
                "My Projects",
                style: GoogleFonts.playfair(
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 20 : 26,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                width: double.maxFinite,
                decoration: CustomColors.cardDecoration1,
                child: Wrap(),
              ),
              const SizedBox(
                height: 20,
              ),
              //------------------CONTACT--------------------
              Text(
                "Contact Me",
                style: GoogleFonts.playfair(
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 20 : 26,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                width: double.maxFinite,
                decoration: CustomColors.cardDecoration2,
                child: Wrap(),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
