import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/widgets/my_profile.dart';
import 'package:portfolio/widgets/projects.dart';
import 'package:portfolio/widgets/skills.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMobile = false;
  final myProfileKey = GlobalKey();
  final skillKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactMeKey = GlobalKey();
  String resumeUrl =
      "https://drive.google.com/file/d/1noAQJumuiq1fuSMwoQjZqQx2JNGKiEsd/view?usp=drive_link";
  List<Widget> naveItem = [];

  @override
  void initState() {
    super.initState();
    naveItem = [
      const SizedBox(
        height: 10,
        width: 10,
      ),
      ElevatedButton(
        onPressed: () async {
          final uri = Uri.parse(resumeUrl);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Could not launch $resumeUrl')),
            );
          }
        },
        style: const ButtonStyle(
          elevation: MaterialStatePropertyAll(5.0),
          shadowColor: MaterialStatePropertyAll(Colors.white),
          overlayColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 100, 50, 0)),
        ),
        child: Text(
          "My Resume",
          style: GoogleFonts.ubuntu(
            color: CustomColors.whitePrimary,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
        width: 10,
      ),
      ElevatedButton(
        onPressed: () {
          Scrollable.ensureVisible(
            myProfileKey.currentContext!,
            duration: const Duration(seconds: 1),
          );
        },
        style: const ButtonStyle(
          elevation: MaterialStatePropertyAll(5.0),
          shadowColor: MaterialStatePropertyAll(Colors.white),
          overlayColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 100, 50, 0)),
        ),
        child: Text(
          "My Profile",
          style: GoogleFonts.ubuntu(
            color: CustomColors.whitePrimary,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
        width: 10,
      ),
      ElevatedButton(
        onPressed: () {
          Scrollable.ensureVisible(
            skillKey.currentContext!,
            duration: const Duration(seconds: 1),
          );
        },
        style: const ButtonStyle(
          elevation: MaterialStatePropertyAll(5.0),
          shadowColor: MaterialStatePropertyAll(Colors.white),
          overlayColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 100, 50, 0)),
        ),
        child: Text(
          "Skills",
          style: GoogleFonts.ubuntu(
            color: CustomColors.whitePrimary,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
        width: 10,
      ),
      ElevatedButton(
        onPressed: () {
          Scrollable.ensureVisible(
            projectKey.currentContext!,
            duration: const Duration(seconds: 1),
          );
        },
        style: const ButtonStyle(
          elevation: MaterialStatePropertyAll(5.0),
          shadowColor: MaterialStatePropertyAll(Colors.white),
          overlayColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 100, 50, 0)),
        ),
        child: Text(
          "Projects",
          style: GoogleFonts.ubuntu(
            color: CustomColors.whitePrimary,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
        width: 10,
      ),
      ElevatedButton(
        onPressed: () {
          Scrollable.ensureVisible(
            contactMeKey.currentContext!,
            duration: const Duration(seconds: 1),
          );
        },
        style: const ButtonStyle(
          elevation: MaterialStatePropertyAll(5.0),
          shadowColor: MaterialStatePropertyAll(Colors.white),
          overlayColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 100, 50, 0)),
        ),
        child: Text(
          "Contact Me",
          style: GoogleFonts.ubuntu(
            color: CustomColors.whitePrimary,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
        width: 10,
      ),
    ];
  }

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
        actions: isMobile ? null : naveItem,
      ),
      drawer: isMobile
          ? Drawer(
              child: ListView(
                children: naveItem,
              ),
            )
          : null,
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 10),
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
            const SizedBox(
              height: 20,
            ),

            //-------------------------PROJECTS-------------------------
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
            Projects(),
            const SizedBox(
              height: 20,
            ),
            //------------------CONTACT--------------------
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
    );
  }
}
