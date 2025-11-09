import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/widgets/contact_me.dart';
import 'package:portfolio/widgets/experience.dart';
import 'package:portfolio/widgets/my_profile.dart';
import 'package:portfolio/widgets/projects.dart';
import 'package:portfolio/widgets/skills.dart';
import 'package:portfolio/widgets/achievements.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMobile = false;
  final myProfileKey = GlobalKey();
  final skillKey = GlobalKey();
  final experienceKey = GlobalKey();
  final achievementKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactMeKey = GlobalKey();
  String resumeUrl =
      "https://drive.google.com/file/d/1noAQJumuiq1fuSMwoQjZqQx2JNGKiEsd/view?usp=sharing";
  List<Widget> naveItem = [];

  @override
  void initState() {
    super.initState();
    naveItem = [
      _buildNavButton(
        label: "My Profile",
        icon: Icons.person_outline,
        onPressed: () {
          Scrollable.ensureVisible(
            myProfileKey.currentContext!,
            duration: const Duration(seconds: 1),
          );
        },
      ),
      const SizedBox(
        height: 10,
        width: 5,
      ),
      _buildNavButton(
        label: "Experiences",
        icon: Icons.work_outline,
        onPressed: () {
          Scrollable.ensureVisible(
            experienceKey.currentContext!,
            duration: const Duration(seconds: 1),
          );
        },
      ),
      const SizedBox(
        height: 10,
        width: 5,
      ),
      _buildNavButton(
        label: "Skills",
        icon: Icons.code_outlined,
        onPressed: () {
          Scrollable.ensureVisible(
            skillKey.currentContext!,
            duration: const Duration(seconds: 1),
          );
        },
      ),
      const SizedBox(
        height: 10,
        width: 5,
      ),
      _buildNavButton(
        label: "Achievements",
        icon: Icons.emoji_events_outlined,
        onPressed: () {
          Scrollable.ensureVisible(
            achievementKey.currentContext!,
            duration: const Duration(seconds: 1),
          );
        },
      ),
      const SizedBox(
        height: 10,
        width: 5,
      ),
      _buildNavButton(
        label: "Projects",
        icon: Icons.folder_outlined,
        onPressed: () {
          Scrollable.ensureVisible(
            projectKey.currentContext!,
            duration: const Duration(seconds: 1),
          );
        },
      ),
      const SizedBox(
        height: 10,
        width: 5,
      ),
      _buildNavButton(
        label: "Contact Me",
        icon: Icons.email_outlined,
        onPressed: () {
          Scrollable.ensureVisible(
            contactMeKey.currentContext!,
            duration: const Duration(seconds: 1),
          );
        },
      ),
      const SizedBox(
        height: 10,
        width: 5,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width < 1000 ? true : false;
    return Scaffold(
      backgroundColor: CustomColors.scaffoldBG,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: CustomColors.appBarBG,
        toolbarHeight: 70,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CustomColors.primaryAccent.withOpacity(0.2),
                    CustomColors.purpleAccent.withOpacity(0.2),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: CustomColors.primaryAccent.withOpacity(0.3),
                ),
              ),
              child: Icon(
                Icons.person_pin_outlined,
                color: CustomColors.primaryAccent,
                size: 28,
              ),
            ),
            const SizedBox(width: 12),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  CustomColors.primaryAccent,
                  CustomColors.purpleAccent,
                ],
              ).createShader(bounds),
              child: Text(
                "Portfolio",
                style: GoogleFonts.playfairDisplay(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
        actions: isMobile ? null : naveItem,
      ),
      drawer: isMobile
          ? Drawer(
              backgroundColor: CustomColors.scaffoldBG,
              child: Column(
                children: [
                  // Drawer Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          CustomColors.primaryAccent.withOpacity(0.2),
                          CustomColors.purpleAccent.withOpacity(0.2),
                        ],
                      ),
                      border: Border(
                        bottom: BorderSide(
                          color: CustomColors.primaryAccent.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: CustomColors.primaryAccent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: CustomColors.primaryAccent.withOpacity(0.4),
                            ),
                          ),
                          child: Icon(
                            Icons.person_pin_outlined,
                            color: CustomColors.primaryAccent,
                            size: 40,
                          ),
                        ),
                        const SizedBox(height: 15),
                        ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: [
                              CustomColors.primaryAccent,
                              CustomColors.purpleAccent,
                            ],
                          ).createShader(bounds),
                          child: Text(
                            "Kartik Kumar",
                            style: GoogleFonts.playfairDisplay(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Software Engineer",
                          style: GoogleFonts.ubuntu(
                            color: CustomColors.whiteSecondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Navigation Items
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      children: naveItem,
                    ),
                  ),
                  // Footer
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: CustomColors.borderColorLight.withOpacity(0.2),
                        ),
                      ),
                    ),
                    child: Text(
                      "© Handcrafted by me (Using Flutter Web)",
                      style: GoogleFonts.ubuntu(
                        color: CustomColors.whiteSecondary,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          : null,
      body: Container(
        decoration: BoxDecoration(
          gradient: CustomColors.backgroundGradient,
        ),
        child: SafeArea(
          minimum: const EdgeInsets.all(10),
          maintainBottomViewPadding: true,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            child: Column(
              children: [
              //-----------------------MY_PROFILE--------------------
              Text(
                "My Profile",
                key: myProfileKey,
                style: GoogleFonts.playfair(
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 20 : 26,
                ),
                textAlign: TextAlign.center,
              ),
              MyProfile(
                isMobile: isMobile,
              ),
              const SizedBox(
                height: 20,
              ),
              //----------------------SKILLS--------------------------
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Column(
                    children: [
                      Text(
                        "Experiences",
                        key: experienceKey,
                        style: GoogleFonts.playfair(
                          color: CustomColors.whitePrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: isMobile ? 20 : 26,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Experience(
                        isMobile: isMobile,
                      ),
                    ],
                  ),
                  isMobile
                      ? const Text("")
                      : const SizedBox(
                          width: 20,
                        ),
                  Column(
                    children: [
                      Text(
                        "My Skills",
                        key: skillKey,
                        style: GoogleFonts.playfair(
                          color: CustomColors.whitePrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: isMobile ? 20 : 26,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Skills(),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              //------------------------ACHIEVEMENTS-----------------------
              Text(
                "Achievements",
                key: achievementKey,
                style: GoogleFonts.playfair(
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 20 : 26,
                ),
                textAlign: TextAlign.center,
              ),
              Achievements(isMobile: isMobile),
              const SizedBox(
                height: 20,
              ),

              //------------------------PROJECTS-----------------------
              Text(
                "My Projects",
                key: projectKey,
                style: GoogleFonts.playfair(
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 20 : 26,
                ),
                textAlign: TextAlign.center,
              ),
              const Projects(),
              const SizedBox(
                height: 20,
              ),
              //------------------------CONTACT-------------------------
              Text(
                "Contact Me",
                key: contactMeKey,
                style: GoogleFonts.playfair(
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 20 : 26,
                ),
                textAlign: TextAlign.center,
              ),
              ContactMe(isMobile: isMobile),
              const SizedBox(
                height: 20,
              ),
              Text(
                "© Handcrafted by me (Using Flutter Web)",
                style: GoogleFonts.ubuntu(
                  color: Colors.white38,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: CustomColors.primaryAccent,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.ubuntu(
              color: CustomColors.whitePrimary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
