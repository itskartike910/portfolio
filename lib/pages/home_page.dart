import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';

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
      drawer: isMobile ? Drawer() : null,
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(vertical: 10),
            children: [
              //MAIN
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                height: 400,
                width: double.maxFinite,
                decoration: CustomColors.cardDecoration,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Hello, I'm\nKartik Kumar",
                        style: GoogleFonts.dancingScript(
                          color: CustomColors.whitePrimary,
                          fontWeight: FontWeight.w900,
                          fontSize: isMobile ? 26 : 32,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CircleAvatar(
                      radius: isMobile ? 80 : 120,
                      backgroundImage: const AssetImage("assets/profile.jpg"),
                    ),
                  ],
                ),
              )
              //SKILLS

              //PROJECTS

              //CONTACT
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  ProjectCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
